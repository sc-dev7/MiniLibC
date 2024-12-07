##
## EPITECH PROJECT, 2024
## Makefile
## File description:
## ok
##

CC	=	nasm
LD	=	ld

SRCDIR = src
OBJDIR = obj
BINDIR = .

SOURCES = $(wildcard $(SRCDIR)/*.asm)

OBJECTS	:=	$(patsubst $(SRCDIR)/%.asm,$(OBJDIR)/%.o,$(SOURCES))

NAME	=	libasm.so

TARGET = $(BINDIR)/$(NAME)

all:	$(TARGET)

$(OBJDIR)/%.o:	$(SRCDIR)/%.asm
	@mkdir -p $(dir $@)
	$(CC) -f elf64 $< -o $@

$(TARGET) :	$(OBJDIR) $(BINDIR) $(OBJECTS)
	$(LD) -shared -o $(TARGET) $(OBJECTS)

clean: $(OBJDIR)
	find $(OBJDIR) -name '*.o' -type f -exec rm -f {} \;

fclean:	clean
	rm	-f	$(TARGET)

re:	fclean	all

.PHONY: all clean fclean re

$(OBJDIR) $(BINDIR):
	mkdir -p $@