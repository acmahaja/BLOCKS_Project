;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; Programmer: Anjaney Chirag Mahajan
; Class: ECE 109
; Section: 405
;
;       				blocks.asm
;
; Submitted: 03/28/2017
;
;
; The function of this program is to draw  and manipulate the location of a 
; box on the screen
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			.ORIG x3000
						
			JSR Initialise				;	Initialize R0, R2, R3 and R4	

			JSR	Mem_Num_128				; 	Jump to Label Mem_Num_128

			JSR Mem_Neg_Num_128			;	Jump to Label Mem_Neg_Num_128
						
			LD	R1,	WHITE				;	Load [White] -> R1
			
START		LD	R0,	X					;	Load [X] -> R0	
			AND R3, R3, #0				;	Initialise R3	;	Loop Control for X_Axis
			AND R4,	R4,	#0				;	Initialise R4	;	Loop Control for Y_Axis	
			ADD	R4,	R4,	#8				;	R4 = R4 + 8
			
Y_Axis		ADD R3, R3, #8				;	R3 = R3 + 8
				X_Axis
					STR R1, R0, #0		;	[R0] -> [R1]
					ADD R0, R0, #1		;	R0 = R0 + 1
					ADD	R3,	R3,	#-1		;	R3 = R3 - 1
					brp	X_Axis			;	R3 > 0? Go to X_Axis
			
			ADD R0, R0, R6				;	R0 = R0 + R6
			ADD	R0,	R0, #-8				;	R0 = R0 - 8
			ADD	R4,	R4,	#-1				;	R4 = R4 - 1
			brp	Y_Axis					;	R3 > 0? Go to Y_Axis
			
			AND R0, R0, #0				;	Initialise R0
			
			GETC						;	Character Input
			ST	R0, Input				;	Store Character <- R0
			ST R1, Temp_Color			;	Store Temp_Color <- R1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
Exit_Test
Test_q		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, q					;	R0 = [q]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	EXIT					;	R2 =0? Go to label EXIT
			JSR Initialise				;	Initialize R0, R2, R3 and R4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
Move_Test
Test_w		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, w					;	R0 = [w]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_w					;	R2 =0? Go to label If_w	
			JSR Initialise				;	Initialize R0, R2, R3 and R4

Test_s		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, s					;	R0 = [s]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_s					;	R2 =0? Go to label If_s	
			JSR Initialise				;	Initialize R0, R2, R3 and R4			
			
Test_a		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, a					;	R0 = [a]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #0				;	R2 = R2 + 0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_a					;	R2 =0? Go to label If_a
			JSR Initialise				;	Initialize R0, R2, R3 and R4		

Test_d		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, d					;	R0 = [d]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #0				;	R2 = R2 + 0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_d					;	R2 =0? Go to label If_d
			JSR Initialise				;	Initialize R0, R2, R3 and R4	
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
Color_Test
Test_y		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, y					;	R0 = [y]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_y					;	R2 =0? Go to label If_y	
			JSR Initialise				;	Initialize R0, R2, R3 and R4	
			
Test_g		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, g					;	R0 = [g]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_g					;	R2 =0? Go to label If_g	
			JSR Initialise				;	Initialize R0, R2, R3 and R4
						
Test_r		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, r					;	R0 = [r]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_r					;	R2 =0? Go to label If_r	
			JSR Initialise				;	Initialize R0, R2, R3 and R4
			
Test_b		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, b					;	R0 = [b]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_b					;	R2 =0? Go to label If_b	
			JSR Initialise				;	Initialize R0, R2, R3 and R4
			
Test_wh		LD	R0, Input				;	R0 = [Input]
			Not	R1, R0					;	Inverse [R0] -> R1
			LD 	R0, wh					;	R0 = [wh]
			ADD R2, R1, R0				;	R2 = R1 + R0
			ADD	R2, R2, #1				;	R2 = R2 + 1
			Brz	If_wh					;	R2 =0? Go to label If_wh	
			JSR Initialise				;	Initialize R0, R2, R3 and R4
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
Results
If_w		JSR Clear					;	Initialize R0, R2, R3 and R4				
			LD		R1, Temp_Color		;	Load Temp_Color -> R1
			LD		R4, X				;	Load X -> R4	
			ADD		R4, R4, R5
			ADD		R4, R4, R5
			ADD		R4, R4, R5
			ADD		R4, R4, R5
			ADD		R4, R4, R5
			ADD		R4, R4, R5
			ADD		R4, R4, R5
			ADD		R4, R4, R5			;	ADD R4 = R4 - 128
			ST      R4, X				;	Store R4 -> X
			Brnzp	START				;	Go to Label START
			
If_a		JSR Clear					;	Initialize R0, R2, R3 and R4
			LD	R1, Temp_Color			;	Load Temp_Color -> R1
			LD		R4, X				;	Load X -> R4
			ADD		R4, R4, #-8			;	ADD R4 = R4 - 8
			ST      R4, X				;	Store R4 -> X
			Brnzp	START				;	Go to Label START		
			
