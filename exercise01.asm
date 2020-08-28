;SEMAFORO

        ;Inclusión del archivo con las definiciones (etiquetas del fabricante)
        .INCLUDE "m2560def.inc"
        
        .EQU INICIO=1
        .ORG    0x00    ;Iniciar en la dirección 0
        
        ;Configurar los pines del PUERTO F como salidas
        LDI R31, 0xFF
        OUT DDRF, R31
     
        
BUCLE:  
        ;Mostrar el valor del resultado en PORTF 
		LDI R19, INICIO
        OUT PORTF, R19
		CALL DELAY_60S            ; Esperar 5s
		LSL R19
        OUT PORTF, R19
		CALL DELAY_5S            ; Esperar 5s
		LSL R19
        OUT PORTF, R19
		CALL DELAY_60S            ; Esperar 5s
	    ;Repetir indefinidamente
        JMP BUCLE

DELAY_5S:
	; ============================= 
;    delay loop generator 
;     80000000 cycles:
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP61:  ldi  R17, $FF
WGLOOP62:  ldi  R18, $FF
WGLOOP63:  dec  R18
          brne WGLOOP63
          dec  R17
          brne WGLOOP62
          dec  R16
          brne WGLOOP61
; ----------------------------- 
; delaying 30059760 cycles:
          ldi  R16, $FB
WGLOOP64:  ldi  R17, $BF
WGLOOP65:  ldi  R18, $D0
WGLOOP66:  dec  R18
          brne WGLOOP66
          dec  R17
          brne WGLOOP65
          dec  R16
          brne WGLOOP64
; ----------------------------- 
; delaying 273 cycles:
          ldi  R16, $5B
WGLOOP67:  dec  R16
          brne WGLOOP67
; ----------------------------- 
; delaying 2 cycles:
          nop
          nop
		  ret
; ============================= 

DELAY_60S:

; ============================= 
;    delay loop generator 
;     960000000 cycles:
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP0:  ldi  R17, $FF
WGLOOP1:  ldi  R18, $FF
WGLOOP2:  dec  R18
          brne WGLOOP2
          dec  R17
          brne WGLOOP1
          dec  R16
          brne WGLOOP0
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP3:  ldi  R17, $FF
WGLOOP4:  ldi  R18, $FF
WGLOOP5:  dec  R18
          brne WGLOOP5
          dec  R17
          brne WGLOOP4
          dec  R16
          brne WGLOOP3
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP6:  ldi  R17, $FF
WGLOOP7:  ldi  R18, $FF
WGLOOP8:  dec  R18
          brne WGLOOP8
          dec  R17
          brne WGLOOP7
          dec  R16
          brne WGLOOP6
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP9:  ldi  R17, $FF
WGLOOP10: ldi  R18, $FF
WGLOOP11: dec  R18
          brne WGLOOP11
          dec  R17
          brne WGLOOP10
          dec  R16
          brne WGLOOP9
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP12: ldi  R17, $FF
WGLOOP13: ldi  R18, $FF
WGLOOP14: dec  R18
          brne WGLOOP14
          dec  R17
          brne WGLOOP13
          dec  R16
          brne WGLOOP12
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP15: ldi  R17, $FF
WGLOOP16: ldi  R18, $FF
WGLOOP17: dec  R18
          brne WGLOOP17
          dec  R17
          brne WGLOOP16
          dec  R16
          brne WGLOOP15
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP18: ldi  R17, $FF
WGLOOP19: ldi  R18, $FF
WGLOOP20: dec  R18
          brne WGLOOP20
          dec  R17
          brne WGLOOP19
          dec  R16
          brne WGLOOP18
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP21: ldi  R17, $FF
WGLOOP22: ldi  R18, $FF
WGLOOP23: dec  R18
          brne WGLOOP23
          dec  R17
          brne WGLOOP22
          dec  R16
          brne WGLOOP21
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP24: ldi  R17, $FF
WGLOOP25: ldi  R18, $FF
WGLOOP26: dec  R18
          brne WGLOOP26
          dec  R17
          brne WGLOOP25
          dec  R16
          brne WGLOOP24
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP27: ldi  R17, $FF
WGLOOP28: ldi  R18, $FF
WGLOOP29: dec  R18
          brne WGLOOP29
          dec  R17
          brne WGLOOP28
          dec  R16
          brne WGLOOP27
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP30: ldi  R17, $FF
WGLOOP31: ldi  R18, $FF
WGLOOP32: dec  R18
          brne WGLOOP32
          dec  R17
          brne WGLOOP31
          dec  R16
          brne WGLOOP30
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP33: ldi  R17, $FF
WGLOOP34: ldi  R18, $FF
WGLOOP35: dec  R18
          brne WGLOOP35
          dec  R17
          brne WGLOOP34
          dec  R16
          brne WGLOOP33
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP36: ldi  R17, $FF
WGLOOP37: ldi  R18, $FF
WGLOOP38: dec  R18
          brne WGLOOP38
          dec  R17
          brne WGLOOP37
          dec  R16
          brne WGLOOP36
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP39: ldi  R17, $FF
WGLOOP40: ldi  R18, $FF
WGLOOP41: dec  R18
          brne WGLOOP41
          dec  R17
          brne WGLOOP40
          dec  R16
          brne WGLOOP39
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP42: ldi  R17, $FF
WGLOOP43: ldi  R18, $FF
WGLOOP44: dec  R18
          brne WGLOOP44
          dec  R17
          brne WGLOOP43
          dec  R16
          brne WGLOOP42
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP45: ldi  R17, $FF
WGLOOP46: ldi  R18, $FF
WGLOOP47: dec  R18
          brne WGLOOP47
          dec  R17
          brne WGLOOP46
          dec  R16
          brne WGLOOP45
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP48: ldi  R17, $FF
WGLOOP49: ldi  R18, $FF
WGLOOP50: dec  R18
          brne WGLOOP50
          dec  R17
          brne WGLOOP49
          dec  R16
          brne WGLOOP48
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP51: ldi  R17, $FF
WGLOOP52: ldi  R18, $FF
WGLOOP53: dec  R18
          brne WGLOOP53
          dec  R17
          brne WGLOOP52
          dec  R16
          brne WGLOOP51
; ----------------------------- 
; delaying 49939965 cycles:
          ldi  R16, $FF
WGLOOP54: ldi  R17, $FF
WGLOOP55: ldi  R18, $FF
WGLOOP56: dec  R18
          brne WGLOOP56
          dec  R17
          brne WGLOOP55
          dec  R16
          brne WGLOOP54
; ----------------------------- 
; delaying 11140656 cycles:
          ldi  R16, $F8
WGLOOP57: ldi  R17, $45
WGLOOP58: ldi  R18, $D8
WGLOOP59: dec  R18
          brne WGLOOP59
          dec  R17
          brne WGLOOP58
          dec  R16
          brne WGLOOP57
; ----------------------------- 
; delaying 9 cycles:
          ldi  R16, $03
WGLOOP60: dec  R16
          brne WGLOOP60
		  ret
; ============================= 
