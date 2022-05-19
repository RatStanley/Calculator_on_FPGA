entity div8 is
	port(ValInA, ValInB : in bit_vector (7 downto 0);
			ValOut : out bit_vector (7 downto 0));
end entity;

architecture div8_ar of div8 is
	component PU
		port(Div, RestIn, CInPU, LastC : in bit;
				CoutPU, RestOut : out bit);
	end component;
	
	component PUend
		port(Div, RestIn, CInPU : in bit;
			CoutPU : out bit);
	end component;
	
	constant config_zero  : bit := '0';
	constant config_one : bit := '1';
	
	signal b0c0, b0c1, b0c2, b0c3, b0c4, b0c5, b0c6, b0c7 : bit;
	signal b1c0, b1c1, b1c2, b1c3, b1c4, b1c5, b1c6, b1c7 : bit;
	signal b2c0, b2c1, b2c2, b2c3, b2c4, b2c5, b2c6, b2c7 : bit;
	signal b3c0, b3c1, b3c2, b3c3, b3c4, b3c5, b3c6, b3c7 : bit;
	signal b4c0, b4c1, b4c2, b4c3, b4c4, b4c5, b4c6, b4c7, b4c8 : bit;
	signal b5c0, b5c1, b5c2, b5c3, b5c4, b5c5, b5c6, b5c7, b5c8 : bit;
	signal b6c0, b6c1, b6c2, b6c3, b6c4, b6c5, b6c6, b6c7, b6c8 : bit;
	signal b7c0, b7c1, b7c2, b7c3, b7c4, b7c5, b7c6, b7c7, b7c8 : bit;
	
	signal b0r0, b0r1, b0r2, b0r3, b0r4, b0r5, b0r6 : bit;
	signal b1r0, b1r1, b1r2, b1r3, b1r4, b1r5, b1r6 : bit;
	signal b2r0, b2r1, b2r2, b2r3, b2r4, b2r5, b2r6 : bit;
	signal b3r0, b3r1, b3r2, b3r3, b3r4, b3r5, b3r6, b3r7 : bit;
	signal b4r0, b4r1, b4r2, b4r3, b4r4, b4r5, b4r6, b4r7 : bit;
	signal b5r0, b5r1, b5r2, b5r3, b5r4, b5r5, b5r6, b5r7 : bit;
	signal b6r0, b6r1, b6r2, b6r3, b6r4, b6r5, b6r6, b6r7 : bit;
	signal b7r0, b7r1, b7r2, b7r3, b7r4, b7r5, b7r6, b7r7  : bit;
	
