.PHONY: build 

fetch:
	curl -so cosmopolitan-amalgamation-2.0.zip -z cosmopolitan-amalgamation-2.0.zip https://worker.jart.workers.dev/cosmopolitan-amalgamation-2.0.zip && unzip -o cosmopolitan-amalgamation-2.0.zip -d cosmo

build:
	nim c --nimcache:./build src/main.nim
	gcc -o main build/*.o -static -nostdlib -nostdinc -Wl,-T,cosmo/ape.lds cosmo/crt.o cosmo/ape.o cosmo/cosmopolitan.a -o out/midichka.ape
	objcopy -S -O binary out/midichka.ape out/midichka.com

danger:
	nim c --noLinking:off -d:danger --opt:size --passL:"-static -nostdlib -nostdinc -Wl,-T,cosmo/ape.lds cosmo/crt.o cosmo/ape.o cosmo/cosmopolitan.a" -o:danger.ape src/main.nim
	objcopy -S -O binary danger.ape danger.com
