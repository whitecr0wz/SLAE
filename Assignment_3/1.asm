global _start

_start:

      mov esi, 0x45474547       ; Moves the tag GEGE into ESI

main:

      inc ebx                   ; Increments EBX for comparison.
      cmp dword [ebx], esi      ; Compares EBX with ESI, that contains the tag. If they contain the same value, set the Zero flag (ZF).
      jne main                  ; Jumps to main to repeat the loop until the Zero flag (ZF) is set.
      push ebx                  ; Pushes the value of EBX into the stack.
      ret                       ; Pops it into the EIP.