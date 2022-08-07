NAME		=	minishell
#HEADER_RDL	=	/opt/homebrew/Cellar/readline/8.1/include
HEADER_RDL	=	/usr/local/opt/readline/include #cleonia
#HEADER_RDL	=	/Users/cleonia/.brew/Cellar/readline/8.1.1/include #school
HEADER		=	minishell.h

GCC			=	gcc -g -Wall -Wextra -Werror 

DIR_LIBA	=	libft/
DIR_PARSER 	= 	parser_utils/
DIR_UTILS	=	utils/
DIR_EXECUTE	=	execute/

SRC_PARSER	= 	preparser.c quotes.c dollar.c args.c redirect.c comm_args.c control_symbol.c \
				pars_pipe.c redirect_utils1.c redirect_delimiter.c dollar_utils.c
SRC_UTILS	=	utils0.c utils1.c utils2.c utils3.c utils4.c utils5.c utils6.c utils7.c
SRC_EXECUTE	=	pipex.c cd.c exit.c unset.c echo.c pwd.c env.c export.c execute.c

SRCS		=	main.c parser.c ft_error.c
SRCS_PARSER	=	$(addprefix $(DIR_PARSER), $(SRC_PARSER))
UTILS		=	$(addprefix $(DIR_UTILS), $(SRC_UTILS))
EXECUTE		=	$(addprefix $(DIR_EXECUTE), $(SRC_EXECUTE))

OBJ			=	$(SRCS:.c=.o) $(SRCS_PARSER:.c=.o) $(UTILS:.c=.o) $(EXECUTE:.c=.o)

all: libft $(NAME)

%.o: %.c $(HEADER)
	@$(GCC) -I $(HEADER_RDL) -c $< -o $@

$(NAME): $(OBJ) $(HEADER) MAKEFILE
	@echo "\033[0;35mКомпилю minishell...\033[0;32m"
	@echo "\033[0;35mСоздаю исполняемый файл...\033[0;32m"
#	@$(GCC) -o $(NAME) -L/opt/homebrew/Cellar/readline/8.1/lib -lreadline $(OBJ) -L $(DIR_LIBA) -lft
	@$(GCC) -o $(NAME) -L/usr/local/opt/readline/lib -lreadline $(OBJ) -L $(DIR_LIBA) -lft #cleonia
#	@$(GCC) -o $(NAME) -L/Users/cleonia/.brew/Cellar/readline/8.1.1/lib/ -lreadline $(OBJ) -L $(DIR_LIBA) -lft #school
#	@echo "DONE! Запускаю..."
#	@./minishell

libft:
	@echo "\033[0;35mКомпилю libft... \033[0;32m"
	@make -C $(DIR_LIBA)

clean:
	@echo "\033[0;35mУдаляю объектные файлы...\033[0;31m"
	@make clean -C $(DIR_LIBA)
	@echo "\033[0;35mMINISHELL: ЧИСТКА ОБЪЕКТНИКОВ...\033[0;31m"
	@rm -f $(OBJ)

fclean: clean
	@echo "\033[0;35mУдаляю исполняемый файл...\033[0;31m"
	@rm -f $(NAME)
	@make fclean -C $(DIR_LIBA)

re: fclean all

.PHONY: all libft clean fclean re
