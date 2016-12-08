library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity UART_Transmitter is
	port ( 
		clk : in std_logic;
		TX_RS232 : out std_logic;
		PC_Response_Ready : in std_logic;
		PC_Tx_Packet_Type : in std_logic_vector(2 downto 0);
		PC_Tx_Jack_Nember : in std_logic_vector(2 downto 0);
		PC_Tx_Parameter_Address : in std_logic_vector(7 downto 0);
		PC_Tx_Parameter_Value : in std_logic_vector(15 downto 0);
		PC_Tx_Jack1_Cyclic_Feedback : in std_logic_vector(31 downto 0);
		PC_Tx_Jack2_Cyclic_Feedback : in std_logic_vector(31 downto 0);
		PC_Tx_Jack3_Cyclic_Feedback : in std_logic_vector(31 downto 0);
		PC_Tx_Jack4_Cyclic_Feedback : in std_logic_vector(31 downto 0);
		PC_Tx_Jack5_Cyclic_Feedback : in std_logic_vector(31 downto 0);
		PC_Tx_Jack6_Cyclic_Feedback : in std_logic_vector(31 downto 0)
	);
end UART_Transmitter;

architecture Behavioral of UART_Transmitter is
	constant f_ref : natural := 16384000;
	constant baudrate : natural := 38400;
	constant baudrate_prescaler : natural := f_ref / baudrate;
	signal baudrate_prescaler_counter : integer range 0 to baudrate_prescaler := 0;
	type PC_Tx_array_type is array (0 to 25) of std_logic_vector(7 downto 0); 
	signal PC_Tx_Buffer : PC_TX_array_type := (others => (others => '0'));
	signal checksum : std_logic_vector(7 downto 0) := (others => '0');
	type FSM_state_type is (idle, capture, send_bit, prepare_next_bit);
	signal state : FSM_state_type := idle;
	signal bit_number : integer range 0 to 9 := 0;
	signal byte_number : integer range 0 to 25 := 0;
