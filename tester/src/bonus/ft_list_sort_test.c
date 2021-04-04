/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_sort_test.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dds <dda-silv@student.42lisboa.com>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/31 22:47:41 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/04 10:34:36 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static int	ascending(void *d1, void *d2)
{
	return ((int)((long long)d1 > (long long)d2));
}

static int	descending(void *d1, void *d2)
{
	return ((int)((long long)d1 < (long long)d2));
}

void	ft_list_sort_test(void)
{
	print_header("ft_list_sort_test");

	t_list	*list = NULL;

	ft_list_sort(&list, &ascending);
	check(list == NULL);

	ft_list_push_front(&list, (void *)10);
	ft_list_sort(&list, &ascending);
	check(list != NULL
		&& list->next == NULL 				&& list->data == (void *)10);

	ft_list_push_front(&list, (void *)-10);
	ft_list_push_front(&list, (void *)1);
	ft_list_sort(&list, &ascending);
	check(list != NULL
		&& list->next != NULL 				&& list->data == (void *)-10
		&& list->next->next != NULL			&& list->next->data == (void *)1
		&& list->next->next->next == NULL 	&& list->next->next->data == (void *)10);

	ft_list_sort(&list, &descending);
	check(list != NULL
		&& list->next != NULL 				&& list->data == (void *)10
		&& list->next->next != NULL			&& list->next->data == (void *)1
		&& list->next->next->next == NULL 	&& list->next->next->data == (void *)-10);

	delete_list(&list);
}
