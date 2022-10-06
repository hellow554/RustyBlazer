randomizer: sb.sfc randomizer.sfc

randomizer.sfc: $(shell find randomizer -type f) sb.sfc
	@cp sb.sfc rando.sfc
	@echo "Compiling randomizer/main.asm"
	@tools/asar randomizer/main.asm rando.sfc

original: sb.sfc verify

sb.sfc: $(shell find src -type f)
	@echo "Compiling src/main.asm"
	@tools/asar src/main.asm $@

verify: sb.sfc
	@echo "8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2 sb.sfc" | sha256sum --check --status
	@echo "Verify succesfull"

clean:
	@echo "Removing sb.sfc"
	@$(RM) sb.sfc
	@echo "Removing rando.sfc"
	@$(RM) rando.sfc

.PHONY: clean