begin
	UART_Tx_FSM: process(clk)
		variable PC_Response_Ready_old : std_logic := '0';
	begin
		if rising_edge(clk) then
			if (baudrate_prescaler_counter >= baudrate_prescaler-1) then
				baudrate_prescaler_counter <= 0;
			else
				baudrate_prescaler_counter <= baudrate_prescaler_counter + 1;
			end if;
			case state is
				when idle =>
					TX_RS232 <= '1';
					bit_number <= 0;
					byte_number <= 0;
					if (PC_Response_Ready_old = '0' and PC_Response_Ready = '1') then
						state <= capture;
					end if;
				when capture =>
					case PC_Tx_Packet_Type is
						when "011" =>
							state <= send_bit;
							PC_Tx_Buffer(0) <= x"C3";
							PC_Tx_Buffer(1) <= "00000" & PC_Tx_Jack_Nember;
							PC_Tx_Buffer(2) <= PC_Tx_Parameter_Address;
							PC_Tx_Buffer(3) <= PC_Tx_Parameter_Value(15 downto 8);
							PC_Tx_Buffer(4) <= PC_Tx_Parameter_Value(7 downto 0);
							PC_Tx_Buffer(5 to 24) <= (others => (others => '0'));
						when "110" =>
							state <= send_bit;
							PC_Tx_Buffer(0) <= x"C6";
							PC_Tx_Buffer(1) <= PC_Tx_Jack1_Cyclic_Feedback(31 downto 24);
							PC_Tx_Buffer(2) <= PC_Tx_Jack1_Cyclic_Feedback(23 downto 16);
							PC_Tx_Buffer(3) <= PC_Tx_Jack1_Cyclic_Feedback(15 downto 8);
							PC_Tx_Buffer(4) <= PC_Tx_Jack1_Cyclic_Feedback(7 downto 0);
							PC_Tx_Buffer(5) <= PC_Tx_Jack2_Cyclic_Feedback(31 downto 24);
							PC_Tx_Buffer(6) <= PC_Tx_Jack2_Cyclic_Feedback(23 downto 16);
							PC_Tx_Buffer(7) <= PC_Tx_Jack2_Cyclic_Feedback(15 downto 8);
							PC_Tx_Buffer(8) <= PC_Tx_Jack2_Cyclic_Feedback(7 downto 0);
							PC_Tx_Buffer(9) <= PC_Tx_Jack3_Cyclic_Feedback(31 downto 24);
							PC_Tx_Buffer(10) <= PC_Tx_Jack3_Cyclic_Feedback(23 downto 16);
							PC_Tx_Buffer(11) <= PC_Tx_Jack3_Cyclic_Feedback(15 downto 8);
							PC_Tx_Buffer(12) <= PC_Tx_Jack3_Cyclic_Feedback(7 downto 0);
							PC_Tx_Buffer(13) <= PC_Tx_Jack4_Cyclic_Feedback(31 downto 24);
							PC_Tx_Buffer(14) <= PC_Tx_Jack4_Cyclic_Feedback(23 downto 16);
							PC_Tx_Buffer(15) <= PC_Tx_Jack4_Cyclic_Feedback(15 downto 8);
							PC_Tx_Buffer(16) <= PC_Tx_Jack4_Cyclic_Feedback(7 downto 0);
							PC_Tx_Buffer(17) <= PC_Tx_Jack5_Cyclic_Feedback(31 downto 24);
							PC_Tx_Buffer(18) <= PC_Tx_Jack5_Cyclic_Feedback(23 downto 16);
							PC_Tx_Buffer(19) <= PC_Tx_Jack5_Cyclic_Feedback(15 downto 8);
							PC_Tx_Buffer(20) <= PC_Tx_Jack5_Cyclic_Feedback(7 downto 0);
							PC_Tx_Buffer(21) <= PC_Tx_Jack6_Cyclic_Feedback(31 downto 24);
							PC_Tx_Buffer(22) <= PC_Tx_Jack6_Cyclic_Feedback(23 downto 16);
							PC_Tx_Buffer(23) <= PC_Tx_Jack6_Cyclic_Feedback(15 downto 8);
							PC_Tx_Buffer(24) <= PC_Tx_Jack6_Cyclic_Feedback(7 downto 0);
						when others =>
							state <= idle;
					end case;
				when send_bit =>
					if (baudrate_prescaler_counter = 0) then
						if (bit_number = 0) then
							TX_RS232 <= '0';
						elsif (bit_number = 9) then
							TX_RS232 <= '1';
						else	
							TX_RS232 <= PC_TX_Buffer(byte_number)(bit_number-1);
						end if;
						state <= prepare_next_bit;
					end if;
				when prepare_next_bit =>
					if (bit_number < 9) then
						bit_number <= bit_number + 1;
						state <= send_bit;
					else
						bit_number <= 0;
						if (byte_number < 25) then
							byte_number <= byte_number + 1;
							state <= send_bit;
						else
							byte_number <= 0;
							state <= idle;
						end if;
					end if;
			end case;
			PC_Response_Ready_old := PC_Response_Ready;
		end if;
	end process;
	
	checksum <= x"00" - (
				PC_Tx_Buffer(0) +
				PC_Tx_Buffer(1) +
				PC_Tx_Buffer(2) +
				PC_Tx_Buffer(3) +
				PC_Tx_Buffer(4) +
				PC_Tx_Buffer(5) +
				PC_Tx_Buffer(6) +
				PC_Tx_Buffer(7) +
				PC_Tx_Buffer(8) +
				PC_Tx_Buffer(9) +
				PC_Tx_Buffer(10) +
				PC_Tx_Buffer(11) +
				PC_Tx_Buffer(12) +
				PC_Tx_Buffer(13) +
				PC_Tx_Buffer(14) +
				PC_Tx_Buffer(15) +
				PC_Tx_Buffer(16) +
				PC_Tx_Buffer(17) +
				PC_Tx_Buffer(18) +
				PC_Tx_Buffer(19) +
				PC_Tx_Buffer(20) +
				PC_Tx_Buffer(21) +
				PC_Tx_Buffer(22) +
				PC_Tx_Buffer(23) +
				PC_Tx_Buffer(24)
				);
	
	PC_Tx_Buffer(25) <= checksum;
				
end Behavioral;