--	signal e0c0, e0c1, e0c2, e0c3, e0c4, e0c5, e0c6, e0c7  : bit;
--	signal e1c0, e1c1, e1c2, e1c3, e1c4, e1c5, e1c6, e1c7  : bit;
--	signal e2c0, e2c1, e2c2, e2c3, e2c4, e2c5, e2c6, e2c7  : bit;
--	signal e3c0, e3c1, e3c2, e3c3, e3c4, e3c5, e3c6, e3c7 : bit;
--	signal e4c0, e4c1, e4c2, e4c3, e4c4, e4c5, e4c6, e4c7 : bit;
--	signal e5c0, e5c1, e5c2, e5c3, e5c4, e5c5, e5c6, e5c7 : bit;
--	signal e6c0, e6c1, e6c2, e6c3, e6c4, e6c5, e6c6, e6c7 : bit;
	--signal e7c0, e7c1, e7c2, e7c3, e7c4, e7c5, e7c6, e7c7 : bit;
	
	begin
			b0PU0:PU
			port map(
					Div 		=> ValInB(0), 
					RestIn 	=> ValInA(7), 
					CInPU 	=> config_one,
					LastC  	=> b0c7,
					
					CoutPU 	=> b0c0,
					RestOut  => b0r0
			);
			
			b0PU1:PU
			port map(
					Div 		=> ValInB(1), 
					RestIn 	=> config_zero, 
					CInPU 	=> b0c0,
					LastC  	=> b0c7,
					
					CoutPU 	=> b0c1,
					RestOut  => b0r1
			);
			
			b0PU2:PU
			port map(
					Div 		=> ValInB(2), 
					RestIn 	=> config_zero, 
					CInPU 	=> b0c1,
					LastC  	=> b0c7,
					
					CoutPU 	=> b0c2,
					RestOut  => b0r2
			);
			
			b0PU3:PU
			port map(
					Div 		=> ValInB(3), 
					RestIn 	=> config_zero, 
					CInPU 	=> b0c2,
					LastC  	=> b0c7,
					
					CoutPU 	=> b0c3,
					RestOut  => b0r3
			);
			
			b0PU4:PU
			port map(
					Div 		=> ValInB(4), 
					RestIn 	=> config_zero, 
					CInPU 	=> b0c3,
					LastC  	=> b0c7,
					
					CoutPU 	=> b0c4,
					RestOut  => b0r4
			);
			
			b0PU5:PU
			port map(
					Div 		=> ValInB(5), 
					RestIn 	=> config_zero, 
					CInPU 	=> b0c4,
					LastC  	=> b0c7,
					
					CoutPU 	=> b0c5,
					RestOut  => b0r5
			);
			
			b0PU6:PU
			port map(
					Div 		=> ValInB(6), 
					RestIn 	=> config_zero, 
					CInPU 	=> b0c5,
					LastC  	=> b0c7,
					
					CoutPU 	=> b0c6,
					RestOut  => b0r6
			);
			
			b0PU7:PUend
			port map(
					Div 		=> ValInB(7), 
					RestIn 	=> config_zero, 
					CInPU 	=> b0c6,
					
					CoutPU 	=> b0c7
			);

			
			--xxxxxxxxxxxxxxxxxxxxxxx
			b1PU0:PU
			port map(
					Div 		=> ValInB(0), 
					RestIn 	=> ValInA(6), 
					CInPU 	=> config_one,
					LastC  	=> b1c7,
					
					CoutPU 	=> b1c0,
					RestOut  => b1r0
			);
			
			b1PU1:PU
			port map(
					Div 		=> ValInB(1), 
					RestIn 	=> b0r0, 
					CInPU 	=> b1c0,
					LastC  	=> b1c7,
					
					CoutPU 	=> b1c1,
					RestOut  => b1r1
			);
			
			b1PU2:PU
			port map(
					Div 		=> ValInB(2), 
					RestIn 	=> b0r1, 
					CInPU 	=> b1c1,
					LastC  	=> b1c7,
					
					CoutPU 	=> b1c2,
					RestOut  => b1r2
			);
			
			b1PU3:PU
			port map(
					Div 		=> ValInB(3), 
					RestIn 	=> b0r2, 
					CInPU 	=> b1c2,
					LastC  	=> b1c7,
					
					CoutPU 	=> b1c3,
					RestOut  => b1r3
			);
			
			b1PU4:PU
			port map(
					Div 		=> ValInB(4), 
					RestIn 	=> b0r3,
					CInPU 	=> b1c3,
					LastC  	=> b1c7,
					
					CoutPU 	=> b1c4,
					RestOut  => b1r4
			);
			
			b1PU5:PU
			port map(
					Div 		=> ValInB(5), 
					RestIn 	=> b0r4,
					CInPU 	=> b1c4,
					LastC  	=> b1c7,
					
					CoutPU 	=> b1c5,
					RestOut  => b1r5
			);
			
			b1PU6:PU
			port map(
					Div 		=> ValInB(6), 
					RestIn 	=> b0r5, 
					CInPU 	=> b1c5,
					LastC  	=> b1c7,
					
					CoutPU 	=> b1c6,
					RestOut  => b1r6
			);
			
			b1PU7:PUend
			port map(
					Div 		=> ValInB(7), 
					RestIn 	=> b0r6,
					CInPU 	=> b1c6,
					
					CoutPU 	=> b1c7
			);

			--xxxxxxxxxxxxxxxxxxxxxxx
			b2PU0:PU
			port map(
					Div 		=> ValInB(0), 
					RestIn 	=> ValInA(5), 
					CInPU 	=> config_one,
					LastC  	=> b2c7,
					
					CoutPU 	=> b2c0,
					RestOut  => b2r0
			);
			
			b2PU1:PU
			port map(
					Div 		=> ValInB(1), 
					RestIn 	=> b1r0, 
					CInPU 	=> b2c0,
					LastC  	=> b2c7,
					
					CoutPU 	=> b2c1,
					RestOut  => b2r1
			);
			
			b2PU2:PU
			port map(
					Div 		=> ValInB(2), 
					RestIn 	=> b1r1, 
					CInPU 	=> b2c1,
					LastC  	=> b2c7,
					
					CoutPU 	=> b2c2,
					RestOut  => b2r2
			);
			
			b2PU3:PU
			port map(
					Div 		=> ValInB(3), 
					RestIn 	=> b1r2, 
					CInPU 	=> b2c2,
					LastC  	=> b2c7,
					
					CoutPU 	=> b2c3,
					RestOut  => b2r3
			);
			
			b2PU4:PU
			port map(
					Div 		=> ValInB(4), 
					RestIn 	=> b1r3,
					CInPU 	=> b2c3,
					LastC  	=> b2c7,
					
					CoutPU 	=> b2c4,
					RestOut  => b2r4
			);
			
			b2PU5:PU
			port map(
					Div 		=> ValInB(5), 
					RestIn 	=> b1r4,
					CInPU 	=> b2c4,
					LastC  	=> b2c7,
					
					CoutPU 	=> b2c5,
					RestOut  => b2r5
			);
			
			b2PU6:PU
			port map(
					Div 		=> ValInB(6), 
					RestIn 	=> b1r5, 
					CInPU 	=> b2c5,
					LastC  	=> b2c7,
					
					CoutPU 	=> b2c6,
					RestOut  => b2r6
			);
			
			b2PU7:PUend
			port map(
					Div 		=> ValInB(7), 
					RestIn 	=> b1r6,
					CInPU 	=> b2c6,
					
					CoutPU 	=> b2c7
			);
			
			--xxxxxxxxxxxxxxxxxxxxxxx
			b3PU0:PU
			port map(
					Div 		=> ValInB(0), 
					RestIn 	=> ValInA(4), 
					CInPU 	=> config_one,
					LastC  	=> b3c7,
					
					CoutPU 	=> b3c0,
					RestOut  => b3r0
			);
			
			b3PU1:PU
			port map(
					Div 		=> ValInB(1), 
					RestIn 	=> b2r0, 
					CInPU 	=> b3c0,
					LastC  	=> b3c7,
					
					CoutPU 	=> b3c1,
					RestOut  => b3r1
			);
			
			b3PU2:PU
			port map(
					Div 		=> ValInB(2), 
					RestIn 	=> b2r1, 
					CInPU 	=> b3c1,
					LastC  	=> b3c7,
					
					CoutPU 	=> b3c2,
					RestOut  => b3r2
			);
			
			b3PU3:PU
			port map(
					Div 		=> ValInB(3), 
					RestIn 	=> b2r2, 
					CInPU 	=> b3c2,
					LastC  	=> b3c7,
					
					CoutPU 	=> b3c3,
					RestOut  => b3r3
			);
			
			b3PU4:PU
			port map(
					Div 		=> ValInB(4), 
					RestIn 	=> b2r3,
					CInPU 	=> b3c3,
					LastC  	=> b3c7,
					
					CoutPU 	=> b3c4,
					RestOut  => b3r4
			);
			
			b3PU5:PU
			port map(
					Div 		=> ValInB(5), 
					RestIn 	=> b2r4,
					CInPU 	=> b3c4,
					LastC  	=> b3c7,
					
					CoutPU 	=> b3c5,
					RestOut  => b3r5
			);
			
			b3PU6:PU
			port map(
					Div 		=> ValInB(6), 
					RestIn 	=> b2r5, 
					CInPU 	=> b3c5,
					LastC  	=> b3c7,
					
					CoutPU 	=> b3c6,
					RestOut  => b3r6
			);
			
			b3PU7:PU
			port map(
					Div 		=> ValInB(7), 
					RestIn 	=> b2r6,
					CInPU 	=> b3c6,
					LastC  	=> b3c7,
					
					CoutPU 	=> b3c7,
					RestOut  => b3r7
			);
			
			--xxxxxxxxxxxxxxxxxxxxxxx
			b4PU0:PU
			port map(
					Div 		=> ValInB(0), 
					RestIn 	=> ValInA(3), 
					CInPU 	=> config_one,
					LastC  	=> b4c8,
					
					CoutPU 	=> b4c0,
					RestOut  => b4r0
			);
			
			b4PU1:PU
			port map(
					Div 		=> ValInB(1), 
					RestIn 	=> b3r0, 
					CInPU 	=> b4c0,
					LastC  	=> b4c8,
					
					CoutPU 	=> b4c1,
					RestOut  => b4r1
			);
			
			b4PU2:PU
			port map(
					Div 		=> ValInB(2), 
					RestIn 	=> b3r1, 
					CInPU 	=> b4c1,
					LastC  	=> b4c8,
					
					CoutPU 	=> b4c2,
					RestOut  => b4r2
			);
			
			b4PU3:PU
			port map(
					Div 		=> ValInB(3), 
					RestIn 	=> b3r2, 
					CInPU 	=> b4c2,
					LastC  	=> b4c8,
					
					CoutPU 	=> b4c3,
					RestOut  => b4r3
			);
			
			b4PU4:PU
			port map(
					Div 		=> ValInB(4), 
					RestIn 	=> b3r3,
					CInPU 	=> b4c3,
					LastC  	=> b4c8,
					
					CoutPU 	=> b4c4,
					RestOut  => b4r4
			);
			
			b4PU5:PU
			port map(
					Div 		=> ValInB(5), 
					RestIn 	=> b3r4,
					CInPU 	=> b4c4,
					LastC  	=> b4c8,
					
					CoutPU 	=> b4c5,
					RestOut  => b4r5
			);
			
			b4PU6:PU
			port map(
					Div 		=> ValInB(6), 
					RestIn 	=> b3r5, 
					CInPU 	=> b4c5,
					LastC  	=> b4c8,
					
					CoutPU 	=> b4c6,
					RestOut  => b4r6
			);
			
			b4PU7:PU
			port map(
					Div 		=> ValInB(7), 
					RestIn 	=> b3r6, 
					CInPU 	=> b4c6,
					LastC  	=> b4c8,
					
					CoutPU 	=> b4c7,
					RestOut  => b4r7
			);
			
			b4PU8:PUend
			port map(
					Div 		=> config_zero, 
					RestIn 	=> b3r7,
					CInPU 	=> b4c7,
					
					CoutPU 	=> b4c8
			);
			--xxxxxxxxxxxxxxxxxxxxxxx
			b5PU0:PU
			port map(
					Div 		=> ValInB(0), 
					RestIn 	=> ValInA(2), 
					CInPU 	=> config_one,
					LastC  	=> b5c8,
					
					CoutPU 	=> b5c0,
					RestOut  => b5r0
			);
			
			b5PU1:PU
			port map(
					Div 		=> ValInB(1), 
					RestIn 	=> b4r0, 
					CInPU 	=> b5c0,
					LastC  	=> b5c8,
					
					CoutPU 	=> b5c1,
					RestOut  => b5r1
			);
			
			b5PU2:PU
			port map(
					Div 		=> ValInB(2), 
					RestIn 	=> b4r1, 
					CInPU 	=> b5c1,
					LastC  	=> b5c8,
					
					CoutPU 	=> b5c2,
					RestOut  => b5r2
			);
			
			b5PU3:PU
			port map(
					Div 		=> ValInB(3), 
					RestIn 	=> b4r2, 
					CInPU 	=> b5c2,
					LastC  	=> b5c8,
					
					CoutPU 	=> b5c3,
					RestOut  => b5r3
			);
			
			b5PU4:PU
			port map(
					Div 		=> ValInB(4), 
					RestIn 	=> b4r3,
					CInPU 	=> b5c3,
					LastC  	=> b5c8,
					
					CoutPU 	=> b5c4,
					RestOut  => b5r4
			);
			
			b5PU5:PU
			port map(
					Div 		=> ValInB(5), 
					RestIn 	=> b4r4,
					CInPU 	=> b5c4,
					LastC  	=> b5c8,
					
					CoutPU 	=> b5c5,
					RestOut  => b5r5
			);
			
			b5PU6:PU
			port map(
					Div 		=> ValInB(6), 
					RestIn 	=> b4r5, 
					CInPU 	=> b5c5,
					LastC  	=> b5c8,
					
					CoutPU 	=> b5c6,
					RestOut  => b5r6
			);
			
			b5PU7:PU
			port map(
					Div 		=> ValInB(7), 
					RestIn 	=> b4r6, 
					CInPU 	=> b5c6,
					LastC  	=> b5c8,
					
					CoutPU 	=> b5c7,
					RestOut  => b5r7
			);
			
			b5PU8:PUend
			port map(
					Div 		=> config_zero, 
					RestIn 	=> b4r7,
					CInPU 	=> b5c7,
					
					CoutPU 	=> b5c8
			);
			--xxxxxxxxxxxxxxxxxxxxxxx
			b6PU0:PU
			port map(
					Div 		=> ValInB(0), 
					RestIn 	=> ValInA(1), 
					CInPU 	=> config_one,
					LastC  	=> b6c8,
					
					CoutPU 	=> b6c0,
					RestOut  => b6r0
			);
			
			b6PU1:PU
			port map(
					Div 		=> ValInB(1), 
					RestIn 	=> b5r0, 
					CInPU 	=> b6c0,
					LastC  	=> b6c8,
					
					CoutPU 	=> b6c1,
					RestOut  => b6r1
			);
			
			b6PU2:PU
			port map(
					Div 		=> ValInB(2), 
					RestIn 	=> b5r1, 
					CInPU 	=> b6c1,
					LastC  	=> b6c8,
					
					CoutPU 	=> b6c2,
					RestOut  => b6r2
			);
			
			b6PU3:PU
			port map(
					Div 		=> ValInB(3), 
					RestIn 	=> b5r2, 
					CInPU 	=> b6c2,
					LastC  	=> b6c8,
					
					CoutPU 	=> b6c3,
					RestOut  => b6r3
			);
			
			b6PU4:PU
			port map(
					Div 		=> ValInB(4), 
					RestIn 	=> b5r3,
					CInPU 	=> b6c3,
					LastC  	=> b6c8,
					
					CoutPU 	=> b6c4,
					RestOut  => b6r4
			);
			
			b6PU5:PU
			port map(
					Div 		=> ValInB(5), 
					RestIn 	=> b5r4,
					CInPU 	=> b6c4,
					LastC  	=> b6c8,
					
					CoutPU 	=> b6c5,
					RestOut  => b6r5
			);
			
			b6PU6:PU
			port map(
					Div 		=> ValInB(6), 
					RestIn 	=> b5r5, 
					CInPU 	=> b6c5,
					LastC  	=> b6c8,
					
					CoutPU 	=> b6c6,
					RestOut  => b6r6
			);
			
			b6PU7:PU
			port map(
					Div 		=> ValInB(7), 
					RestIn 	=> b5r6, 
					CInPU 	=> b6c6,
					LastC  	=> b6c8,
					
					CoutPU 	=> b6c7,
					RestOut  => b6r7
			);
			
			b6PU8:PUend
			port map(
					Div 		=> config_zero, 
					RestIn 	=> b5r7,
					CInPU 	=> b6c7,
					
					CoutPU 	=> b6c8
			);
			--xxxxxxxxxxxxxxxxxxxxxxx
			b7PU0:PUend
			port map(
					Div 		=> ValInB(0), 
					RestIn 	=> ValInA(0), 
					CInPU 	=> config_one,
					
					CoutPU 	=> b7c0
			);
			
			b7PU1:PUend
			port map(
					Div 		=> ValInB(1), 
					RestIn 	=> b6r0, 
					CInPU 	=> b7c0,
					
					CoutPU 	=> b7c1
			);
			
			b7PU2:PUend
			port map(
					Div 		=> ValInB(2), 
					RestIn 	=> b6r1, 
					CInPU 	=> b7c1,
					
					CoutPU 	=> b7c2
			);
			
			b7PU3:PUend
			port map(
					Div 		=> ValInB(3), 
					RestIn 	=> b6r2, 
					CInPU 	=> b7c2,
					
					CoutPU 	=> b7c3
			);
			
			b7PU4:PUend
			port map(
					Div 		=> ValInB(4), 
					RestIn 	=> b6r3,
					CInPU 	=> b7c3,
					
					CoutPU 	=> b7c4
			);
			
			b7PU5:PUend
			port map(
					Div 		=> ValInB(5), 
					RestIn 	=> b6r4,
					CInPU 	=> b7c4,
					
					CoutPU 	=> b7c5
			);
			
			b7PU6:PUend
			port map(
					Div 		=> ValInB(6), 
					RestIn 	=> b6r5, 
					CInPU 	=> b7c5,
					
					CoutPU 	=> b7c6
			);
			
			b7PU7:PUend
			port map(
					Div 		=> ValInB(7), 
					RestIn 	=> b6r6, 
					CInPU 	=> b7c6,
					
					CoutPU 	=> b7c7
			);
			
			b7PU8:PUend
			port map(
					Div 		=> config_zero, 
					RestIn 	=> b6r7,
					CInPU 	=> b7c7,
					
					CoutPU 	=> b7c8
			);
			
			ValOut(0) <= b7c8;
			ValOut(1) <= b6c8;
			ValOut(2) <= b5c8;
			ValOut(3) <= b4c8;
			ValOut(4) <= b3c7;
			ValOut(5) <= b2c7;
			ValOut(6) <= b1c7;
			ValOut(7) <= b0c7;
			
end architecture;