library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
 
entity HexapodTestBench is
end HexapodTestBench;
 
architecture behavior of HexapodTestBench is
	component InterfaceBoard is
	port(
		 clk : IN  std_logic;
		 RX_RS232 : IN  std_logic;
		 TX_RS232 : OUT  std_logic;
		 RX_RS485 : IN  std_logic;
		 TX_RS485 : OUT  std_logic;
		 DIR_RS485 : OUT  std_logic
		);
	end component;
	component JackController is
		port ( 
			clk : in std_logic;
			RX_RS485 : in std_logic;
			TX_RS485 : out std_logic;
			DIR_RS485 : out std_logic;
			Parameter_Bank_Jack_ID : in std_logic_vector(2 downto 0);
			Parameter_Bank_Read_Request : out std_logic;
			Parameter_Bank_Read_Address : out std_logic_vector(7 downto 0);
			Parameter_Bank_Read_Response : in std_logic;
			Parameter_Bank_Read_Data : in std_logic_vector(15 downto 0);
			Parameter_Bank_Write_Request : out std_logic;
			Parameter_Bank_Write_Address : out std_logic_vector(7 downto 0);
			Parameter_Bank_Write_Data : out std_logic_vector(15 downto 0);
			Parameter_Bank_Write_Done : in std_logic
		);
	end component;   

	constant clk_period : time := 61035 ps;
	constant serial_period : time := 26 us;
	signal clk : std_logic := '0';
	signal Line_RS485 : std_logic := '1';
	type PC_TX_array_type is array (0 to 25) of std_logic_vector(7 downto 0); 
	signal PC_TX_Buffer : PC_TX_array_type := (
--		x"C1", 
--		x"03", x"12", x"13", x"14", 
--		x"00", x"00", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00");
--		x"C2", 
--		x"02", x"3E", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00", x"00", x"00", x"00", 
--		x"00");
		x"C5", 
		x"11", x"12", x"13", x"14", 
		x"21", x"22", x"23", x"24", 
		x"31", x"32", x"33", x"34", 
		x"41", x"42", x"43", x"44", 
		x"51", x"52", x"53", x"54", 
		x"61", x"62", x"63", x"64", 
		x"00");
	
	signal RX_RS232 : std_logic := '1';
	signal RX_RS485_InterfaceBoard : std_logic := '1';
	signal TX_RS232 : std_logic := '1';
	signal TX_RS485_InterfaceBoard : std_logic := '1';
	signal DIR_RS485_InterfaceBoard : std_logic := '0';
	type bit_array is array (0 to 5) of std_logic;
	type vector3_array is array (0 to 5) of std_logic_vector(2 downto 0);
	type vector8_array is array (0 to 5) of std_logic_vector(7 downto 0);
	type vector16_array is array (0 to 5) of std_logic_vector(15 downto 0);
	signal RX_RS485_Jack : bit_array := (others => '1');
	signal TX_RS485_Jack : bit_array := (others => '1');
	signal DIR_RS485_Jack : bit_array := (others => '0');
	signal Parameter_Bank_Jack_ID : vector3_array := ("001", "010", "011", "100", "101", "110");
	signal Parameter_Bank_Read_Request : bit_array := (others => '0');
	signal Parameter_Bank_Read_Address : vector8_array := (others => (others => '0'));
	signal Parameter_Bank_Read_Response : bit_array := (others => '0');
	signal Parameter_Bank_Read_Data : vector16_array := (others => (others => '0'));
	signal Parameter_Bank_Write_Request : bit_array := (others => '0');
	signal Parameter_Bank_Write_Address : vector8_array := (others => (others => '0'));
	signal Parameter_Bank_Write_Data : vector16_array := (others => (others => '0'));
	signal Parameter_Bank_Write_Done : bit_array := (others => '0');
