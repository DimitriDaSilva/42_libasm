/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_read_test.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dds <dda-silv@student.42lisboa.com>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/27 17:55:28 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/05 17:03:53 by dds              ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"
#define CHARS_READ 100

static int	test(int fd, void *buf, size_t max_read, int exp_errno_val)
{
	int		check = 1;
	size_t	written_bytes;

	written_bytes = ft_read(fd, buf, max_read);

	if (exp_errno_val != errno)
		check = 0;
	if (!(0 < written_bytes && written_bytes < max_read)
			&& errno == EXIT_SUCCESS)
		check = 0;

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
	check(test(99999, (void *)buf, CHARS_READ, EBADF)); bzero(buf, CHARS_READ);
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
