
#importonce
#import "constants.asm"
#import "macros.asm"
#import "sprite.asm"

.const SCREEN = $0400
.const BOTTOM_LINE = $07c0

BasicUpstart2(start)

start:

  //:clearScreen(RED)
  :setupSid4Noise()

loop:

  jsr printMazeLine
  jsr shiftUp
  jmp loop

  getMazeChar:
    lda SID_OSC3_R0
    and #$01
    beq !+
    lda #206
    jmp !++
  !:
    lda #205
  !:
    rts
  
printMazeLine:
  ldx #$00
  newChar:
    jsr getMazeChar
    sta BOTTOM_LINE,x
    inx
    cpx #41
    bne newChar
    rts

shiftUp:
  ldx #$00
!:
.for(var line = 1; line<25; line++ ){
  lda SCREEN + (line * 40),x
  sta SCREEN + (line * 40) - 40,x
}
  inx
  cpx #40
  beq !+
  jmp !-
!:
  rts