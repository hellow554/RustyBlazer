randomizer: sb.sfc randomizer.sfc

randomizer.sfc: $(shell find randomizer -type f) sb.sfc
	@cp sb.sfc rando.sfc
	@echo "Compiling randomizer/main.asm"
	@tools/asar randomizer/main.asm rando.sfc

original: sb.sfc verify
german: german.sfc verify_german

sb.sfc: $(shell find src -type f)
	@echo "Compiling src/main.asm"
	@tools/asar src/main.asm $@

german.sfc: $(shell find src_german -type f -name '*.asm')
	@echo "Precompile src_german/main.asm"
	@tools/asar_text.py src_german/main.asm
	@echo "Compiling src_german/main.asm"
ifdef DEBUG
	@tools/asar -DDEBUG=1 src_german/main.asm $@
else
	@tools/asar src_german/main.asm $@
endif

verify: sb.sfc
	@echo "8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2 sb.sfc" | sha256sum --check --status \
		&& echo -e "\e[32mVerify succesfull\e[0m" \
		|| (echo -e "\e[31mVerify error\e[0m" && exit 1)

verify_german: german.sfc
	@echo "8763b634c427419dae84cc743b04f61841c1659a15a6f20d9ad2aec9a16755a8 german.sfc" | sha256sum --check --status \
		&& echo -e "\e[32mVerify succesfull\e[0m" \
		|| (echo -e "\e[31mVerify error\e[0m" && exit 1)

clean:
	@echo "Removing sb.sfc"
	@$(RM) sb.sfc
	@echo "Removing german.sfc"
	@$(RM) german.sfc
	@echo "Removing rando.sfc"
	@$(RM) rando.sfc

.PHONY: clean
