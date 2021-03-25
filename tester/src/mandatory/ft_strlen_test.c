/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_strlen.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:37:27 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/25 13:42:45 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	ft_strlen_test(void)
{
	print_header("ft_strlen");
	test(ft_strlen("123") == strlen("123"));
	test(ft_strlen("") == strlen(""));
	test(ft_strlen("123") == strlen("123"));
	test(ft_strlen(NULL) == strlen(NULL));
}
