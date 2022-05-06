# AUTHOR: PABLO CUESTA SIERRA
# GROUP: 2292

NAME1=p4a
NAME2=p4b

all: $(NAME1).com $(NAME2).exe


$(NAME1).com: $(NAME1).obj
	tlink /t $*

$(NAME1).obj: $(NAME1).asm
	tasm /zi $*.asm,, $*.lst

$(NAME2).exe: $(NAME2).obj
	tlink /v $*

$(NAME2).obj: $(NAME2).asm
	tasm /zi $*.asm,, $*.lst

clean:
	del *.exe
	del *.obj
	del *.lst 
	del *.map
	