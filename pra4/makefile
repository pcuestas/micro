# AUTHOR: PABLO CUESTA SIERRA
# GROUP: 2292

NAME1=p4a
NAME2=Lab1C

all: $(NAME1).com


$(NAME1).com: $(NAME1).obj
	tlink /t $*

$(NAME1).obj: $(NAME1).asm
	tasm /zi $*.asm,, $*.lst

clean:
	del *.exe
	del *.obj
	del *.lst 
	del *.map
	