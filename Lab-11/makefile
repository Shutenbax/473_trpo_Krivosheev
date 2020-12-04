
CC := gcc
LD := gcc

CFLAGS := -c O3 -Wall -MMD -MP -I/usr/include/lua5.3
LDFLAGS := -s -Wl,--export-dynamic -llua5.3 -lm

SRCS := lab-11_clua_krivosheev.c

OBJS := $(SRCS:.c=.o)
DEPS := $(SRCS:.c=.d)

RESULT := app

default: $(RESULT)
	./$(RESULT)

clean:
	rm -f $(OBJS) $(DEPS) $(RESULT)

$(RESULT): $(OBJS)
	$(LD) $(OBJS) -o $(RESULT) $(LDFLAGS)

%.o: %.c
	$(CC) $CFLAGS) $< -o $@

-include $(Deps)
