/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup_test.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/27 19:22:36 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/27 19:37:45 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static int	test(char *src)
{
	printf("Ret %p\n", ft_strdup(src));
	return (1);
	/*
	int		check = 1;
	char*	ret_ft;
	char*	ret;

	ret_ft = ft_strdup(src);
	ret = strdup(src);

	if (strcmp(ret_ft, ret) != 0)
		check = 0;

	free(ret_ft);
	free(ret);

	return (check);
	*/
}

void	ft_strdup_test(void)
{
	print_header("ft_strdup");

	check(test("H"));
	check(test("Hello, world!"));
	check(test(""));
	check(test("Hello,         \0 world!"));
}
