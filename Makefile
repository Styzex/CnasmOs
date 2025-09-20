SRC_DIR = src
BUILD_DIR = build

$(shell mkdir -p $(BUILD_DIR))

run:
	qemu-system-i386 -fda $(BUILD_DIR)/os_disk.img -nographic

build:
	nasm -f bin $(SRC_DIR)/boot_stub.s -o $(BUILD_DIR)/boot_stub.bin
	gcc -m16 -c -ffreestanding -fno-pic -fno-pie $(SRC_DIR)/main.c -o $(BUILD_DIR)/main.o
	ld -m elf_i386 -T kernel.ld --oformat binary $(BUILD_DIR)/main.o -o $(BUILD_DIR)/main.bin
	dd if=$(BUILD_DIR)/boot_stub.bin of=$(BUILD_DIR)/os_disk.img bs=512 count=1
	dd if=$(BUILD_DIR)/main.bin of=$(BUILD_DIR)/os_disk.img bs=512 seek=1 conv=notrunc

clean:
	rm -rf $(BUILD_DIR)

.PHONY: run build clean
