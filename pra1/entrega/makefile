NAME1=Lab1A
NAME2=Lab1C

all: $(NAME1).exe $(NAME2).exe 

$(NAME1).exe: $(NAME1).obj
	tlink /v $(NAME1)

$(NAME1).obj: $(NAME1).asm
	tasm /zi $(NAME1).asm,, $(NAME1).lst

	
$(NAME2).exe: $(NAME2).obj
	tlink /v $(NAME2)

$(NAME2).obj: $(NAME2).asm
	tasm /zi $(NAME2).asm,, $(NAME2).lst