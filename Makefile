# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpaim-yu <tpaim-yu@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/03 17:46:05 by tpaim-yu          #+#    #+#              #
#    Updated: 2023/12/07 17:32:30 by tpaim-yu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CC = cc
FLAGS = -Wall -Werror -Wextra

MAKE_NOPRINT = ${MAKE} --no-print-directory
HEADER = ./includes/
SRC = ft_printf.c \
				 ft_putnbrbase_fd.c \
				 ft_putpointer_fd.c \
				 ft_putunsnbr_fd.c \
				 ft_init_flags.c \
				 ft_putstrspc_fd.c

OBJ = ${SRC:%.c=%.o}
LIBS_PATH = ./lib/

all: libft ${NAME}

${NAME}: ${OBJ} ${LIBS_PATH}libft.a
	cp ${LIBS_PATH}libft.a ${NAME}
	ar rcs ${NAME} ${OBJ}


bonus: all

libft:
	cd ${LIBS_PATH} && ${MAKE_NOPRINT}


clean:
	rm -f ${OBJ}
	cd ${LIBS_PATH} && ${MAKE_NOPRINT} $@

fclean: clean
	rm -f ${NAME}
	cd ${LIBS_PATH} && ${MAKE_NOPRINT} $@

%.o:%.c
	$(CC) $(FLAGS) -c $< -o $@ -I $(HEADER)

re: fclean all

.PHONY: all clean fclean re
