
all: CFLAGS ?= -O2 -Wl,-s
all: CFLAGS += -std=c99 -pedantic -Wall -Wextra -DNDEBUG
all: ynetd

debug: CFLAGS ?= -O0 -g
debug: CFLAGS += -std=c99 -pedantic -Wall -Wextra -Werror
debug: ynetd

ynetd: ynetd.c
	$(CC) \
		$(CFLAGS) \
		ynetd.c \
		-o ynetd

clean:
	rm -f ynetd

