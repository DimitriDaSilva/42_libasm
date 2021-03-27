/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_write_test.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/27 11:14:28 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/27 11:19:24 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static int	test(int fd, const void *buf, size_t count)
{
	int	check = 1;

	write(fd, buf, count);
	ft_write(fd, buf, count);

	return (check);
}

void	ft_write_test(void)
{
	print_header("ft_write");

	check(test(1, "Test\n", strlen("Test\n")));
}
