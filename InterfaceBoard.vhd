library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity InterfaceBoard is
	port ( 
		clk : in std_logic;
		RX_RS232 : in std_logic;
		TX_RS232 : out std_logic;
		RX_RS485 : in std_logic;
		TX_RS485 : out std_logic;
		DIR_RS485 : out std_logic;
		debug_pin : out std_logic_vector(31 downto 0)
	);
end InterfaceBoard;

architecture Behavioral of InterfaceBoard is
	component Debounce is
		generic (
			depth : in natural
		);
		port ( 
			clk : in std_logic;
			original : in std_logic;
			filtered : out std_logic
		);
	end component;
	component UART_Receiver is
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
	end component;
	component UART_Transmitter is
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
	end component;
	component Frame_Transmitter is
		port ( 
			clk : in std_logic;
			TX_RS485 : out std_logic;
			Tx_Start : in std_logic;
			Tx_Frame_Type : in std_logic_vector(1 downto 0);
			Tx_Jack_Nember : in std_logic_vector(2 downto 0);
			Tx_Parameter_Address : in std_logic_vector(7 downto 0);
			Tx_Parameter_Value : in std_logic_vector(15 downto 0);
			Tx_Busy : out std_logic
		);
	end component;
	component Frame_Receiver is
		port ( 
			clk : in std_logic;
			RX_RS485 : in std_logic;
			Rx_Ready : out std_logic;
			Rx_Frame_Type : out std_logic_vector(1 downto 0);
			Rx_Jack_Nember : out std_logic_vector(2 downto 0);
			Rx_Parameter_Address : out std_logic_vector(7 downto 0);
			Rx_Parameter_Value : out std_logic_vector(15 downto 0)
		);
	end component;
	component Interface_Board_Main_State_Machine is
		port ( 
			clk : in std_logic;
			DIR_RS485 : out std_logic;
			PC_Rx_Data_Ready : in std_logic;
			PC_Rx_Packet_Type : in std_logic_vector(2 downto 0);
			PC_Rx_Jack_Nember : in std_logic_vector(2 downto 0);
			PC_Rx_Parameter_Address : in std_logic_vector(7 downto 0);
			PC_Rx_Parameter_Value : in std_logic_vector(15 downto 0);
			PC_Rx_Jack1_Cyclic_Command : in std_logic_vector(31 downto 0);
			PC_Rx_Jack2_Cyclic_Command : in std_logic_vector(31 downto 0);
			PC_Rx_Jack3_Cyclic_Command : in std_logic_vector(31 downto 0);
			PC_Rx_Jack4_Cyclic_Command : in std_logic_vector(31 downto 0);
			PC_Rx_Jack5_Cyclic_Command : in std_logic_vector(31 downto 0);
			PC_Rx_Jack6_Cyclic_Command : in std_logic_vector(31 downto 0);
			PC_Response_Ready : out std_logic;
			PC_Tx_Packet_Type : out std_logic_vector(2 downto 0);
			PC_Tx_Jack_Nember : out std_logic_vector(2 downto 0);
			PC_Tx_Parameter_Address : out std_logic_vector(7 downto 0);
			PC_Tx_Parameter_Value : out std_logic_vector(15 downto 0);
			PC_Tx_Jack1_Cyclic_Feedback : out std_logic_vector(31 downto 0);
			PC_Tx_Jack2_Cyclic_Feedback : out std_logic_vector(31 downto 0);
			PC_Tx_Jack3_Cyclic_Feedback : out std_logic_vector(31 downto 0);
			PC_Tx_Jack4_Cyclic_Feedback : out std_logic_vector(31 downto 0);
			PC_Tx_Jack5_Cyclic_Feedback : out std_logic_vector(31 downto 0);
			PC_Tx_Jack6_Cyclic_Feedback : out std_logic_vector(31 downto 0);
			Tx_Start : out std_logic;
			Tx_Frame_Type : out std_logic_vector(1 downto 0);
			Tx_Jack_Nember : out std_logic_vector(2 downto 0);
			Tx_Parameter_Address : out std_logic_vector(7 downto 0);
			Tx_Parameter_Value : out std_logic_vector(15 downto 0);
			Tx_Busy : in std_logic;
			Rx_Ready : in std_logic;
			Rx_Frame_Type : in std_logic_vector(1 downto 0);
			Rx_Jack_Nember : in std_logic_vector(2 downto 0);
			Rx_Parameter_Address : in std_logic_vector(7 downto 0);
			Rx_Parameter_Value : in std_logic_vector(15 downto 0)
		);
	end component;	
	signal RX_RS232_F : std_logic := '1';	
	signal PC_Rx_Data_Ready : std_logic := '0';
	signal PC_Rx_Packet_Type : std_logic_vector(2 downto 0) := (others => '0');
	signal PC_Rx_Jack_Nember : std_logic_vector(2 downto 0) := (others => '0');
	signal PC_Rx_Parameter_Address : std_logic_vector(7 downto 0) := (others => '0');
	signal PC_Rx_Parameter_Value : std_logic_vector(15 downto 0) := (others => '0');
	signal PC_Rx_Jack1_Cyclic_Command : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Rx_Jack2_Cyclic_Command : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Rx_Jack3_Cyclic_Command : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Rx_Jack4_Cyclic_Command : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Rx_Jack5_Cyclic_Command : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Rx_Jack6_Cyclic_Command : std_logic_vector(31 downto 0) := (others => '0');

	signal PC_Response_Ready : std_logic := '0';
	signal PC_Tx_Packet_Type : std_logic_vector(2 downto 0) := (others => '0');
	signal PC_Tx_Jack_Nember : std_logic_vector(2 downto 0) := (others => '0');
	signal PC_Tx_Parameter_Address : std_logic_vector(7 downto 0) := (others => '0');
	signal PC_Tx_Parameter_Value : std_logic_vector(15 downto 0) := (others => '0');
	signal PC_Tx_Jack1_Cyclic_Feedback : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Tx_Jack2_Cyclic_Feedback : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Tx_Jack3_Cyclic_Feedback : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Tx_Jack4_Cyclic_Feedback : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Tx_Jack5_Cyclic_Feedback : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_Tx_Jack6_Cyclic_Feedback : std_logic_vector(31 downto 0) := (others => '0');

	signal Tx_Start : std_logic := '0';
	signal Tx_Frame_Type : std_logic_vector(1 downto 0) := (others => '0');
	signal Tx_Jack_Nember : std_logic_vector(2 downto 0) := (others => '0');
	signal Tx_Parameter_Address : std_logic_vector(7 downto 0) := (others => '0');
	signal Tx_Parameter_Value : std_logic_vector(15 downto 0) := (others => '0');
	signal Tx_Busy : std_logic := '0';

	signal RX_RS485_F : std_logic := '1';	
	signal Rx_Ready : std_logic := '0';
	signal Rx_Frame_Type : std_logic_vector(1 downto 0) := (others => '0');
	signal Rx_Jack_Nember : std_logic_vector(2 downto 0) := (others => '0');
	signal Rx_Parameter_Address : std_logic_vector(7 downto 0) := (others => '0');
	signal Rx_Parameter_Value : std_logic_vector(15 downto 0) := (others => '0');
