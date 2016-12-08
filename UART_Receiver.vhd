library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity UART_Receiver is
	port ( 
		clk : in std_logic;
		RX_RS232 : in std_logic;
		PC_Rx_Data_Ready : out std_logic;
		PC_Rx_Packet_Type : out std_logic_vector(2 downto 0);
		PC_Rx_Jack_Nember : out std_logic_vector(2 downto 0);
		PC_Rx_Parameter_Address : out std_logic_vector(7 downto 0);
		PC_Rx_Parameter_Value : out std_logic_vector(15 downto 0);
		PC_Rx_Jack1_Cyclic_Command : out std_logic_vector(31 downto 0);
		PC_Rx_Jack2_Cyclic_Command : out std_logic_vector(31 downto 0);
		PC_Rx_Jack3_Cyclic_Command : out std_logic_vector(31 downto 0);
		PC_Rx_Jack4_Cyclic_Command : out std_logic_vector(31 downto 0);
		PC_Rx_Jack5_Cyclic_Command : out std_logic_vector(31 downto 0);
		PC_Rx_Jack6_Cyclic_Command : out std_logic_vector(31 downto 0)
	);
end UART_Receiver;

architecture Behavioral of UART_Receiver is
	constant f_ref : natural := 16384000;
	constant baudrate : natural := 38400;
	constant baudrate_prescaler : natural := f_ref / baudrate;
	signal baudrate_prescaler_counter : integer range 0 to baudrate_prescaler := 0;
	signal clk_rx : std_logic := '0';
	signal received_byte : std_logic_vector(7 downto 0) := (others => '1');
	signal received_byte_ready : std_logic := '0';
	type PC_Rx_array_type is array (0 to 25) of std_logic_vector(7 downto 0); 
	signal PC_Rx_Buffer : PC_RX_array_type := (others => (others => '0'));
	signal checksum : std_logic_vector(7 downto 0) := (others => '0');
begin
	Clock_Synchronizer: process(clk)
		variable RX_RS232_old : std_logic := '1';
	begin
		if rising_edge(clk) then
			if ((RX_RS232_old = '1' and RX_RS232 = '0') 
				or 
				baudrate_prescaler_counter >= baudrate_prescaler-1) then
				baudrate_prescaler_counter <= 0;
			else
				baudrate_prescaler_counter <= baudrate_prescaler_counter + 1;
			end if;
			if (baudrate_prescaler_counter < (baudrate_prescaler / 2)) then
				clk_rx <= '0';
			else
				clk_rx <= '1';
			end if;
			RX_RS232_old := RX_RS232;
		end if;
	end process;
	
	Serial_Rx_Shift_Register: process(clk)
		variable clk_rx_old : std_logic := '0';
		variable sr : std_logic_vector(9 downto 0) := (others => '1');
	begin
		if rising_edge(clk) then
			if (clk_rx_old = '0' and clk_rx = '1') then
				sr := RX_RS232 & sr(9 downto 1);
				if (sr(9) = '1' and sr(0) = '0') then
					received_byte <= sr(8 downto 1);
					received_byte_ready <= '1';
					sr := (others => '1');
				else
					received_byte_ready <= '0';
				end if;
			end if;
			clk_rx_old := clk_rx;
		end if;
	end process;
	
	Frame_Decoder : process(clk)
		variable received_byte_ready_old : std_logic := '0';
	begin
		if rising_edge(clk) then
			if (received_byte_ready_old = '0' and received_byte_ready = '1') then
				PC_Rx_Buffer <= PC_Rx_Buffer(1 to 25) & received_byte;
			end if;
			if (received_byte_ready_old = '1' and received_byte_ready = '0') then
				if (PC_Rx_Buffer(0)(7 downto 3) = "11000" and checksum = x"00") then
					case (PC_Rx_Buffer(0)(2 downto 0)) is
						when "001" =>
							PC_Rx_Data_Ready <= '1';
							PC_Rx_Packet_Type <= PC_Rx_Buffer(0)(2 downto 0);
							PC_Rx_Jack_Nember <= PC_Rx_Buffer(1)(2 downto 0);
							PC_Rx_Parameter_Address <= PC_Rx_Buffer(2);
							PC_Rx_Parameter_Value <= PC_Rx_Buffer(3) & PC_Rx_Buffer(4);
						when "010" =>
							PC_Rx_Data_Ready <= '1';
							PC_Rx_Packet_Type <= PC_Rx_Buffer(0)(2 downto 0);
							PC_Rx_Jack_Nember <= PC_Rx_Buffer(1)(2 downto 0);
							PC_Rx_Parameter_Address <= PC_Rx_Buffer(2);
						when "101" =>
							PC_Rx_Data_Ready <= '1';
							PC_Rx_Packet_Type <= PC_Rx_Buffer(0)(2 downto 0);
							PC_Rx_Jack1_Cyclic_Command <= PC_Rx_Buffer(1) & PC_Rx_Buffer(2) & PC_Rx_Buffer(3) & PC_Rx_Buffer(4);
							PC_Rx_Jack2_Cyclic_Command <= PC_Rx_Buffer(5) & PC_Rx_Buffer(6) & PC_Rx_Buffer(7) & PC_Rx_Buffer(8);
							PC_Rx_Jack3_Cyclic_Command <= PC_Rx_Buffer(9) & PC_Rx_Buffer(10) & PC_Rx_Buffer(11) & PC_Rx_Buffer(12);
							PC_Rx_Jack4_Cyclic_Command <= PC_Rx_Buffer(13) & PC_Rx_Buffer(14) & PC_Rx_Buffer(15) & PC_Rx_Buffer(16);
							PC_Rx_Jack5_Cyclic_Command <= PC_Rx_Buffer(17) & PC_Rx_Buffer(18) & PC_Rx_Buffer(19) & PC_Rx_Buffer(20);
							PC_Rx_Jack6_Cyclic_Command <= PC_Rx_Buffer(21) & PC_Rx_Buffer(22) & PC_Rx_Buffer(23) & PC_Rx_Buffer(24);
						when others =>
							PC_Rx_Data_Ready <= '0';
					end case;
				else
					PC_Rx_Data_Ready <= '0';
				end if;
			end if;			
			received_byte_ready_old := received_byte_ready;
		end if;
	end process;
	
	checksum <= PC_Rx_Buffer(0) +
				PC_Rx_Buffer(1) +
				PC_Rx_Buffer(2) +
				PC_Rx_Buffer(3) +
				PC_Rx_Buffer(4) +
				PC_Rx_Buffer(5) +
				PC_Rx_Buffer(6) +
				PC_Rx_Buffer(7) +
				PC_Rx_Buffer(8) +
				PC_Rx_Buffer(9) +
				PC_Rx_Buffer(10) +
				PC_Rx_Buffer(11) +
				PC_Rx_Buffer(12) +
				PC_Rx_Buffer(13) +
				PC_Rx_Buffer(14) +
				PC_Rx_Buffer(15) +
				PC_Rx_Buffer(16) +
				PC_Rx_Buffer(17) +
				PC_Rx_Buffer(18) +
				PC_Rx_Buffer(19) +
				PC_Rx_Buffer(20) +
				PC_Rx_Buffer(21) +
				PC_Rx_Buffer(22) +
				PC_Rx_Buffer(23) +
				PC_Rx_Buffer(24) +
				PC_Rx_Buffer(25);
				
end Behavioral;

