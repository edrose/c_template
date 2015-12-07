CC=gcc
CFLAGS=-std=c99 -g -Wall -Iinclude #Development flags for debugging
#CFLAGS=-std=c99 -o3 -Wall -Werror -Iinclude #Production flags for optimisation
LFLAGS=-g
TARGET=hashing
C_FILES := $(wildcard src/*.c)
OBJ_FILES := $(addprefix obj/,$(notdir $(C_FILES:.c=.o)))


all: $(OBJ_FILES)
	$(CC) $(LFLAGS) -o bin/$(TARGET) obj/*.o

clean:
	rm obj/*.o
	rm bin/*

zip:
	mkdir $(TARGET)
	mkdir $(TARGET)/bin
	mkdir $(TARGET)/obj
	cp -r src $(TARGET)
	cp -r misc $(TARGET)
	cp -r include $(TARGET)
	cp README.txt $(TARGET)
	cp Makefile $(TARGET)
	zip -r $(TARGET).zip $(TARGET)
	rm -fr $(TARGET)

obj/%.o: src/%.c
	        $(CC) $(CFLAGS) -c -o $@ $<


