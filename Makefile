#
#CC   = gcc
#OBJS = main.o func_usage.o
#DIR  = /home/ryota/Documents/practice/func_usage/4.0.0/inc
#INC  = ./inc

#main: $(OBJS)
#	$(CC) -o main.exe $(OBJS)  


#main.o: main.c
#	$(CC) -c main.c

#func_usage.o: func_usage.c 
#	$(CC) -c func_usage.c -I $(INC)

#clean:
#	rm -f main.exe $(OBJS)



COMPILER  = gcc
CFLAGS    = -g -MMD -MP -Wall
ifeq "$(shell getconf LONG_BIT)" "64"
  LDFLAGS =
else
  LDFLAGS =
endif
LIBS      =
INCLUDE   = -I./inc
TARGET    = ./bin/$(shell basename `readlink -f .`)
SRCDIR    = ./src
ifeq "$(strip $(SRCDIR))" ""
  SRCDIR  = .
endif
SOURCES   = $(wildcard $(SRCDIR)/*.c)
OBJDIR    = ./obj
ifeq "$(strip $(OBJDIR))" ""
  OBJDIR  = .
endif
OBJECTS   = $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))
DEPENDS   = $(OBJECTS:.o=.d)

$(TARGET): $(OBJECTS) $(LIBS)
	$(COMPILER) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	-mkdir -p $(OBJDIR)
	$(COMPILER) $(CFLAGS) $(INCLUDE) -o $@ -c $<

all: clean $(TARGET)

clean:
	-rm -f $(OBJECTS) $(DEPENDS) $(TARGET)

-include $(DEPENDS)


