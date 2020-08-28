; 
;Ejercicio 02:
;Escribir un programa que almacene un caracter cualquiera en la memoria SRAM,
;y que llame a una sub-rutina TX_BYTE que permita transmitir este caracter en
;formato RS-232. Transmitir el caracter cada segundo. Verificar su funcionamiento
;en la terminal serial.


                .INCLUDE "m2560def.inc"
                
                ; Definición de puertos y pines mediante etiquetas
                .EQU    DDR_TX = DDRE
                .EQU    PORT_TX = PORTE
                .EQU    TX = 1
                .EQU    CARACTER = 0x210
                
                .ORG 0x00
                
                ; Inicializar el Stack Pointer al final de la SRAM
MAIN:           LDI     R31, HIGH(RAMEND)
                OUT     SPH, R31
                LDI     R31, LOW(RAMEND)
                OUT     SPL, R31
                ; Desbloquear el pin PE1 para poder usarlo (necesario en el Arduino Mega 2560)
                LDI     R31, 0
                STS     UCSR0B, R31
                ; Configurar como salida el pin correspondiente a TX
                SBI     DDR_TX, TX
            
                ; Almacenamiento de un caracter en memoria
  BUCLE:        LDI     R19, 'M'
                STS     CARACTER, R19
            
                ;Transmisión del caracter en formato RS-232
                SBI     PORT_TX, TX      ; Inicializar la señal TX en '1' (estado IDLE)
                CALL    DELAY_1S         ; Duración de estado IDLE (1 segundo)
                CALL    SERIAL_TX_BYTE   ; Transmite el caracter almacenado en la SRAM
    

				 ; Almacenamiento de un caracter en memoria
                LDI     R19, 'I'
                STS     CARACTER, R19
            
                ;Transmisión del caracter en formato RS-232
                SBI     PORT_TX, TX      ; Inicializar la señal TX en '1' (estado IDLE)
	            CALL    DELAY_1S         ; Duración de estado IDLE (1 segundo)
                CALL    SERIAL_TX_BYTE   ; Transmite el caracter almacenado en la SRAM

				 ; Almacenamiento de un caracter en memoria
                LDI     R19, 'G'
                STS     CARACTER, R19
            
                ;Transmisión del caracter en formato RS-232
                SBI     PORT_TX, TX      ; Inicializar la señal TX en '1' (estado IDLE)
	            CALL    DELAY_1S         ; Duración de estado IDLE (1 segundo)
                CALL    SERIAL_TX_BYTE   ; Transmite el caracter almacenado en la SRAM


				 ; Almacenamiento de un caracter en memoria
                LDI     R19, 'U'
                STS     CARACTER, R19
            
                ;Transmisión del caracter en formato RS-232
                SBI     PORT_TX, TX      ; Inicializar la señal TX en '1' (estado IDLE)
	            CALL    DELAY_1S         ; Duración de estado IDLE (1 segundo)
                CALL    SERIAL_TX_BYTE   ; Transmite el caracter almacenado en la SRAM


				 ; Almacenamiento de un caracter en memoria
                LDI     R19, 'E'
                STS     CARACTER, R19
            
                ;Transmisión del caracter en formato RS-232
                SBI     PORT_TX, TX      ; Inicializar la señal TX en '1' (estado IDLE)
	            CALL    DELAY_1S         ; Duración de estado IDLE (1 segundo)
                CALL    SERIAL_TX_BYTE   ; Transmite el caracter almacenado en la SRAM
				 
				 ; Almacenamiento de un caracter en memoria
                LDI     R19, 'L'
                STS     CARACTER, R19
            
                ;Transmisión del caracter en formato RS-232
                SBI     PORT_TX, TX      ; Inicializar la señal TX en '1' (estado IDLE)
	            CALL    DELAY_1S         ; Duración de estado IDLE (1 segundo)
                CALL    SERIAL_TX_BYTE   ; Transmite el caracter almacenado en la SRAM

				 ; Almacenamiento de un caracter en memoria
                LDI     R19, '\n'
                STS     CARACTER, R19
            
                ;Transmisión del caracter en formato RS-232
                SBI     PORT_TX, TX      ; Inicializar la señal TX en '1' (estado IDLE)
	            CALL    DELAY_1S         ; Duración de estado IDLE (1 segundo)
                CALL    SERIAL_TX_BYTE   ; Transmite el caracter almacenado en la SRAM

                JMP     BUCLE            ; Repetir el proceso

                
; --------------------- Rutina para transmitir un byte mediante comunicación serial  ------------------
SERIAL_TX_BYTE:
                LDS     R30, CARACTER    ; Cargar el caracter desde la SRAM hacia R30
                LDI     R29, 0           ; Inicializa R29 = 0 (indica la posición del bit transmitido)
                CBI     PORT_TX, TX      ; Bit de START (sale del estado IDLE)
                CALL    DELAY_104US      ; Duración de un bit (104us)              
TX_BIT_DATOS:   SBRS    R30, 0           ; Testear si el bit menos significativo de R30 es '1'
                JMP     BIT_BAJO         ; Si no lo es, transmitir un BIT BAJO (0)    
BIT_ALTO:       SBI     PORT_TX, TX      ; Si lo es, transmitir un BIT ALTO (1)
                CALL    DELAY_104US      ; Duración de un bit (104us)
                JMP     SIGUIENTE_BIT    ; Determinar el siguiente bit
BIT_BAJO:       CBI     PORT_TX, TX      ; Transmitir un BIT BAJO (0)  
                CALL    DELAY_104US      ; Duración de un bit (104us)
SIGUIENTE_BIT:  CPI     R29, 7           ; Si ya se ha transmitido el bit 7 de datos
                BREQ    TERMINAR         ; terminar con la transmisión (transmitir bit de STOP)
                LSR     R30              ; De lo contrario, desplazar R30 hacia la derecha
                INC     R29              ; e incrementar el indice del bit a transmitir
                JMP     TX_BIT_DATOS     ; Transmitir el siguiente bit de datos
TERMINAR:       SBI     PORT_TX, TX      ; Bit de STOP (vuelve al estado IDLE)
                CALL    DELAY_104US      ; Duración de un bit (104us)
                RET
                
                
; --------------------- Rutina de retardo de 104us ------------------
DELAY_104US:
                ; delaying 1656 cycles:
                ldi  R16, $03
WGLOOP0:        ldi  R17, $B7
WGLOOP1:        dec  R17
                brne WGLOOP1
                dec  R16
                brne WGLOOP0
; ----------------------------- 
                ; delaying 3 cycles:
                ldi  R16, $01
WGLOOP2:        dec  R16
                brne WGLOOP2
                ret      

                
; --------------------- Rutina de retardo de 1s ------------------
DELAY_1S:
                ; delaying 15999993 cycles:
                ldi  R16, $53
WGLOOP0_1:      ldi  R17, $FB
WGLOOP1_1:      ldi  R18, $FF
WGLOOP2_1:      dec  R18
                brne WGLOOP2_1
                dec  R17
                brne WGLOOP1_1
                dec  R16
                brne WGLOOP0_1
; ----------------------------- 
; delaying 2 cycles:
                nop
                nop
                ret	


