;Ejercicio 04:
;Conectar 02 pulsadores a cualquiera de los puertos del microcontrolador.
;Luego, escribir un programa que lleve a cabo lo siguiente: configurar el
;pin 7 del PUERTO B (PB7) como salida, activar las resistencias pull-up
;internas correspondientes a los pines donde están los botones, y hacer que
;el LED conectado a PB7 responda a las entradas de acuerdo a una lógica de
;“control bimanual”. Una vez que el programa funcione correctamente,
;modificarlo para que funcione con una lógica de “luz de escalera”.

            .INCLUDE "m2560def.inc"
            
            ; Definición de puertos y pines para hacer el código más legible
            
            .EQU    DDR_LED = DDRB
            .EQU    PORT_LED = PORTB
            .EQU    LED = 7
            .EQU    PORT_BOTONES = PORTF
            .EQU    PIN_BOTONES = PINF
            .EQU    BOTON_1 = 0
            .EQU    BOTON_2 = 1   
			.EQU    BOTON_3 = 3    
            
            .ORG 0
            
            ;Configurar el pin 7 del PUERTO B como salida
            SBI     DDR_LED, LED
            ;Habilitar las resistencias pull-up para los pines de los botones
            SBI     PORT_BOTONES, BOTON_1
            SBI     PORT_BOTONES, BOTON_2
			SBI     PORT_BOTONES, BOTON_3
            ;Aqui inicia el bucle
BUCLE1:               
			SBIC    PIN_BOTONES, BOTON_1   ; Saltea una instrucción si el Botón 1 está pulsado (ES CERO)
			JMP		LED_OFF
            JMP     BOTON1                 ; Salta a LED_OFF
						
BUCLE2:			
			SBIC    PIN_BOTONES, BOTON_2   ; Saltea una instrucción si el Botón 1 está pulsado (ES CERO)
			CALL	LED_OFF2
			JMP     BOTON2                 ; Salta a LED_OFF
			  
BUCLE3:			
			SBIC    PIN_BOTONES, BOTON_3   ; Saltea una instrucción si el Botón 1 está pulsado (ES CERO)
			CALL	LED_OFF3
			JMP     BOTON3                 ; Salta a LED_OFF
			  
			


BOTON1:		SBI     PORT_LED, LED          ; Enciende LED
			CALL    DELAY_100HZ         ; Esperar un segundo
			CBI     PORT_LED, LED          ; Enciende LED
			CALL    DELAY_100HZ         ; Esperar un segundo
            JMP     BUCLE1                  ; Vuelve a leer los botones

BOTON2:		SBI     PORT_LED, LED          ; Enciende LED
			CALL    DELAY_1KHZ         ; Esperar un segundo
			CBI     PORT_LED, LED          ; Enciende LED
			CALL    DELAY_1kHZ         ; Esperar un segundo	
            JMP     BUCLE1                  ; Vuelve a leer los botones

BOTON3:		SBI     PORT_LED, LED          ; Enciende LED
			CALL    DELAY_10KHZ         ; Esperar un segundo
			CBI     PORT_LED, LED          ; Enciende LED
			CALL    DELAY_10kHZ         ; Esperar un segundo
            JMP     BUCLE1                  ; Vuelve a leer los botones
                 
LED_OFF:    CBI     PORT_LED, LED          ; Apaga LED  
            JMP     BUCLE2                  ; Vuelve a leer los botones 
			
LED_OFF2:    CBI     PORT_LED, LED          ; Apaga LED  
             JMP     BUCLE3                  ; Vuelve a leer los botones
			 
LED_OFF3:    CBI     PORT_LED, LED          ; Apaga LED  
             JMP     BUCLE1                  ; Vuelve a leer los botones 
  
			
DELAY_100HZ:
; ============================= 
;    delay loop generator 
;     160000 cycles:
; ----------------------------- 
; delaying 159975 cycles:
          ldi  R17, $E1
WGLOOP0:  ldi  R18, $EC
WGLOOP1:  dec  R18
          brne WGLOOP1
          dec  R17
          brne WGLOOP0
; ----------------------------- 
; delaying 24 cycles:
          ldi  R17, $08
WGLOOP2:  dec  R17
          brne WGLOOP2
; ----------------------------- 
; delaying 1 cycle:
          nop
		  ret
; ============================= 

DELAY_1KHZ:
; ============================= 
;    delay loop generator 
;     16000 cycles:
; ----------------------------- 
; delaying 15996 cycles:
          ldi  R17, $1F
WGLOOP3:  ldi  R18, $AB
WGLOOP4:  dec  R18
          brne WGLOOP4
          dec  R17
          brne WGLOOP3
; ----------------------------- 
; delaying 3 cycles:
          ldi  R17, $01
WGLOOP5:  dec  R17
          brne WGLOOP5
; ----------------------------- 
; delaying 1 cycle:
          nop
		  ret
; ============================= 


DELAY_10KHZ:
; ============================= 
;    delay loop generator 
;     1600 cycles:
; ----------------------------- 
; delaying 1599 cycles:
          ldi  R17, $0D
WGLOOP6:  ldi  R18, $28
WGLOOP7:  dec  R18
          brne WGLOOP7
          dec  R17
          brne WGLOOP6
; ----------------------------- 
; delaying 1 cycle:
          nop
		  ret
; ============================= 

