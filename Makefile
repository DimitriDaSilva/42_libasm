# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dds <dda-silv@student.42lisboa.com>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/18 18:52:53 by dda-silv          #+#    #+#              #
#    Updated: 2021/04/05 16:53:55 by dds              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Name of the library built
NAME				:= 		libasm.a

# Name directory
PATH_SRC			:=		src
PATH_BUILD			:=		build
PATH_INC			:=		includes

# List of sources
SRCS				:=		$(filter-out $(wildcard $(PATH_SRC)/*_bonus.s), $(shell find $(PATH_SRC) -name *.s))
SRCS_BONUS			:=		$(shell find $(PATH_SRC) -name *_bonus.s)
OBJS				:=		$(SRCS:%.s=$(PATH_BUILD)/%.o)
OBJS_BONUS			:=		$(SRCS_BONUS:%.s=$(PATH_BUILD)/%.o)

# Compilers
CC					:=		gcc
ASM					:=		nasm
AR					:=		ar -rcs

# Flags - compilation Assembly
FLAGS_COMP_ASM		:=		-g -f macho64

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
