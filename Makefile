# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ekoubbi <ekoubbi@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/06 16:11:02 by rvandepu          #+#    #+#              #
#    Updated: 2024/01/26 17:50:05 by ekoubbi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER := server
CLIENT := client

# FILES  :=
FILES  := utils \

OBJ_SERVER := $(SERVER).o $(FILES:%=%.o)
OBJ_CLIENT := $(CLIENT).o $(FILES:%=%.o)

CFLAGS += -Wall -Wextra -Werror

# libft
#LIBFT_DIR	:= libft
#LIBFT		:= libft.a
#LIBFT_PATH	:= $(LIBFT_DIR)/$(LIBFT)
#CPPFLAGS	+= -I$(LIBFT_DIR)
#LDFLAGS		+= -L$(LIBFT_DIR)
#LDLIBS		+= -lft

.PHONY: all clean fclean re test

all: $(SERVER) $(CLIENT)

clean:
	$(RM) $(SERVER).o $(CLIENT).o $(FILES:%=%.o)
#	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	$(RM) $(SERVER) $(CLIENT)
#	$(RM) $(LIBFT_PATH)

re: fclean all

test: CFLAGS += -g
test: re

#$(LIBFT_PATH):
#	$(MAKE) -C $(LIBFT_DIR) $(LIBFT) -j $$(nproc)

$(SERVER): $(OBJ_SERVER) | $(LIBFT_PATH)

$(CLIENT): $(OBJ_CLIENT) | $(LIBFT_PATH)
