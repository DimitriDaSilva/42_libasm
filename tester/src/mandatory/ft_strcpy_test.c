/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcpy_test.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/25 17:08:41 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/25 17:47:20 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static int	test(char *src)
{
	int		check = 1;
	char 	dest_ft[50];
	char 	dest[50];
	char	*ret_ft;
	char 	*ret;

	ret_ft = ft_strcpy(dest_ft, src);
	ret = strcpy(dest, src);

	if (strcmp(dest_ft, dest) != 0)
		check = 0;
	if (strcmp(ret_ft, ret) != 0)
		check = 0;
	
	return (check);
}

void	ft_strcpy_test(void)
{
	print_header("ft_strcpy");

	check(test("Hello, world!"));
	check(test(""));
	check(test("Hello,\0 world!"));
}
