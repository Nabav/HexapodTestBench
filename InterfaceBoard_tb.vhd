library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
 
entity InterfaceBoard_tb is
end InterfaceBoard_tb;
 
architecture behavior of InterfaceBoard_tb is 
 
	component InterfaceBoard
		port(
			clk : in  std_logic;
			RX_RS232 : in  std_logic;
			TX_RS232 : out  std_logic;
			RX_RS485 : in  std_logic;
			TX_RS485 : out  std_logic;
			DIR_RS485 : out  std_logic;
			debug_pin : out  std_logic_vector(31 downto 0)
		);
	end component;
    

	--Inputs
	signal clk : std_logic := '0';
	signal RX_RS232 : std_logic := '1';
	signal RX_RS485 : std_logic := '1';

	--Outputs
	signal TX_RS232 : std_logic;
	signal TX_RS485 : std_logic;
	signal DIR_RS485 : std_logic;
	signal debug_pin : std_logic_vector(31 downto 0);

	-- Clock period definitions
	constant clk_period : time := 61 ns;
	constant serial_period : time := 26 us;
	type PC_TX_array_type is array (0 to 25) of std_logic_vector(7 downto 0); 
	constant PC_TX_Buffer : PC_TX_array_type := (
		x"C1", 
		x"03", x"12", x"13", x"14", 
		x"00", x"00", x"00", x"00", 
		x"00", x"00", x"00", x"00", 
		x"00", x"00", x"00", x"00", 
		x"00", x"00", x"00", x"00", 
		x"00", x"00", x"00", x"00", 
		x"03");
--		x"C5", 
--		x"11", x"12", x"13", x"14", 
--		x"21", x"22", x"23", x"24", 
--		x"31", x"32", x"33", x"34", 
--		x"41", x"42", x"43", x"44", 
--		x"51", x"52", x"53", x"54", 
--		x"61", x"62", x"63", x"64", 
--		x"BF");
		
begin
 
	uut: InterfaceBoard port map (
		clk => clk,
		RX_RS232 => RX_RS232,
		TX_RS232 => TX_RS232,
		RX_RS485 => RX_RS485,
		TX_RS485 => TX_RS485,
		DIR_RS485 => DIR_RS485,
		debug_pin => debug_pin
	);

	clk_process :process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;

	RX_RS232_process: process
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
			end if;
		end if;
	end process;
	RX_RS485 <= TX_RS485;
end;