begin
	InterfaceBoard_instantiation : InterfaceBoard
		port map (
			clk => clk,
			RX_RS232 => RX_RS232,
			TX_RS232 => TX_RS232,
			RX_RS485 => RX_RS485_InterfaceBoard,
			TX_RS485 => TX_RS485_InterfaceBoard,
			DIR_RS485 => DIR_RS485_InterfaceBoard
		);
	Jacks_instantiation: for i in 0 to 5 generate
	begin
		uut_JackController : JackController
			port map ( 
				clk => clk,
				RX_RS485 => RX_RS485_Jack(i),
				TX_RS485 => TX_RS485_Jack(i),
				DIR_RS485 => DIR_RS485_Jack(i),
				Parameter_Bank_Jack_ID => Parameter_Bank_Jack_ID(i),
				Parameter_Bank_Read_Request => Parameter_Bank_Read_Request(i),
				Parameter_Bank_Read_Address => Parameter_Bank_Read_Address(i),
				Parameter_Bank_Read_Response => Parameter_Bank_Read_Response(i),
				Parameter_Bank_Read_Data => Parameter_Bank_Read_Data(i),
				Parameter_Bank_Write_Request => Parameter_Bank_Write_Request(i),
				Parameter_Bank_Write_Address => Parameter_Bank_Write_Address(i),
				Parameter_Bank_Write_Data => Parameter_Bank_Write_Data(i),
				Parameter_Bank_Write_Done => Parameter_Bank_Write_Done(i)
			);
	end generate;
	
	Line_RS485 <=	TX_RS485_InterfaceBoard when (DIR_RS485_InterfaceBoard = '1') else
					TX_RS485_Jack(0) when (DIR_RS485_Jack(0) = '1') else
					TX_RS485_Jack(1) when (DIR_RS485_Jack(1) = '1') else
					TX_RS485_Jack(2) when (DIR_RS485_Jack(2) = '1') else
					TX_RS485_Jack(3) when (DIR_RS485_Jack(3) = '1') else
					TX_RS485_Jack(4) when (DIR_RS485_Jack(4) = '1') else
					TX_RS485_Jack(5) when (DIR_RS485_Jack(5) = '1') else
					'1';
	RX_RS485_InterfaceBoard <= Line_RS485 when (DIR_RS485_InterfaceBoard = '0') else '1';
	jacks_signals: for i in 0 to 5 generate
	begin
		RX_RS485_Jack(i) <= Line_RS485 when (DIR_RS485_Jack(i) = '0') else '1';
		Parameter_Bank_Read_Response(i) <= transport Parameter_Bank_Read_Request(i) after 200 ns;
		Parameter_Bank_Write_Done(i) <= transport Parameter_Bank_Write_Request(i) after 200 ns;
	end generate;
	
	clk_generation :process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process; 

	PC_TX_Buffer(25) <= x"00" - (
						PC_TX_Buffer(0) +
						PC_TX_Buffer(1) +
						PC_TX_Buffer(2) +
						PC_TX_Buffer(3) +
						PC_TX_Buffer(4) +
						PC_TX_Buffer(5) +
						PC_TX_Buffer(6) +
						PC_TX_Buffer(7) +
						PC_TX_Buffer(8) +
						PC_TX_Buffer(9) +
						PC_TX_Buffer(10) +
						PC_TX_Buffer(11) +
						PC_TX_Buffer(12) +
						PC_TX_Buffer(13) +
						PC_TX_Buffer(14) +
						PC_TX_Buffer(15) +
						PC_TX_Buffer(16) +
						PC_TX_Buffer(17) +
						PC_TX_Buffer(18) +
						PC_TX_Buffer(19) +
						PC_TX_Buffer(20) +
						PC_TX_Buffer(21) +
						PC_TX_Buffer(22) +
						PC_TX_Buffer(23) +
						PC_TX_Buffer(24)
						);
	PC_Simulation: process
		variable bit_number : integer range 0 to 9 := 0;
		variable byte_number : integer range 0 to 25 := 0;
	begin
		wait for serial_period;
		if (bit_number = 0) then
			RX_RS232 <= '0';
		elsif (bit_number = 9) then
			RX_RS232 <= '1';
		else	
			RX_RS232 <= PC_TX_Buffer(byte_number)(bit_number-1);
		end if;
		if (bit_number < 9) then
			bit_number := bit_number + 1;
		else
			bit_number := 0;
			if (byte_number < 25) then
				byte_number := byte_number + 1;
			else
				byte_number := 0;
				wait for 33214 us;
			end if;
		end if;
	end process;
end;