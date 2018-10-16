
	@ Anthony De La Cruz
	@ PA 3-2
	@ 10/15/2018
	@ this program let you select 3 different items in a vending machinelet you know the total of your selection
	@ R0 contain contain each message, R1 has your selection, R3 has the values of the ccents for each value, R4 is the quantity


	
   @Vending machine code

    .global main
    .extern printf
main:
    @@@ Print out "menu" of choices.
    LDR R0, =msg0
    BL printf
    LDR R0, =msg1
    BL printf
    LDR R0, =msg2
    BL printf
    LDR R0, =msg3
    BL printf
    LDR R0, =msg4
    BL printf
    @@@ Have user enter in their selection
    @@@ Store selection in variable select
    LDR R0, =inp
    LDR R1, =select
    BL scanf
    @@@ Prompt user for quantity
    LDR R0, =msg5
    BL printf
    @@@ Have user enter value into variable
    @@@ Quantity
    LDR R0, =inp
    LDR R1, =quantity
    BL scanf

    LDR R1, =select  @Address of var select
    LDR R1, [R1]     @Value of select in R1

    @Your modifications will begin at this point

    CMP R1, #1       @Check for "peanuts"
    MOVEQ R1, #1     @If user entered 1 goto _peanuts
    MOVEQ R3, #75    @ move 75 to R3 if equal value is selected  
    CMP R1, #2       @Check for "chocolate"
    MOVEQ R1, #2     @If user entered 2 goto _choc
    MOVEQ R3, #125   @ move 125 to R3 if equal value is selected  	
    CMP R1, #3       @Check for "pretzels"
    MOVEQ R1, #3     @If user entered 3 goto _pretzel
    MOVEQ R3, #90    @ move 90 to R3 if equal value is selected  	
    LDR R0, =msg7    @If we get here user entered
                     @an illegal selection so print
                     @error message and terminate



   
   
	
    LDR R4, =quantity @Get address of var quantity
    LDR R4, [R4]      @Value of quantity now in R4
    MUL R1, R3, R4    @Multiply number of cents times quantity
                      @and put result in R1
    

    LDR R0, =msg6     @Final message
    BL printf
    MOV R7, #1
    SWI	#0	     @ terminate error condition


   
_peanut:
_choc:
_pretzel:

_compute:





	
.data
select: .word 0
quantity: .word 0
msg0: .asciz "CSC2301 Vending machine!\n"
msg1: .asciz "Enter your choice:\n"
msg2: .asciz "1 for peanuts @ 75 cents\n"
msg3: .asciz "2 for chocolate @ $1.25\n"
msg4: .asciz "3 for pretzels @ 90 cents\n"
msg5: .asciz "Enter quantity\n";
msg6: .asciz "Your total is: %d cents\n";
msg7: .asciz "Illegal selection.  Goodbye\n"
inp: .asciz "%d"


