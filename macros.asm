
.macro setBorder(color) {
  lda #color
  sta $d020
}

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