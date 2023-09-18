
#importonce 
#import "macros.asm"
#import "sprite.asm"

BasicUpstart2(start)

start:

  :clearScreen($00)
  lda #$00
  sta $0500
  sta $0502
  sta $0504

  jmp *