;Ejercicio 03:
;Modificar el programa del ejercicio anterior: Implementar sub-rutinas de
;retardo de 20us, 40us, 60us y 80us. Luego, emular una señal PWM de frecuencia
;10KHz (periodo 100us) a través de PB7. Probar diferentes ciclos de trabajo:
;20%, 40%, 60% y 80% ¿Se nota algún cambio en la intensidad del brillo del LED?
;Medir con un osciloscopio la salida generada.


                .INCLUDE "m2560def.inc"
                
                ; Definición de puertos y pines mediante etiquetas
                .EQU    DDR_LED = DDRB
                .EQU    PORT_LED = PORTB
                .EQU    LED = 7
				.EQU	CONTADOR1 = 100
                .EQU	CONTADOR2 = 10
                .ORG 0x00
                
                ; Inicializar el Stack Pointer al final de la SRAM
MAIN:           LDI     R31, HIGH(RAMEND)
                OUT     SPH, R31
                LDI     R31, LOW(RAMEND)
                OUT     SPL, R31
                ; Configurar como salida el pin correspondiente al LED
                SBI     DDR_LED, LED
                ;Genera la señal PWM (bucle infinito)
				
REPETIR:        

				LDI R20, CONTADOR2
			   LOP_01:  LDI R21, CONTADOR1
			   LOP_02:  			
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_100US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_02
				DEC		R20
				BRNE LOP_01

				LDI R20, CONTADOR2
			   LOP_1:  LDI R21, CONTADOR1
			   LOP_2:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_10US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_90US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_2
				DEC		R20
				BRNE LOP_1

				LDI R20, CONTADOR2
				LOP_3:  LDI R21, CONTADOR1
			    LOP_4:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_20US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_80US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_4
				DEC		R20
				BRNE LOP_3
				
				LDI R20, CONTADOR2
				LOP_5:  LDI R21, CONTADOR1
			   LOP_6:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_30US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_70US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_6
				DEC		R20
				BRNE LOP_5

				LDI R20, CONTADOR2
				LOP_7:  LDI R21, CONTADOR1
			   LOP_8:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_40US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_60US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_8
				DEC		R20
				BRNE LOP_7

				LDI R20, CONTADOR2
				LOP_9:  LDI R21, CONTADOR1
			   LOP_10:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_50US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_50US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_10
				DEC		R20
				BRNE LOP_9

				LDI R20, CONTADOR2
				LOP_11:  LDI R21, CONTADOR1
			   LOP_12:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_60US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_40US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_12
				DEC		R20
				BRNE LOP_11

				LDI R20, CONTADOR2
				LOP_13:  LDI R21, CONTADOR1
			   LOP_14:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_70US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_30US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_14
				DEC		R20
				BRNE LOP_13

				LDI R20, CONTADOR2
				LOP_15:  LDI R21, CONTADOR1
			   LOP_16:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_80US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_20US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_16
				DEC		R20
				BRNE LOP_15

				LDI R20, CONTADOR2
				LOP_17:  LDI R21, CONTADOR1
			   LOP_18:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_90US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_10US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_18
				DEC		R20
				BRNE LOP_17

				LDI R20, CONTADOR2
				LOP_19:  LDI R21, CONTADOR1
			   LOP_20:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_80US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_20US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_20
				DEC		R20
				BRNE LOP_19

				LDI R20, CONTADOR2
				LOP_21:  LDI R21, CONTADOR1
			   LOP_22:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_70US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_30US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_22
				DEC		R20
				BRNE LOP_21

				LDI R20, CONTADOR2
				LOP_23:  LDI R21, CONTADOR1
			   LOP_24:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_60US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_50US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_24
				DEC		R20
				BRNE LOP_23

				LDI R20, CONTADOR2
				LOP_25:  LDI R21, CONTADOR1
			   LOP_26:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_50US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_50US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_26
				DEC		R20
				BRNE LOP_25

				LDI R20, CONTADOR2
				LOP_27:  LDI R21, CONTADOR1
			   LOP_28:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_40US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_60US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_28
				DEC		R20
				BRNE LOP_27

				LDI R20, CONTADOR2
				LOP_29:  LDI R21, CONTADOR1
			   LOP_30:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_30US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_70US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_30
				DEC		R20
				BRNE LOP_29

				LDI R20, CONTADOR2
				LOP_31:  LDI R21, CONTADOR1
			   LOP_32:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_20US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_80US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_32
				DEC		R20
				BRNE LOP_31

				LDI R20, CONTADOR2
				LOP_33:  LDI R21, CONTADOR1
			   LOP_34:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_10US       ; Tiempo en ALTO (Ciclo de trabajo)				
                CBI     PORT_LED, LED    ; Forzar la señal a '0'
                CALL    DELAY_90US       ; Tiempo en BAJO
				DEC		R21
				BRNE LOP_34
				DEC		R20
				BRNE LOP_33

				LDI R20, CONTADOR2
			   LOP_03:  LDI R21, CONTADOR1
			   LOP_04:  
			    SBI     PORT_LED, LED    ; Forzar la señal a '1'
                CALL    DELAY_100US       ; Tiempo en ALTO (Ciclo de trabajo)				
				DEC		R21
				BRNE LOP_04
				DEC		R20
				BRNE LOP_03



		;		SBI     PORT_LED, LED    ; Forzar la señal a '1'
          ;      CALL    DELAY_20MS       ; Tiempo en ALTO (Ciclo de trabajo)				
        ;        CBI     PORT_LED, LED    ; Forzar la señal a '0'
         ;       CALL    DELAY_80MS       ; Tiempo en BAJO

		;		 SBI     PORT_LED, LED    ; Forzar la señal a '1'
         ;       CALL    DELAY_80MS       ; Tiempo en ALTO (Ciclo de trabajo)				
         ;       CBI     PORT_LED, LED    ; Forzar la señal a '0'
         ;       CALL    DELAY_20MS       ; Tiempo en BAJO 

		;		SBI     PORT_LED, LED    ; Forzar la señal a '1'
        ;        CALL    DELAY_90MS       ; Tiempo en ALTO (Ciclo de trabajo)				
        ;        CBI     PORT_LED, LED    ; Forzar la señal a '0'
        ;        CALL    DELAY_10MS       ; Tiempo en BAJO

				
		
				  
                JMP     REPETIR          ; Repetir el proceso



	
				

				 
                
