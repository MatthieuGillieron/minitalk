/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mg <mg@student.42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/12 12:35:25 by mg                #+#    #+#             */
/*   Updated: 2025/01/16 15:29:29 by mg               ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static int is_complete = 0;

static	void ft_handle_signal(int signal)
{
	static int	bit;
	static char c;

	bit = 0;
	c = 0;

	if (signal == SIGUSR1)
		c |= (0x80 >> bit);
	else if (signal == SIGUSR2)
		c &= ~(0x80 >> bit);
	bit++;
	if (bit == 8)
	{
		if (c == '\0')
			is_complete = 1;
		write(1, &c, 1);
		c = 0;
		bit = 0;

	}
}

int main(int ac, char **av)
{
	(void)av;
	if (ac != 1)
	{
		ft_printf("Expected : ./server \n");
		return (1);
	}
	ft_printf("serv. PID : %d\n", getpid());
	signal(SIGUSR1, ft_handle_signal);
	signal(SIGUSR2, ft_handle_signal);
	while (1)
	{
		pause();
		if (is_complete == 1)
		{
			ft_printf("Received, waiting for the next\n");
			is_complete = 0;
		}
	}
	return (0);
}
