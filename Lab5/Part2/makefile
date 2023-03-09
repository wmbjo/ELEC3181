OBJS = outputASCII.o
ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
%.o : %.s
	as $(DEBUGFLGS) $< -o $@
outputASCII: $(OBJS)
	ld -o outputASCII $(OBJS)