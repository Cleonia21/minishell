SRCS	+=  ft_memset.c 
SRCS	+=  ft_bzero.c 
SRCS	+=  ft_memcpy.c
SRCS	+=  ft_memccpy.c
SRCS	+=  ft_memmove.c
SRCS	+=  ft_memchr.c
SRCS	+=  ft_memcmp.c
SRCS	+=  ft_strlcpy.c
SRCS	+=  ft_strlcat.c
SRCS	+=  ft_strlen.c
SRCS	+=  ft_isdigit.c
SRCS	+=  ft_isascii.c
SRCS	+=  ft_isalnum.c
SRCS	+=  ft_isalpha.c
SRCS	+=  ft_strnstr.c
SRCS	+=  ft_strrchr.c
SRCS	+=  ft_strncmp.c
SRCS	+=  ft_atoi.c
SRCS	+=  ft_strdup.c
SRCS	+=  ft_substr.c
SRCS	+=  ft_calloc.c
SRCS	+=  ft_toupper.c
SRCS	+=  ft_tolower.c
SRCS	+=  ft_isprint.c
SRCS	+=  ft_strchr.c 
SRCS	+=  ft_atoi.c
SRCS	+=  ft_strjoin.c
SRCS	+=  ft_strtrim.c
SRCS	+=  ft_split.c
SRCS	+=  ft_itoa.c
SRCS	+=  ft_strmapi.c
SRCS	+=  ft_putstr_fd.c
SRCS	+=  ft_putnbr_fd.c
SRCS	+=  ft_putendl_fd.c
SRCS	+=  ft_putchar_fd.c

BLACK			=	\033[0;30m
RED				=	\033[0;31m
GREEN			=	\033[0;32m
ORANGE			=	\033[0;33m
BLUE			=	\033[0;34m
PURPLE			=	\033[0;35m
CYAN			=	\033[0;36m
LIGHT_GRAY		=	\033[0;37m
DARK_GRAY		=	\033[1;30m
LIGHT_RED		=	\033[1;31m
LIGHT_GREEN		=	\033[1;32m
YELLOW			=	\033[1;33m
LIGHT_BLUE		=	\033[1;34m
LIGHT_PURPLE	=	\033[1;35m
LIGHT_CYAN		=	\033[1;36m
WHITE			=	\033[1;37m
NO_COLOR		=	\033[0m


HEADER	= libft.h

NAME	= libft.a

all: $(NAME)

OBJS	= $(SRCS:.c=.o)

GCC	= gcc -Wall -Wextra -Werror

.c.o :	$(HEADER)
	@${GCC} -I $(HEADER) -c $< -o ${<:.c=.o}
	@printf "\033[2K\r$(BLUE)$(NAME): $(PURPLE)$<$(RESET)"

$(NAME): ${OBJS} $(HEADER)
	@ar -rcs $(NAME) $(OBJS)
	@printf "\033[2K\r$(BLUE)$(NAME): $(PURPLE)DONE\n"

fclean: clean
	@rm -f $(NAME)
	@printf "\033[2K\r$(BLUE)$(NAME): $(PURPLE)ЧИСТКА БИНАРНИКА\n"

clean:
	@rm -f $(OBJS)
	@printf "\033[2K\r$(BLUE)$(NAME): $(PURPLE)ЧИСТКА ОБЪЕКТНИКОВ\n"

re: fclean all

.PHONY: all clean fclean re .c.o
