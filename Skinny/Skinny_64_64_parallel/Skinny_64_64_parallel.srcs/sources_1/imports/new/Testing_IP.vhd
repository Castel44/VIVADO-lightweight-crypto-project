-- Top entity used for experimental measurements of power consumption on the Zybo board 
-- this top entity is kept omogeneous among all ciphers as much as possible to allow a fair comparison
-- it is implemented via a state machine. 

-- this top entity has only three ports plus clock. 
-- the three ports are mapped to Zybo GPIOs and the connections are specified in the XDC constraints file
-- More in detail, start is mapped to Pmod JA N16 pin, rst to Pmod JA L15 pin and led_out to LED PIN M14
-- the led out is only a visual cue for cipher proper functioning and encryption success.
------------------------------------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Testing_IP IS
	PORT (
		start : IN std_logic;
		clk : IN std_logic;
		rst : IN std_logic;
		led_out : OUT std_logic := '0'
	);
END Testing_IP;

ARCHITECTURE Behavioral OF Testing_IP IS

------------------------------------------------------------------------------------------------------------
-- Subcomponents delcaraton:
	-- DUT: Skinny with Block size = 64 bit; Tweakey size = 64 bit
	-- Datapath = 64 bit
	COMPONENT SKINNY_64_64_parallel IS
		PORT (
			CLK : IN STD_LOGIC;
			PLAINTEXT_IN : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			tweakey_in : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			START, DATA_READY : IN STD_LOGIC;
			BUSY : OUT STD_LOGIC := '0';
			CIPHERTEXT_OUT : OUT STD_LOGIC_VECTOR (63 DOWNTO 0) := (OTHERS => '0')
		);
	END COMPONENT;
	
------------------------------------------------------------------------------------------------------------	
	-- TEST VECTORS
	SIGNAL KEY_REG : std_logic_vector(63 DOWNTO 0) := X"f5269826fc681238";
	SIGNAL PLAINTEXT_REG : std_logic_vector(63 DOWNTO 0) := X"06034f957724d19d";
	
	-- INTERNAL SIGNALS
	SIGNAL ciphertext_out_W : std_logic_vector(63 DOWNTO 0);

	SIGNAL busy_W, data_ready_W, start_W : std_logic;
	
	--FSM SIGNALS
	TYPE state IS (START_ENC, LOADING, IDLE, WAITING, ENC, SUCCESS);
	SIGNAL nx_state : state;
	SIGNAL current_state : state := IDLE;
	
BEGIN

-- Component Instantiation

	-- Cipher under Test
	SKINNY_64_DUT : SKINNY_64_64_parallel
	PORT MAP(
		clk => clk,
		plaintext_in => PLAINTEXT_REG,
		tweakey_in => KEY_REG,
		start => start_W,
		data_ready => data_ready_W,
		ciphertext_out => ciphertext_out_W,
		busy => busy_W
	);
	
------------------------------------------------------------------------------------------------------------
	-- Finite state machine to handle the cipher.	
	STATE_MACHINE_MAIN : PROCESS (clk, rst)
	BEGIN
		IF rising_edge(CLK) THEN
			IF (rst = '1') THEN
				current_state <= idle;
			ELSE
				current_state <= nx_state;
			END IF;
		END IF;
	END PROCESS;
	
    -- Only 1 encryption is made, then it is checked for correctness. A led will light up if the results it's correct.
    -- To start a new encryption the Testing_IP needs to be resetted via rst port.   
	STATE_MACHINE_BODY : PROCESS (current_state, start, ciphertext_out_W, busy_W)
	BEGIN
		CASE current_state IS

			WHEN idle =>
				-- CIPHER inputs
				data_ready_W <= '0';
				start_W <= '0';

				-- output ports 
				led_out <= '0';

				-- transition 
				IF start = '1' THEN     --start loading register then start encrypt
					nx_state <= loading;
				ELSE
					nx_state <= idle;
				END IF;

			WHEN loading =>
				-- CIPHER inputs
				data_ready_W <= '1'; -- data_ready goes high 
				start_W <= '0';

				-- output ports 
				led_out <= '0';

				-- transition         
				nx_state <= waiting; --registers loaded in 1clk     

			WHEN waiting =>
				-- CIPHER inputs
				data_ready_W <= '0';  -- data_ready goes low
				start_W <= '0';

				-- output ports 
				led_out <= '0';

				-- transition         
				nx_state <= start_enc;

			WHEN start_enc =>
				-- CIPHER inputs
				data_ready_W <= '0';
				start_W <= '1'; --start encrypt

				-- output ports 
				led_out <= '0';

				-- transition
				nx_state <= enc;

			WHEN enc =>
				-- CIPHER inputs
				data_ready_W <= '0';
				start_W <= '0';

				-- output ports 
				led_out <= '0';

				-- transition 
				-- check for correct ciphertext when encrypt is done
				IF (busy_W = '0') AND (ciphertext_out_W = X"bb39dfb2429b8ac7") THEN
					nx_state <= success;
				ELSE
					nx_state <= enc;
				END IF;

			WHEN success =>
				-- CIPHER inputs
				data_ready_W <= '0';
				start_W <= '0';

				-- output ports         
				led_out <= '1';	-- Success! led should turn on

				-- transition                
				nx_state <= success;

		END CASE;

	END PROCESS;

END Behavioral;