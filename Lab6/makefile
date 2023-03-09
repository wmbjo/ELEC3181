OBJS = inputASCII.o
ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
%.o : %.s
	as $(DEBUGFLGS) $< -o $@
inputASCII: $(OBJS)
	ld -o inputASCII $(OBJS)