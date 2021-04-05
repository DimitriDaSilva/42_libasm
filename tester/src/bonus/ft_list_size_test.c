/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_size_test.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/31 22:44:59 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/05 15:38:56 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	ft_list_size_test(void)
{
	print_header("ft_list_size");

	t_list	*list = 0;

	check(ft_list_size(list) == 0);
	ft_list_push_front(&list, (void *)1);
	check(ft_list_size(list) == 1);
	ft_list_push_front(&list, (void *)2);
	check(ft_list_size(list) == 2);

	free(list->next);
	free(list);
}
