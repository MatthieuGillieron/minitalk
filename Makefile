
NAME = minitalk

CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iprintf/header

OBJDIR = obj

SRC_CLIENT = src/client.c
SRC_SERVER = src/server.c
PRINTF_SRC = $(wildcard printf/src/*.c)

OBJ_CLIENT = $(addprefix $(OBJDIR)/, $(notdir $(SRC_CLIENT:.c=.o)))
OBJ_SERVER = $(addprefix $(OBJDIR)/, $(notdir $(SRC_SERVER:.c=.o)))
PRINTF_OBJ = $(addprefix $(OBJDIR)/, $(notdir $(PRINTF_SRC:.c=.o)))

CLIENT_NAME = client
SERVER_NAME = server

all: $(OBJDIR) $(CLIENT_NAME) $(SERVER_NAME)

$(CLIENT_NAME): $(OBJ_CLIENT) $(PRINTF_OBJ)
	$(CC) $(CFLAGS) $(OBJ_CLIENT) $(PRINTF_OBJ) -o $(CLIENT_NAME)

$(SERVER_NAME): $(OBJ_SERVER) $(PRINTF_OBJ)
	$(CC) $(CFLAGS) $(OBJ_SERVER) $(PRINTF_OBJ) -o $(SERVER_NAME)

$(OBJDIR)/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o: printf/src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)


clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(CLIENT_NAME) $(SERVER_NAME)

re: fclean all

.PHONY: all clean fclean re
