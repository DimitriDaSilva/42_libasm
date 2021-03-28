# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dda-silv <dda-silv@student.42lisboa.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/18 18:52:53 by dda-silv          #+#    #+#              #
#    Updated: 2021/03/28 10:39:00 by dda-silv         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Name of the library built
NAME				:= 		libasm.a

# Name directory
PATH_SRC			:=		src
PATH_BUILD			:=		build
PATH_INC			:=		includes

# List of sources
#SRCS				:=		src/ft_strlen.s
SRCS				:=		$(filter-out *_bonus.s, $(shell find $(PATH_SRC) -name *.s))
#SRCS				:=		$(shell find $(PATH_SRC) -name *.s)
SRCS_BONUS			:=		$(shell find $(PATH_SRC) -name *_bonus.s)
OBJS				:=		$(SRCS:%.s=$(PATH_BUILD)/%.o)
OBJS_BONUS			:=		$(SRCS_BONUS:%.s=$(PATH_BUILD)/%.o)

# Compilers
CC					:=		gcc
ASM					:=		nasm
AR					:=		ar -rcs

# Flags - compilation Assembly
FLAGS_COMP_ASM		:=		-f macho64

# Flags - compilation C
FLAG_WARNING		:=		-Wall -Wextra -Werror
FLAG_DEBUG			:= 		-g
FLAGS_COMP_C		:= 		$(FLAG_WARNING) $(FLAG_DEBUG)

# Flags - memory leak check
FLAG_MEM_LEAK		:= 		-fsanitize=address

# Others
RM					:=		rm -rf

# General rules
all:						$(NAME)

$(NAME):					$(OBJS)
							$(AR) $(NAME) $(OBJS)

bonus:						$(OBJS) $(OBJS_BONUS)
							$(AR) $(NAME) $(OBJS) $(OBJS_BONUS)

$(PATH_BUILD)/%.o:			%.s
							mkdir -p $(dir $@)
							$(ASM) $(FLAGS_COMP_ASM) $< -o $@

clean:
							@ $(RM) $(PATH_BUILD)

fclean:						clean
							@ $(RM) $(NAME)

re:							fclean all

.PHONY:						all clean fclean re
