/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_sort_test.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/31 22:47:41 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/02 23:36:45 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	ft_list_sort_test(void)
{
	print_header("ft_list_sort_test");

	t_list	*list = 0;

	printf("List is empty\n");
	printf("Begin_list: %p\n", &list);
	printf("Running ft_list_sort... \n");
	ft_list_sort(&list, strcmp);
	printf("No crash!\n");
	printf("\n");

	printf("Adding a node with 1 as data... \n");
	ft_list_push_front(&list, (void *)1);
	printf("List:\n");
	printf("Begin_list %p\n", &list);
	printf("1st node: data = %d & next = %p & addr = %p\n", (int)list->data, list->next, list);
	printf("Running ft_list_sort... \n");
	ft_list_sort(&list, strcmp);
	printf("List:\n");
	printf("Begin_list %p\n", &list);
	printf("1st node: data = %d & next = %p & addr = %p\n", (int)list->data, list->next, list);
	printf("\n");

	printf("Adding a node with 2 as data... \n");
	ft_list_push_front(&list, (void *)2);
	printf("List:\n");
	printf("Begin_list %p\n", &list);
	printf("1st node: data = %d & next = %p & addr = %p\n", (int)list->data, list->next, list);
	printf("2nd node: data = %d & next = %p & addr = %p\n", (int)list->next->data, list->next->next, list->next);
	printf("Running ft_list_sort... \n");
	//ft_list_sort(&list, strcmp);
	printf("\n");
	printf("Ret value:    %p\n", ft_list_sort(&list, strcmp));
	printf("\n");
	printf("Begin_list %p\n", &list);
	printf("1st node: data = %d & next = %p & addr = %p\n", (int)list->data, list->next, list);
	printf("2nd node: data = %d & next = %p & addr = %p\n", (int)list->next->data, list->next->next, list->next);

	/*

	//printf("Begin_list:   %p\n", &list);
	//printf("Ret value:    %p\n", ft_list_sort(&list, strcmp));
	//ft_list_push_front(&list, (void *)1);
	//printf("1st node:     %p\n", list);
	//printf("2nd node:     %p\n", list->next);
	//printf("Ret value:    %p\n", ft_list_sort(&list, strcmp));
	//printf("Ret value:    %p\n", ft_list_sort(&list, strcmp));
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
