
NAME = minitalk

CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iprintf/header

SRC_CLIENT = src/client.c
SRC_SERVER = src/server.c

OBJ_CLIENT = $(SRC_CLIENT:.c=.o)
OBJ_SERVER = $(SRC_SERVER:.c=.o)

PRINTF_SRC = $(wildcard printf/src/*.c)
PRINTF_OBJ = $(PRINTF_SRC:.c=.o)

CLIENT_NAME = client
SERVER_NAME = server

all: $(CLIENT_NAME) $(SERVER_NAME)

$(CLIENT_NAME): $(OBJ_CLIENT) $(PRINTF_OBJ)
	$(CC) $(CFLAGS) $(OBJ_CLIENT) $(PRINTF_OBJ) -o $(CLIENT_NAME)
$(SERVER_NAME): $(OBJ_SERVER) $(PRINTF_OBJ)
	$(CC) $(CFLAGS) $(OBJ_SERVER) $(PRINTF_OBJ) -o $(SERVER_NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@


clean:
	rm -f $(OBJ_CLIENT) $(OBJ_SERVER) $(PRINTF_OBJ)

fclean: clean
	rm -f $(CLIENT_NAME) $(SERVER_NAME)

re: fclean all

.PHONY: all clean fclean re