If_s		JSR Clear					;	Initialize R0, R2, R3 and R4
			LD		R1, Temp_Color		;	Load Temp_Color -> R1
			LD		R4, X				;	Load X -> R4
			ADD		R4, R4, R6
			ADD		R4, R4, R6
			ADD		R4, R4, R6
			ADD		R4, R4, R6
			ADD		R4, R4, R6
			ADD		R4, R4, R6
			ADD		R4, R4, R6
			ADD		R4, R4, R6			;	ADD R4 = R4 + 128
			ST      R4, X				;	Store R4 -> X
			Brnzp	START				;	Go to Label START
			
If_d		JSR Clear					;	Initialize R0, R2, R3 and R4
			LD	R1, Temp_Color			;	Load Temp_Color -> R1
			LD		R4, X				;	Load X -> R4
			ADD		R4, R4, #8			;	ADD R4 = R4 + 8
			ST      R4, X				;	Store R4 -> X
			Brnzp	START				;	Go to Label START				
			
If_r		LD		R1,	RED				;	Load RED -> R1
			Brnzp	START				;	Go to Label START		
			
If_g		LD		R1,	GREEN			;	Load GREEN -> R1
			Brnzp	START				;	Go to Label START	

If_b		LD		R1,	BLUE			;	Load BLUE -> R1
			Brnzp	START				;	Go to Label START		
			
If_y		LD		R1,	YELLOW			;	Load YELLOW -> R1
			Brnzp	START				;	Go to Label START	

If_wh		LD		R1, WHITE			;	Load WHITE -> R1
			Brnzp	START				;	Go to Label START	

Exit			HALT					;	End Program
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

Clear		LD	R1,	BLACK				;	Load [BLACK] -> R1
			LD	R0,	X					;	Store [X] -> R0	
			AND R3, R3, #0				;	Initialise R3	;	Loop Control for XAxis
			AND R4,	R4,	#0				;	Initialise R4	;	Loop Control for YAxis	
			ADD	R4,	R4,	#8				;	R4 = R4 + 8
			
YAxis		ADD R3, R3, #8				;	R3 = R3 + 8
			XAxis
					STR R1, R0, #0		;	[R0] -> [R1]
					ADD R0, R0, #1		;	R0 = R0 + 1
					ADD	R3,	R3,	#-1		;	R3 = R3 - 1
					brp	XAxis			;	R3 > 0? Go to XAxis
			
			ADD R0, R0, R6				;	R0 = R0 + R6
			ADD	R0,	R0, #-8				;	R0 = R0 - 8
			ADD	R4,	R4,	#-1				;	R4 = R4 - 1
			brp	YAxis					;	R3 > 0? Go to YAxis
			
			AND R0, R0, #0				;	Initialise R0
			RET	
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Initialise	AND R0, R0, #0
			AND R1, R1, #0
			AND R2,	R2,	#0
			AND R3,	R3,	#0
			AND R4,	R4,	#0
			RET

Mem_Num_128	
			ADD R6, R6, #1			; 	Add Decimal value #1 to R2
			ADD R6, R6, R6			;	Add Decimal value #2 to R2
			ADD R6, R6, R6			;	Add Decimal value #4 to R2
			ADD R6, R6, R6			;	Add Decimal value #8 to R2
			ADD R6, R6, R6			;	Add Decimal value #16 to R2
			ADD R6, R6, R6			;	Add Decimal value #32 to R2
			ADD R6, R6, R6 			;	Add Decimal value #64 to R2
			ADD R6, R6, R6			;	Add Decimal value #128 to R2
			RET
			
Mem_Neg_Num_128	
			ADD R5, R5, #-1			; 	Add Decimal value #-1 to R2
			ADD R5, R5, R5			; 	Add Decimal value #-2 to R2
			ADD R5, R5, R5			; 	Add Decimal value #-4 to R2
			ADD R5, R5, R5			; 	Add Decimal value #-8to R2
			ADD R5, R5, R5			; 	Add Decimal value #-16 to R2
			ADD R5, R5, R5			; 	Add Decimal value #-32 to R2
			ADD R5, R5, R5			; 	Add Decimal value #-64 to R2
			ADD R5, R5, R5			; 	Add Decimal value #-128 to R2
			RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
			X				.FILL	xDF40
			Input			.FILL	x4000
			Temp_Color		.FILL	x4001
			Temp_Storage	.FILL	x4002
			
			W_Test			.FILL	xFF00
			A_Test			.FILL	xFF00
			D_TEST			.FILL	x00FF
			D_Test_2		.FILL	xFF7F
			
			RED				.FILL	x7C00
			GREEN			.FILL	x03E0
			BLUE			.FILL	x001F
			YELLOW			.FILL	x7FED
			WHITE			.FILL	x7FFF
			BLACK			.FILL	x0000
			
			w 				.FILL	x0077
			a 				.FILL	x0061
			s 				.FILL 	x0073
			d 				.FILL	x0064
			q				.FILL	x0071
			
			r				.FILL	x0072
			g				.FILL	x0067
			b				.FILL	x0062
			y				.FILL	x0079
			wh				.FILL	x0020
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.END 
	
	
	
	