OBJS = addsadcexamp.o
ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
%.o : %.s
	as $(DEBUGFLGS) $< -o $@
addsadcexamp: $(OBJS)
	ld -o addsadcexamp $(OBJS)