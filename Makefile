AS = as
ASFLAGS =

LD = ld
LDFLAGS = -Ttext 0x7c00 --oformat binary

SOURCE_FOLDER = source
SOURCE_TARGET = boot.bin

SOURCE_SOURCE = $(wildcard $(SOURCE_FOLDER)/*.S)
SOURCE_OBJECT = $(patsubst $(SOURCE_FOLDER)/%.S, $(SOURCE_FOLDER)/%.o, $(SOURCE_SOURCE))

all: $(SOURCE_TARGET)

$(SOURCE_TARGET): $(SOURCE_OBJECT)
	$(LD) $(LDFLAGS) -o $@ $^

$(SOURCE_FOLDER)/%.o: $(SOURCE_FOLDER)/%.S
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(SOURCE_TARGET) $(SOURCE_OBJECT)

run:
	qemu-system-i386 -hda $(SOURCE_TARGET)

.PHONY: all clean