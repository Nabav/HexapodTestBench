library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Interface_Board_Main_State_Machine is
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
end Interface_Board_Main_State_Machine;

architecture Behavioral of Interface_Board_Main_State_Machine is
	constant max_timeout : integer := 5000;
	type FSM_state_type is (idle, decode, 
							write_request, wait_for_write_request_transmitted,
							read_request, wait_for_read_request_transmitted, wait_for_read_done, read_response,
							cyclic_command, cyclic_write, wait_for_cyclic_write_transmitted,
							write_latch_commands, wait_for_write_latch_commands_transmitted,
							write_latch_feedbacks, wait_for_write_latch_feedbacks_transmitted,
							cyclic_feedback, cyclic_read, wait_for_cyclic_read_transmitted,
							wait_for_cyclic_read_done, check_end_of_read_sequence, cyclic_feedback_response
							);
	signal state : FSM_state_type := idle;
	signal sequence_number : integer range 0 to 11 := 0;
	signal sequence_number_vector : std_logic_vector(3 downto 0) := (others => '0');
	signal jack_of_the_sequence : std_logic_vector(2 downto 0) := (others => '0');
	signal write_address_of_the_sequence : std_logic_vector(7 downto 0) := (others => '0');
	signal read_address_of_the_sequence : std_logic_vector(7 downto 0) := (others => '0');
	type jack_array is array (0 to 11) of std_logic_vector(15 downto 0);
	signal jack_commands : jack_array := (others => (others => '0'));
	signal jack_feedbacks : jack_array := (others => (others => '0'));
