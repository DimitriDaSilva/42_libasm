/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_push_front_test.c                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/30 15:32:29 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/01 20:46:12 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	ft_list_push_front_test(void)
{
	print_header("ft_list_push_front");

	t_list	*list = 0;

	ft_list_push_front(&list, (void *)1);
	check(list->data == (void *)1 && list->next == 0);

	ft_list_push_front(&list, (void *)2);
	check(list->data == (void *)2 && list->next != 0 && list->next->data == (void *)1 && list->next->next == 0);

	free(list->next);
	free(list);
}
