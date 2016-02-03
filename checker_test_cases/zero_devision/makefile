CC:=/opt/yehudas/workspace/misc_utils/compiler/build/bin/clang
RM=rm -rf

%.s: %.c
	${CC} $< -S

clean:
	${RM} *.s