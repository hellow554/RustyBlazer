;; this function is used, when you don't want the `8x` bank of an address, but the Cx bank, because you need to address it's lower (<$8000) memory
function bankCx(addr) = (addr >> 16) | %01000000