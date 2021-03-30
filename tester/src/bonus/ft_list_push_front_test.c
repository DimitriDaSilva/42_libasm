/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_push_front_test.c                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/30 15:32:29 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/30 15:34:12 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static int	test()
{
	int		check = 1;

	return (check);
}

void	ft_list_push_front_test(void)
{
	print_header("ft_list_push_front");

	check(test());
}
