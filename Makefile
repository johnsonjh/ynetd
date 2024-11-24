
all: CFLAGS ?= -O2 -Wl,-s \
               -Wl,-z,relro,-z,now -fpic -pie -D_FORTIFY_SOURCE=2 -fstack-protector-all
all: CFLAGS += -std=c99 -pedantic -Wall -Wextra -DNDEBUG
all: ynetd

debug: CFLAGS ?= -O0 -g \
                 -fsanitize=undefined \
                 -Wl,-z,relro,-z,now -fpic -pie -fstack-protector-all
debug: CFLAGS += -std=c99 -pedantic -Wall -Wextra -Werror
debug: ynetd

ynetd: ynetd.c
	$(CC) \
		$(CFLAGS) \
		ynetd.c \
		-o ynetd

clean:
	rm -f ynetd

