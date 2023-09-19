
#importonce 
#import "constants.asm"

.macro setBorder(color) {
  lda #color
  sta $d020
}
#importonce 

.macro setBackground(color) {
  lda #color
  sta $d021
}

.macro clearScreen(color) {
  :setBorder( color )
  ;setBackground( color )
  lda #$20
  ldx #$ff
!loop:
  sta $0400,x
  sta $0500,x
  sta $0600,x
  sta $0700,x
  dex
  bne !loop-
}

.macro setupSid4Noise() {
  lda #$ff
  sta SID_VOICE3_LB
  sta SID_VOICE3_LB + 1
  lda #SID_VOICE3_CTRL
  sta SID_VOICE3_CTRL
}