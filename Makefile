# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkara2 <tkara2@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/15 12:19:52 by tkara2            #+#    #+#              #
#    Updated: 2025/09/15 14:50:44 by tkara2           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft_malloc.so
SRCS = srcs/malloc.c
INCS = ./incs/ft_malloc.h

OBJS_DIR = .objs/
OBJS = $(patsubst %.c, $(OBJS_DIR)%.o, $(SRCS))
D_FILES = $(OBJS:.o=.d)

ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

TARGET = libft_malloc_$(HOSTTYPE).so

CC = cc
CFLAGS = -Wall -Werror -Wextra -Iincs -fPIC -MMD -MP
RM = rm -rf

all: $(TARGET)

$(TARGET): $(OBJS) $(INCS)
	$(CC) $(CFLAGS) -shared $(OBJS) -o $(TARGET)
	ln -sf $(TARGET) $(NAME)

$(OBJS_DIR)%.o: %.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

TEST_SRC = ./test/test.c
TEST_INC = ./test/test.h

test: $(TARGET) $(TEST_INC)
	$(CC) -Wall -Werror -Wextra -Wl,-rpath=. -Itest $(TEST_SRC) $(TARGET) -o ./test/a.out
	./test/a.out

clean:
	$(RM) $(OBJS_DIR)

fclean: clean
	$(RM) $(TARGET)
	$(RM) $(NAME)

re: fclean
	$(MAKE) all

sinclude $(D_FILES)

.PHONY: all clean fclean re test