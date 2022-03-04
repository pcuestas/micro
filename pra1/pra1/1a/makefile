NAME=Lab1A
all: $(NAME).exe 

$(NAME).exe: $(NAME).obj
	tlink /v $(NAME)

$(NAME).obj: $(NAME).asm
	tasm /zi $(NAME).asm,, $(NAME).lst