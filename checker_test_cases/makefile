CC:=../../build/bin/clang
RM=rm -rf
CFLAGS:=-S --analyze

%.s: %.c
	${CC} ${CFLAGS} $< -o $@

clean:
	${RM} *.s
	${RM} *.plist