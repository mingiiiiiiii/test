# ==== Simple Makefile for HAETAE-MSP430 Project ====

CC = gcc
CFLAGS = -Wall -Wextra -O2 
# CFLAGS = -Wall -Wextra -pg 

TARGET = haetae

# All C source files in your project
SRCS = \
    main.c \
    encoding.c \
    fips202.c \
    ntt.c \
    poly.c \
    polyfix.c \
    polyvec.c \
    polymat.c \
    randombytes.c \
    reduce.c \
    sampler.c \
    symmetric-shake.c \
    fft.c \
    fixpoint.c \
    decompose.c \
    sign.c \
    packing.c

OBJS = $(SRCS:.c=.o)

# Default target
all: $(TARGET)

# Linking
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^
	@$(MAKE) clean_objs   # 빌드 후 object 파일 삭제

# Compile rule
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean everything
clean: clean_objs
	rm -f $(TARGET)

# Clean only object files
clean_objs:
	rm -f $(OBJS)

.PHONY: all clean clean_objs
