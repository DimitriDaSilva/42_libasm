# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dda-silv <dda-silv@student.42lisboa.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/18 18:52:53 by dda-silv          #+#    #+#              #
#    Updated: 2021/03/20 09:16:32 by dda-silv         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Name of the library built
NAME				:= 		libasm.a

# Name directory
PATH_SRC			:=		src
PATH_BUILD			:=		build

# List of sources
SRCS				:=		$(shell find $(PATH_SRC) -name *.s)
OBJS				:=		$(SRCS:%.s=$(PATH_BUILD)/%.o)
INC_DIRS			:=		$(shell find $(PATH_SRC) -type d)

# Dectect OS
UNAME				:=		$(shell uname)

# Compilers
CC					:=		gcc
ASM					:=		nasm
AR					:=		ar rcs

# Flags - compilation Assembly
ifeq ($(UNAME), Linux)
	FLAG_COMP_ASM	:=	-f elf64
else
	FLAG_COMP_ASM	:=	-f macho64
endif

# Flags - compilation C
FLAG_WARNING		:=		-Wall -Wextra -Werror
FLAG_INC			:= 		$(addprefix -I, $(INC_DIRS))
FLAG_DEBUG			:= 		-g
FLAGS_COMP_C		:= 		$(FLAG_WARNING) $(FLAG_INC) $(FLAG_DEBUG)

# Flags - memory leak check
FLAG_MEM_LEAK		:= 		-fsanitize=address

# Others commands
RM					:=		rm -rf

# Color Code and template code
_YELLOW				:=		\e[38;5;184m
_GREEN				:=		\e[38;5;46m
_RESET				:=		\e[0m
_INFO				:=		[$(_YELLOW)INFO$(_RESET)]
_SUCCESS			:=		[$(_GREEN)SUCCESS$(_RESET)]

# General functions
all:						init $(NAME)
							@ echo "$(_SUCCESS) Compilation done"

init:
							@ echo "$(_INFO) Initialize $(NAME)"

$(NAME):					$(OBJS)
							$(AR) $(NAME) $(OBJS)

$(PATH_BUILD)/%.o:			%.s
							mkdir -p $(dir $@)
							$(ASM) $(FLAGS_COMP_ASM) $< -o $@

clean:
							@ $(RM) $(PATH_BUILD)
							@ echo "$(_INFO) Deleted files and directory"

fclean:						clean
							@ $(RM) $(NAME)

re:							fclean all

.PHONY:						all clean fclean re

-include $(DEPS)

# Source for some pieces of this Makefile: 
# https://makefiletutorial.com/#makefile-cookbook