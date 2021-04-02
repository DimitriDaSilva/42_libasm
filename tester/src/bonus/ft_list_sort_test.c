/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_sort_test.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/31 22:47:41 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/02 09:38:50 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	ft_list_sort_test(void)
{
	print_header("ft_list_sort_test");

	t_list	*list = 0;

	//ft_list_sort(&list, strcmp);
	ft_list_push_front(&list, (void *)2);
	printf("Ret value:    %p\n", ft_list_sort(&list, strcmp));
	/*
	printf("Next address: %p\n", list->next);
	printf("Head address: %p\n", list);

	ft_list_push_front(&list, (void *)2);
	ft_list_sort(&list, strcmp);
	check(list->data == (void *)2);
	ft_list_push_front(&list, (void *)1);
	ft_list_sort(&list, strcmp);
	check(list->data == (void *)1 && list->data == (void *)2);
	free(list->next);
	*/

	free(list);
}