; ------------------------------------------------------------------                
; ---------------------- RUTINAS DE RETARDO ------------------------
; ------------------------------------------------------------------
                    
DELAY_10US:
; ============================= 
;    delay loop generator 
;     160 cycles:
; ----------------------------- 
; delaying 159 cycles:
          ldi  R17, $35
WGLOOP0:  dec  R17
          brne WGLOOP0
; ----------------------------- 
; delaying 1 cycle:
          nop
		  ret
; ============================= 

DELAY_20US:
; ============================= 
;    delay loop generator 
;     320 cycles:
; ----------------------------- 
; delaying 318 cycles:
          ldi  R17, $6A
WGLOOP1:  dec  R17
          brne WGLOOP1
; ----------------------------- 
; delaying 2 cycles:
          nop
          nop
		  ret
; ============================= 


DELAY_30US:
; ============================= 
;    delay loop generator 
;     480 cycles:
; ----------------------------- 
; delaying 480 cycles:
          ldi  R17, $A0
WGLOOP2:  dec  R17
          brne WGLOOP2
		  ret
; ============================= 


DELAY_40US:
; ============================= 
;    delay loop generator 
;     640 cycles:
; ----------------------------- 
; delaying 639 cycles:
          ldi  R17, $D5
WGLOOP3:  dec  R17
          brne WGLOOP3
; ----------------------------- 
; delaying 1 cycle:
          nop
		  ret
; ============================= 

DELAY_50US:
; ============================= 
;    delay loop generator 
;     800 cycles:
; ----------------------------- 
; delaying 798 cycles:
          ldi  R17, $02
WGLOOP4:  ldi  R18, $84
WGLOOP5:  dec  R18
          brne WGLOOP5
          dec  R17
          brne WGLOOP4
; ----------------------------- 
; delaying 2 cycles:
          nop
          nop
		  ret
; ============================= 


DELAY_60US:
; ============================= 
;    delay loop generator 
;     960 cycles:
; ----------------------------- 
; delaying 957 cycles:
          ldi  R17, $0B
WGLOOP6:  ldi  R18, $1C
WGLOOP7:  dec  R18
          brne WGLOOP7
          dec  R17
          brne WGLOOP6
; ----------------------------- 
; delaying 3 cycles:
          ldi  R17, $01
WGLOOP8:  dec  R17
          brne WGLOOP8
		  ret
; ============================= 

DELAY_70US:
; ============================= 
;    delay loop generator 
;     160 cycles:
; ----------------------------- 
; delaying 159 cycles:
          ldi  R17, $35
WGLOOP9:  dec  R17
          brne WGLOOP9
; ----------------------------- 
; delaying 1 cycle:
          nop
		  ret
; ============================= 

DELAY_80US:
; ============================= 
;    delay loop generator 
;     160 cycles:
; ----------------------------- 
; delaying 159 cycles:
          ldi  R17, $35
WGLOOP10:  dec  R17
          brne WGLOOP10
; ----------------------------- 
; delaying 1 cycle:
          nop
		  ret
; ============================= 

DELAY_90US:
; ============================= 
;    delay loop generator 
;     1440 cycles:
; ----------------------------- 
; delaying 1434 cycles:
          ldi  R17, $02
WGLOOP11:  ldi  R18, $EE
WGLOOP12:  dec  R18
          brne WGLOOP12
          dec  R17
          brne WGLOOP11
; ----------------------------- 
; delaying 6 cycles:
          ldi  R17, $02
WGLOOP13:  dec  R17
          brne WGLOOP13
		  ret
; ============================= 

DELAY_100US:
; ============================= 
;    delay loop generator 
;     1600 cycles:
; ----------------------------- 
; delaying 1599 cycles:
          ldi  R17, $0D
WGLOOP14:  ldi  R18, $28
WGLOOP15:  dec  R18
          brne WGLOOP15
          dec  R17
          brne WGLOOP14
; ----------------------------- 
; delaying 1 cycle:
          nop
		  ret
; ============================= 
