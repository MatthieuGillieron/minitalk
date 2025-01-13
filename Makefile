NAME = minitalk

CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iheaders


SRC = $(wildcard src/*.c)
PRINTF = $(wildcard printf/*.c)
OBJ = $(SRC:.c=.o) $(PRINTF:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re