all: build verify

build: sb.sfc

sb.sfc: $(shell find src -type f)
	@echo "Compiling src/main.asm"
	@tools/asar src/main.asm $@

verify: sb.sfc
	@echo "8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2 sb.sfc" | sha256sum --check --status
	@echo "Verify succesfull"

clean:
	@$(RM) sb.sfc

.PHONY: clean
