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
		 DIR_RS485 : OUT  std_logic;
		 debug_pin : OUT  std_logic_vector(31 downto 0)
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
			Parameter_Bank_Write_Done : in std_logic;
			debug_pin : out std_logic_vector(31 downto 0)
		);
	end component;   

	constant clk_period : time := 61035 ps;
	signal clk : std_logic := '0';
	signal RX_RS232 : std_logic := '1';
	signal RX_RS485 : std_logic := '1';
	signal TX_RS232 : std_logic;
	signal TX_RS485 : std_logic;
	signal DIR_RS485 : std_logic;
	signal debug_pin : std_logic_vector(31 downto 0);
	type bit_array is array (0 to 5) of std_logic;
	type vector3_array is array (0 to 5) of std_logic_vector(2 downto 0);
	type vector8_array is array (0 to 5) of std_logic_vector(7 downto 0);
	type vector16_array is array (0 to 5) of std_logic_vector(15 downto 0);
	signal RX_RS485_Jack : bit_array := (others => '1');
	signal TX_RS485_Jack : bit_array := (others => '1');
begin
 
	uut_InterfaceBoard : InterfaceBoard
		port map (
			clk => clk,
			RX_RS232 => RX_RS232,
			TX_RS232 => TX_RS232,
			RX_RS485 => RX_RS485,
			TX_RS485 => TX_RS485,
			DIR_RS485 => DIR_RS485,
			debug_pin => debug_pin
		);
	
	jacks: for i in 0 to 5 generate
	begin
		uut_JackController1 : JackController
			port map ( 
				clk => clk,
				RX_RS485 => RX_RS485_Jack(i),
				TX_RS485 => TX_RS485_Jack(i),
				DIR_RS485 => open,
				Parameter_Bank_Jack_ID => "001",
				Parameter_Bank_Read_Request => open,
				Parameter_Bank_Read_Address => open,
				Parameter_Bank_Read_Response => '0',
				Parameter_Bank_Read_Data => (others => '0'),
				Parameter_Bank_Write_Request => open,
				Parameter_Bank_Write_Address => open,
				Parameter_Bank_Write_Data => open,
				Parameter_Bank_Write_Done => '0',
				debug_pin => open
			);
	end generate;
		
	clk_process :process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process; 

end;
