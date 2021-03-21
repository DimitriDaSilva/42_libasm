# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dda-silv <dda-silv@student.42lisboa.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/18 18:52:53 by dda-silv          #+#    #+#              #
#    Updated: 2021/03/21 16:45:52 by dda-silv         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Name of the library built
NAME				:= 		libasm.a

# Name directory
PATH_SRC			:=		src
PATH_BUILD			:=		build
PATH_INC			:=		includes

# List of sources
SRCS				:=		$(filter-out *_bonus.s, $(shell find $(PATH_SRC) -name *.s))
SRCS_BONUS			:=		$(shell find $(PATH_SRC) -name *_bonus.s)
OBJS				:=		$(SRCS:%.s=$(PATH_BUILD)/%.o)
OBJS_BONUS			:=		$(SRCS_BONUS:%.s=$(PATH_BUILD)/%.o)
SRC_MAIN			:=		main.c

# Dectect OS
UNAME				:=		$(shell uname)

# Compilers
CC					:=		gcc
ASM					:=		nasm
AR					:=		ar -rcs

# Flags - compilation Assembly
ifeq ($(UNAME), Linux)
	FLAG_COMP_ASM	:=	-f elf64
else
	FLAG_COMP_ASM	:=	-f macho64
endif

# Flags - compilation C
FLAG_WARNING		:=		-Wall -Wextra -Werror
FLAG_DEBUG			:= 		-g
FLAGS_COMP_C		:= 		$(FLAG_WARNING) $(FLAG_DEBUG)

# Flags - memory leak check
FLAG_MEM_LEAK		:= 		-fsanitize=address

# Others commands
RM					:=		rm -rf

# General rules
all:						$(NAME)

$(NAME):					$(OBJS)
							@ $(AR) $(NAME) $(OBJS)

bonus:						$(OBJS) $(OBJS_BONUS)
							@ $(AR) $(NAME) $(OBJS) $(OBJS_BONUS)

$(PATH_BUILD)/%.o:			%.s
							@ mkdir -p $(dir $@)
							@ $(ASM) $(FLAGS_COMP_ASM) $< -o $@

clean:
							@ $(RM) $(PATH_BUILD)

fclean:						clean
							@ $(RM) $(NAME)

re:							fclean all

.PHONY:						all clean fclean re

# Testing rules
test:						$(NAME)
							@ $(CC) $(FLAGS_COMP_C) -I$(PATH_INC) $(NAME) $(SRC_MAIN)
							@ ./a.out
							@ $(RM) a.out
