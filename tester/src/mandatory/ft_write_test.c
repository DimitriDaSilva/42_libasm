/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_write_test.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/27 11:14:28 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/27 18:34:35 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static int	test(int fd, const void *buf, size_t count, int exp_errno_val)
{
	int		check = 1;
	size_t	written_bytes;

	written_bytes = ft_write(fd, buf, count);

	if (exp_errno_val != errno)
		check = 0;
	if (count != written_bytes && errno == EXIT_SUCCESS)
		check = 0;

	// Reset errno to 0
	errno = 0;

	return (check);
}

void	ft_write_test(void)
{
	print_header("ft_write");

	check(test(1, "Hello, world!\n", strlen("Hello, world!\n"), EXIT_SUCCESS));
	check(test(-1, "Hello, world!\n", strlen("Hello, world!\n"), EBADF));
	check(test(4, "Hello, world!\n", strlen("Hello, world!\n"), EBADF));

	int fd;
	if ((fd = open("files/1.txt", O_WRONLY | O_APPEND | O_CREAT, 0644)) == -1)
	{
		printf("Can't open\n");
		exit(EXIT_FAILURE);
	}
	check(test(fd, "Hello, world!\n", strlen("Hello, world!\n"), EXIT_SUCCESS));
	if (close(fd))
	{
		printf("Can't close\n");
		exit(EXIT_FAILURE);
	}
}
