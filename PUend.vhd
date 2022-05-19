entity PUend is
	port(Div, RestIn, CInPU : in bit;
			CoutPU : out bit);
end PUend;

architecture PUend_ar of PUend is 

	begin	
		CoutPU <= not((CInPU nand RestIn) and (CInPU nand not(Div)) and (not(Div) nand RestIn));
end PUend_ar;

