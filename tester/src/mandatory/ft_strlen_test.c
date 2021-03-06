/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_strlen.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:37:27 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/25 17:27:53 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	ft_strlen_test(void)
{
	print_header("ft_strlen");
	check(ft_strlen("42") == strlen("42"));
	check(ft_strlen("42\0 42") == strlen("42\0 42"));
	check(ft_strlen("") == strlen(""));
	check(ft_strlen("42") == strlen("42"));
}