begin
	DIR_RS485 <= Tx_Busy;
	
	sequence_number_vector <= std_logic_vector(to_unsigned(sequence_number, sequence_number_vector'length));
	jack_of_the_sequence <= sequence_number_vector(3 downto 1) + "001";
	write_address_of_the_sequence <= x"C8" when (sequence_number_vector(0) = '0') else x"C9";
	read_address_of_the_sequence <= x"CA" when (sequence_number_vector(0) = '0') else x"CB";

	jack_commands(0)  <= PC_Rx_Jack1_Cyclic_Command(31 downto 16);
	jack_commands(1)  <= PC_Rx_Jack1_Cyclic_Command(15 downto 0);
	jack_commands(2)  <= PC_Rx_Jack2_Cyclic_Command(31 downto 16);
	jack_commands(3)  <= PC_Rx_Jack2_Cyclic_Command(15 downto 0);
	jack_commands(4)  <= PC_Rx_Jack3_Cyclic_Command(31 downto 16);
	jack_commands(5)  <= PC_Rx_Jack3_Cyclic_Command(15 downto 0);
	jack_commands(6)  <= PC_Rx_Jack4_Cyclic_Command(31 downto 16);
	jack_commands(7)  <= PC_Rx_Jack4_Cyclic_Command(15 downto 0);
	jack_commands(8)  <= PC_Rx_Jack5_Cyclic_Command(31 downto 16);
	jack_commands(9)  <= PC_Rx_Jack5_Cyclic_Command(15 downto 0);
	jack_commands(10) <= PC_Rx_Jack6_Cyclic_Command(31 downto 16);
	jack_commands(11) <= PC_Rx_Jack6_Cyclic_Command(15 downto 0);

	PC_Tx_Jack1_Cyclic_Feedback <= jack_feedbacks(0) & jack_feedbacks(1);
	PC_Tx_Jack2_Cyclic_Feedback <= jack_feedbacks(2) & jack_feedbacks(3);
	PC_Tx_Jack3_Cyclic_Feedback <= jack_feedbacks(4) & jack_feedbacks(5);
	PC_Tx_Jack4_Cyclic_Feedback <= jack_feedbacks(6) & jack_feedbacks(7);
	PC_Tx_Jack5_Cyclic_Feedback <= jack_feedbacks(8) & jack_feedbacks(9);
	PC_Tx_Jack6_Cyclic_Feedback <= jack_feedbacks(10) & jack_feedbacks(11);

	Main_FSM: process(clk)
		variable timeout_counter : integer range 0 to max_timeout := 0;
		variable PC_Rx_Data_Ready_old : std_logic := '0';
		variable Tx_Busy_old : std_logic := '0';
		variable Rx_Ready_old : std_logic := '0';
	begin
		if rising_edge(clk) then
			case state is
				when idle =>
					timeout_counter := 0;
					Tx_Start <= '0';
					PC_Response_Ready <= '0';
					if (PC_Rx_Data_Ready_old = '0' and PC_Rx_Data_Ready = '1') then
						state <= decode;
					end if;
				when decode =>
					case PC_Rx_Packet_Type is
						when "001" =>
							state <= write_request;
							Tx_Frame_Type <= "01";
							Tx_Jack_Nember <= PC_Rx_Jack_Nember;
							Tx_Parameter_Address <= PC_Rx_Parameter_Address;
							Tx_Parameter_Value <= PC_Rx_Parameter_Value;
						when "010" =>
							state <= read_request;
							Tx_Frame_Type <= "10";
							Tx_Jack_Nember <= PC_Rx_Jack_Nember;
							Tx_Parameter_Address <= PC_Rx_Parameter_Address;
							Tx_Parameter_Value <= (others => '0');
						when "101" =>
							sequence_number <= 0;
							state <= cyclic_command;
						when others =>
							state <= idle;
					end case;
				when write_request =>
					Tx_Start <= '1';
					state <= wait_for_write_request_transmitted;
				when wait_for_write_request_transmitted =>
					timeout_counter := timeout_counter + 1;
					if ((Tx_Busy_old = '1' and Tx_Busy = '0') or timeout_counter = max_timeout) then
						Tx_Start <= '0';
						timeout_counter := 0;
						state <= idle;
					end if;
				when read_request =>
					Tx_Start <= '1';
					state <= wait_for_read_request_transmitted;
				when wait_for_read_request_transmitted =>
					timeout_counter := timeout_counter + 1;
					if (Tx_Busy_old = '1' and Tx_Busy = '0') then
						Tx_Start <= '0';
						state <= wait_for_read_done;
					elsif (timeout_counter = max_timeout) then
						Tx_Start <= '0';
						timeout_counter := 0;
						state <= idle;
					end if;
				when wait_for_read_done =>
					if (Rx_Ready_old = '0' and Rx_Ready = '1') then
						if ((PC_Rx_Jack_Nember = Rx_Jack_Nember) and (PC_Rx_Parameter_Address = Rx_Parameter_Address)) then
							state <= read_response;
							PC_Tx_Packet_Type <= "011";
							PC_Tx_Jack_Nember <= Rx_Jack_Nember;
							PC_Tx_Parameter_Address <= Rx_Parameter_Address;
							PC_Tx_Parameter_Value <= Rx_Parameter_Value;
						else
							state <= idle;
						end if;
					elsif (timeout_counter = max_timeout) then
						timeout_counter := 0;
						state <= idle;
					end if;
				when read_response =>
					PC_Response_Ready <= '1';
					state <= idle;
				when cyclic_command =>
					Tx_Frame_Type <= "01";
					Tx_Jack_Nember <= jack_of_the_sequence;
					Tx_Parameter_Address <= write_address_of_the_sequence;
					Tx_Parameter_Value <= jack_commands(sequence_number);
					state <= cyclic_write;
				when cyclic_write =>
					Tx_Start <= '1';
					state <= wait_for_cyclic_write_transmitted;
				when wait_for_cyclic_write_transmitted =>
					timeout_counter := timeout_counter + 1;
					if (Tx_Busy_old = '1' and Tx_Busy = '0') then
						Tx_Start <= '0';
						timeout_counter := 0;
						if (sequence_number < 11) then
							sequence_number <= sequence_number + 1;
							state <= cyclic_command;
						else
							sequence_number <= 0;
							Tx_Frame_Type <= "01";
							Tx_Jack_Nember <= "111";
							Tx_Parameter_Address <= x"CC";
							Tx_Parameter_Value <= (0 => '1', others => '0');
							state <= write_latch_commands;
						end if;
					elsif (timeout_counter = max_timeout) then
						Tx_Start <= '0';
						timeout_counter := 0;
						state <= idle;
					end if;
				when write_latch_commands =>
					Tx_Start <= '1';
					state <= wait_for_write_latch_commands_transmitted;
				when wait_for_write_latch_commands_transmitted =>
					timeout_counter := timeout_counter + 1;
					if (Tx_Busy_old = '1' and Tx_Busy = '0') then
						Tx_Start <= '0';
						timeout_counter := 0;
						Tx_Frame_Type <= "01";
						Tx_Jack_Nember <= "111";
						Tx_Parameter_Address <= x"CC";
						Tx_Parameter_Value <= (1 => '1', others => '0');
						state <= write_latch_feedbacks;
					elsif (timeout_counter = max_timeout) then
						Tx_Start <= '0';
						timeout_counter := 0;
						state <= idle;
					end if;
				when write_latch_feedbacks =>
					Tx_Start <= '1';
					state <= wait_for_write_latch_feedbacks_transmitted;
				when wait_for_write_latch_feedbacks_transmitted =>
					timeout_counter := timeout_counter + 1;
					if (Tx_Busy_old = '1' and Tx_Busy = '0') then
						Tx_Start <= '0';
						timeout_counter := 0;
						state <= cyclic_feedback;
					elsif (timeout_counter = max_timeout) then
						Tx_Start <= '0';
						timeout_counter := 0;
						state <= idle;
					end if;
				when cyclic_feedback =>
					Tx_Frame_Type <= "10";
					Tx_Jack_Nember <= jack_of_the_sequence;
					Tx_Parameter_Address <= read_address_of_the_sequence;
					Tx_Parameter_Value <= (others => '0');
					state <= cyclic_read;
				when cyclic_read =>
					Tx_Start <= '1';
					state <= wait_for_cyclic_read_transmitted;
				when wait_for_cyclic_read_transmitted =>
					timeout_counter := timeout_counter + 1;
					if (Tx_Busy_old = '1' and Tx_Busy = '0') then
						Tx_Start <= '0';
						timeout_counter := 0;
						state <= wait_for_cyclic_read_done;
					elsif (timeout_counter = max_timeout) then
						Tx_Start <= '0';
						timeout_counter := 0;
						state <= idle;
					end if;
				when wait_for_cyclic_read_done =>
					timeout_counter := timeout_counter + 1;
					if (Rx_Ready_old = '0' and Rx_Ready = '1') then
						timeout_counter := 0;
						if ((jack_of_the_sequence = Rx_Jack_Nember) and (read_address_of_the_sequence = Rx_Parameter_Address)) then
							jack_feedbacks(sequence_number) <= Rx_Parameter_Value;
							state <= check_end_of_read_sequence;
						else
							state <= idle;
						end if;
					elsif (timeout_counter = max_timeout) then
						timeout_counter := 0;
						state <= idle;
					end if;
				when check_end_of_read_sequence =>
					if (sequence_number < 11) then
						sequence_number <= sequence_number + 1;
						state <= cyclic_feedback;
					else
						sequence_number <= 0;
						state <= cyclic_feedback_response;
						PC_Tx_Packet_Type <= "110";
					end if;
				when cyclic_feedback_response =>
					PC_Response_Ready <= '1';
					state <= idle;
			end case;
			PC_Rx_Data_Ready_old := PC_Rx_Data_Ready;
			Tx_Busy_old := Tx_Busy;
			Rx_Ready_old := Rx_Ready;
		end if;
	end process;
end Behavioral;


