entity sum1 is
	port(A, B, Cin : in bit;
			S, Cout  : out bit);
end sum1;

architecture sum1_ar of sum1 is
	begin			
			S <= ((A xor B) xor Cin);
			Cout <= not((Cin nand B) and (Cin nand A) and (A nand B));
	
end sum1_ar;