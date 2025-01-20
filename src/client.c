/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mg <mg@student.42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/12 12:35:36 by mg                #+#    #+#             */
/*   Updated: 2025/01/20 09:54:00 by mg               ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static void	ft_transmission(int srv_pid, char c)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if (c & (0x80 >> bit))
			kill(srv_pid, SIGUSR1);
		else
			kill(srv_pid, SIGUSR2);
		bit++;
		usleep(100);
	}
}

static int	ft_atoi_pid(const char *str)
{
	int	i;
	int	result;

	i = 0;
	result = 0;
	if (!str || str[0] < '0' || str[0] > '9')
		return (-1);
	while (str[i] >= '0' && str[i] <= '9')
	{
		result = result * 10 + (str[i] - '0');
		i++;
	}
	if (str[i] != '\0')
		return (-1);
	return (result);
}

int	main(int ac, char **av)
{
	pid_t	srv_pid;
	char	*message;
	int		i;

	message = av[2];
	i = 0;
	if (ac != 3)
	{
		ft_printf("Expected : ./client [enter PID Server] [You'r message]\n");
		return (1);
	}
	srv_pid = ft_atoi_pid(av[1]);
	if (srv_pid == -1)
	{
		ft_printf("Invalid PID\nExpected : ./client [PID Server] [Message.]\n");
		return (1);
	}
	while (message[i])
	{
		ft_transmission(srv_pid, message[i]);
		i++;
	}
	ft_transmission(srv_pid, '\0');
	return (0);
}
