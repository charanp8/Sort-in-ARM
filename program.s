MOVS R1, R0
		MOVS R0, #0 //clear R0 to make it counter
		LDR R4, =EID //give R2 my EID
        LDRB R5, [R4] //access the contents of EID

        MOVS R6, R4

		LDR R2, [R1]


        Compare: // start comparing
		//LDR R2, [R1]
		ADDS R2, R2, #0 // see if list is empty
       	BEQ ListEmpty //-
		LDRB R3, [R2]
       	CMP R3, R5 //compares the characters

       	BEQ NextLetter // if zero, they are the same
   	    BNE NextEID // if not zero, they are not

   	    NextLetter:
   	   	ADDS R2, #1 // access next letter of my EID
   	   	ADDS R4, #1 // access next letter of test case
   	   	LDRB R5, [R4]

   	   	ADDS R5, R5, #0
   	   	BEQ Success

   	   	B Compare

		NextEID:
		ADDS R1, #8
		ADDS R0, #1
		LDR R2, [R1]
		MOVS R4, R6
		LDRB R5, [R4]
		B Compare
   	   //Success:
   	   //ADDS R0, R0, #0 // prints zero

   	    ListEmpty:
   	    MOVS R0, #0
   	    SUBS R0, #1 // if list is empty, or EID isn't available, puts -1
   	    B Success