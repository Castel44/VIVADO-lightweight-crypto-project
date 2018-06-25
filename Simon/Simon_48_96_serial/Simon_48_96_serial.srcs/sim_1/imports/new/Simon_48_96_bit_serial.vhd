library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Simon_tb is
end;

architecture bench of Simon_tb is

  component Simon_48_96_bit_serial
  
-- generic( datapath: integer:=1 ); 

  
   Port ( start,clk,data_ready:in std_logic;
          key_in: in std_logic_vector(0 downto 0); 
          plaintext_in: in std_logic_vector(0 downto 0);
          busy: out std_logic;
          
          ciphertext_out: out std_logic_vector(0 downto 0)
         ); 
  end component;
  
  -- constants 
 constant datapath: integer := 1;
 constant  key_size: integer := 96; 
 constant plaintext_size: integer := 48; 
 

  signal start,clk,i_mode: std_logic:='0';
  signal key_in: std_logic_vector(datapath-1 downto 0):= (others => '0') ;
  signal plaintext_in: std_logic_vector(datapath-1 downto 0):= (others => '0') ;
  signal busy: std_logic:='0';
  signal ciphertext_out: std_logic_vector(datapath-1 downto 0):= (others => '0') ;

  constant clock_period: time := 10 us;
  signal stop_the_clock: boolean;
  
 
    
    
 constant plaintext_test_vector: std_logic_vector(plaintext_size-1 downto 0) := X"72696320646e";  
 constant key_test_vector: std_logic_vector(key_size-1 downto 0):= X"1a19181211100a0908020100" ; 
 constant ciphertext_test_vector: std_logic_vector(plaintext_size-1 downto 0) := X"6e06a5acf156";

  


begin

  -- Insert values for generic parameters !!
uut: Simon_48_96_bit_serial
                 
--                 generic map ( datapath => datapath ) 

  
  
                 port map ( clk             => clk,
                            data_ready          => i_mode,
                            key_in          => key_in,
                            start => start,
                            plaintext_in    => plaintext_in,
                            busy            => busy,
                           
                            ciphertext_out  => ciphertext_out );

  stimulus: process
  begin
  

    i_mode <= '1'; 
    
    wait for clock_period;
    
    for i in plaintext_size-1 downto 0 loop 
    
    
    plaintext_in <= plaintext_test_vector(plaintext_size-1+datapath-1-i downto plaintext_size-1-i); 
    key_in <= key_test_vector(plaintext_size-1+datapath-1-i downto plaintext_size-1-i); 
     wait for clock_period;
    
    end loop; 
    i_mode <= '0'; --loading 
    
    
    
    for i in key_size-1 downto plaintext_size loop 
    key_in <= key_test_vector(plaintext_size+key_size-1+datapath-1-i downto plaintext_size+key_size-1-i); 
    wait for clock_period; 
    
        end loop; 
    
    
     wait for clock_period; 
     start <= '1'; 
    wait for 2*clock_period; 
    start <= '0'; 
    
     wait for 1000*clock_period; 

    
    
    
        
        
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;