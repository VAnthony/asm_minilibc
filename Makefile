##
## Makefile for  in /home/vogelw_a/projects/asm/boostrap/asm_minilibc/asm_minilibc
## 
## Made by Anthony Vogelweid
## Login   <vogelw_a@epitech.net>
## 
## Started on  Fri Mar 18 17:25:38 2016 Anthony Vogelweid
## Last update Sun Mar 27 23:16:40 2016 Anthony Vogelweid
##

NAME	=	libasm.so

CC	=	gcc

ASM	=	nasm -f elf64

SRC	=	my_strlen.S	\
		my_strchr.S	\
		my_memset.S	\
		my_memcpy.S	\
		my_memmove.S	\
		my_strcasecmp.S	\
		my_strcmp.S	\
		my_strcspn.S	\
		my_strncmp.S	\
		my_strpbrk.S	\
		rindex.S

SRC2	=	my_strstr.S

OBJ	=	$(SRC:.S=.o)

OBJ2	=	$(SRC2:.S=.o)

all	:	$(NAME)

plus	:	$(OBJ2) $(NAME)
		$(CC) -shared -fPIC -W -Wall -Wextra -o $(NAME) $(OBJ2)

$(NAME)	:	$(OBJ)
		$(CC) -shared -fPIC -W -Wall -Wextra -o $(NAME) $(OBJ)

clean	:
		rm -f $(OBJ)
		rm -f $(OBJ2)

fclean	:	clean
		rm -f $(NAME)

re	:	clean fclean all

.PHONY	:	all clean fclean re

.S.o	:
		$(ASM) $(ASMFLAGS) $< -o $@
