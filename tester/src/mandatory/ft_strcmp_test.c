/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_strlen.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:37:27 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/27 11:14:44 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static int	test(char *dest, char *src)
{
	int	ret_ft;
	int	ret;

	ret_ft = ft_strcmp(dest, src);
	ret = strcmp(dest, src);

	return (ret_ft == ret);
}

void	ft_strcmp_test(void)
{
	print_header("ft_strcmp");

	check(test("H", "H"));
	check(test("Hello, world!", "Hello, world!"));
	check(test("Hello, world!", "Hello world!"));
	check(test("", ""));
	check(test("Hello, world!", "Hello\0 world!"));
	check(test("Hello, world!", "Hello \0 world!"));
	check(test("Hello,         \0 world!", "Hello, world!"));
}
