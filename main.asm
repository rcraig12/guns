BasicUpstart2(start)

start:
  lda #00
  sta $0500
  jmp start
