entity PU is
	port(Div, RestIn, CInPU, LastC : in bit;
			CoutPU, RestOut : out bit);
end PU;

architecture PU_ar of PU is 
	component sum1 
	port(A, B, Cin : in bit;
			S, Cout  : out bit);
	end component;
	signal SumOut : bit;
	
	begin	
		u1: sum1
		port map(
		A => not(Div),
		B => RestIn,
		Cin => CinPU,
		S => SumOut,
		Cout => CoutPU
		);
		RestOut <= (LastC and SumOut) or (not(LastC) and RestIn);
end PU_ar;