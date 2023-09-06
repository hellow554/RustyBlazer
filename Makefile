randomizer: german.sfc randomizer.sfc

randomizer.sfc: $(shell find randomizer -type f) german.sfc
	@cp german.sfc rando.sfc
	@echo "Compiling randomizer/main.asm"
	@tools/asar randomizer/main.asm rando.sfc

german: german.sfc verify_german

ifdef DEBUG
ASAR_FLAGS = -DDEBUG=1
else
ASAR_FLAGS = 
endif

german.sfc: $(shell find src -type f -name '*.asm')
	@echo "Precompile src/main.asm"
	@tools/asar_text.py src/main.asm
	@echo "Compiling src/main.asm"
	@tools/asar ${ASAR_FLAGS} --symbols=wla src/main.asm  $@

verify_german: german.sfc
	@echo "8763b634c427419dae84cc743b04f61841c1659a15a6f20d9ad2aec9a16755a8 german.sfc" | sha256sum --check --status \
		&& echo -e "\e[32mVerify succesfull\e[0m" \
		|| (echo -e "\e[31mVerify error\e[0m" && exit 1)

clean:
	@echo "Removing german.sfc"
	@$(RM) german.sfc
	@echo "Removing rando.sfc"
	@$(RM) rando.sfc

.PHONY: clean
