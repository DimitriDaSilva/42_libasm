/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_read_test.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/27 17:55:28 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/27 18:42:54 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"
#define CHARS_READ 100

static int	test(int fd, void *buf, size_t count, int exp_errno_val)
{
	int		check = 1;
	size_t	written_bytes;

	written_bytes = ft_read(fd, buf, count);

	if (exp_errno_val != errno)
	{
		printf("errno: %d\n", errno);
		check = 0;
	}
	if (count != written_bytes && errno == EXIT_SUCCESS)
	{
		printf("errno: %d\n", errno);
		check = 0;
	}

	// Reset errno to 0
	errno = 0;

	return (check);
}

void	ft_read_test(void)
{
	char buf[CHARS_READ];
	int fd;

	print_header("ft_read");

	check(test(1, (void *)buf, CHARS_READ, EXIT_SUCCESS)); bzero(buf, CHARS_READ);
	check(test(5, (void *)buf, CHARS_READ, EBADF)); bzero(buf, CHARS_READ);
	check(test(-1, (void *)buf, CHARS_READ, EBADF)); bzero(buf, CHARS_READ);

	if ((fd = open("files/1.txt", O_RDONLY)) == -1)
	{
		printf("Can't open\n");
		exit(EXIT_FAILURE);
	}
	check(test(fd, (void *)buf, CHARS_READ, EXIT_SUCCESS)); bzero(buf, CHARS_READ);
	if (close(fd))
	{
		printf("Can't close\n");
		exit(EXIT_FAILURE);
	}
}