begin
	RX_RS232_Debounce_Filter : Debounce
		generic map (
			depth => 8
		)
		port map (
			clk => clk,
			original => RX_RS232,
			filtered => RX_RS232_F
		);
	
	PC_UART_Receiver : UART_Receiver
		port map (
			clk => clk,
			RX_RS232 => RX_RS232_F,
			PC_Rx_Data_Ready => PC_Rx_Data_Ready,
			PC_Rx_Packet_Type => PC_Rx_Packet_Type,
			PC_Rx_Jack_Nember => PC_Rx_Jack_Nember,
			PC_Rx_Parameter_Address => PC_Rx_Parameter_Address,
			PC_Rx_Parameter_Value => PC_Rx_Parameter_Value,
			PC_Rx_Jack1_Cyclic_Command => PC_Rx_Jack1_Cyclic_Command,
			PC_Rx_Jack2_Cyclic_Command => PC_Rx_Jack2_Cyclic_Command,
			PC_Rx_Jack3_Cyclic_Command => PC_Rx_Jack3_Cyclic_Command,
			PC_Rx_Jack4_Cyclic_Command => PC_Rx_Jack4_Cyclic_Command,
			PC_Rx_Jack5_Cyclic_Command => PC_Rx_Jack5_Cyclic_Command,
			PC_Rx_Jack6_Cyclic_Command => PC_Rx_Jack6_Cyclic_Command
		);
	
	PC_UART_Transmitter : UART_Transmitter
		port map ( 
			clk => clk,
			TX_RS232 => TX_RS232,
			PC_Response_Ready => PC_Response_Ready,
			PC_Tx_Packet_Type => PC_Tx_Packet_Type,
			PC_Tx_Jack_Nember => PC_Tx_Jack_Nember,
			PC_Tx_Parameter_Address => PC_Tx_Parameter_Address,
			PC_Tx_Parameter_Value => PC_Tx_Parameter_Value,
			PC_Tx_Jack1_Cyclic_Feedback => PC_Tx_Jack1_Cyclic_Feedback,
			PC_Tx_Jack2_Cyclic_Feedback => PC_Tx_Jack2_Cyclic_Feedback,
			PC_Tx_Jack3_Cyclic_Feedback => PC_Tx_Jack3_Cyclic_Feedback,
			PC_Tx_Jack4_Cyclic_Feedback => PC_Tx_Jack4_Cyclic_Feedback,
			PC_Tx_Jack5_Cyclic_Feedback => PC_Tx_Jack5_Cyclic_Feedback,
			PC_Tx_Jack6_Cyclic_Feedback => PC_Tx_Jack6_Cyclic_Feedback
		);
	
	RS485_Frame_Transmitter : Frame_Transmitter
		port map ( 
			clk => clk,
			TX_RS485 => TX_RS485,
			Tx_Start => Tx_Start,
			Tx_Frame_Type => Tx_Frame_Type,
			Tx_Jack_Nember => Tx_Jack_Nember,
			Tx_Parameter_Address => Tx_Parameter_Address,
			Tx_Parameter_Value => Tx_Parameter_Value,
			Tx_Busy => Tx_Busy
		);

	RX_RS485_Debounce_Filter : Debounce
		generic map (
			depth => 4
		)
		port map (
			clk => clk,
			original => RX_RS485,
			filtered => RX_RS485_F
		);
	
	 RS485_Frame_Receiver : Frame_Receiver
		port map ( 
			clk => clk,
			RX_RS485 => RX_RS485_F,
			Rx_Ready => Rx_Ready,
			Rx_Frame_Type => Rx_Frame_Type,
			Rx_Jack_Nember => Rx_Jack_Nember,
			Rx_Parameter_Address => Rx_Parameter_Address,
			Rx_Parameter_Value => Rx_Parameter_Value
		);
	
	Main_FSM : Interface_Board_Main_State_Machine
		port map ( 
			clk => clk,
			DIR_RS485 => DIR_RS485,
			PC_Rx_Data_Ready => PC_Rx_Data_Ready,
			PC_Rx_Packet_Type => PC_Rx_Packet_Type,
			PC_Rx_Jack_Nember => PC_Rx_Jack_Nember,
			PC_Rx_Parameter_Address => PC_Rx_Parameter_Address,
			PC_Rx_Parameter_Value => PC_Rx_Parameter_Value,
			PC_Rx_Jack1_Cyclic_Command => PC_Rx_Jack1_Cyclic_Command,
			PC_Rx_Jack2_Cyclic_Command => PC_Rx_Jack2_Cyclic_Command,
			PC_Rx_Jack3_Cyclic_Command => PC_Rx_Jack3_Cyclic_Command,
			PC_Rx_Jack4_Cyclic_Command => PC_Rx_Jack4_Cyclic_Command,
			PC_Rx_Jack5_Cyclic_Command => PC_Rx_Jack5_Cyclic_Command,
			PC_Rx_Jack6_Cyclic_Command => PC_Rx_Jack6_Cyclic_Command,
			PC_Response_Ready => PC_Response_Ready,
			PC_Tx_Packet_Type => PC_Tx_Packet_Type,
			PC_Tx_Jack_Nember => PC_Tx_Jack_Nember,
			PC_Tx_Parameter_Address => PC_Tx_Parameter_Address,
			PC_Tx_Parameter_Value => PC_Tx_Parameter_Value,
			PC_Tx_Jack1_Cyclic_Feedback => PC_Tx_Jack1_Cyclic_Feedback,
			PC_Tx_Jack2_Cyclic_Feedback => PC_Tx_Jack2_Cyclic_Feedback,
			PC_Tx_Jack3_Cyclic_Feedback => PC_Tx_Jack3_Cyclic_Feedback,
			PC_Tx_Jack4_Cyclic_Feedback => PC_Tx_Jack4_Cyclic_Feedback,
			PC_Tx_Jack5_Cyclic_Feedback => PC_Tx_Jack5_Cyclic_Feedback,
			PC_Tx_Jack6_Cyclic_Feedback => PC_Tx_Jack6_Cyclic_Feedback,
			Tx_Start => Tx_Start,
			Tx_Frame_Type => Tx_Frame_Type,
			Tx_Jack_Nember => Tx_Jack_Nember,
			Tx_Parameter_Address => Tx_Parameter_Address,
			Tx_Parameter_Value => Tx_Parameter_Value,
			Tx_Busy => Tx_Busy,
			Rx_Ready => Rx_Ready,
			Rx_Frame_Type => Rx_Frame_Type,
			Rx_Jack_Nember => Rx_Jack_Nember,
			Rx_Parameter_Address => Rx_Parameter_Address,
			Rx_Parameter_Value => Rx_Parameter_Value
		);

	debug_pin(0) <= PC_Rx_Data_Ready;
	debug_pin(2 downto 1) <= Rx_Frame_Type;
	debug_pin(5 downto 3) <= Rx_Jack_Nember;
	debug_pin(13 downto 6) <= Rx_Parameter_Address;
	debug_pin(29 downto 14) <= Rx_Parameter_Value;
end Behavioral;

