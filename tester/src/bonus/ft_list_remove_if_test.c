/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_remove_if_test.c                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/04 10:20:28 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/05 15:37:38 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static int	is_equal(void *data1, void *data2)
{
	return (*(long long *)data1 == *(long long *)data2);
}

static void	free_int(void *data)
{
	*(long long *)data = 0;
}

void	ft_list_remove_if_test(void)
{
	print_header("ft_remove_if");

	t_list		*list = NULL;
	void		*ret;
	long long	data_ref;
	long long	data1;
	long long	data2;
	long long	data3;

	ft_list_remove_if(0, (void *)1, &is_equal, &free_int);
	check(1);

	ft_list_remove_if(&list, (void *)1, &is_equal, &free_int);
	check(list == NULL);

	data_ref = 2;
	data1 = 1;
	ft_list_push_front(&list, &data1);
	ret = ft_list_remove_if(&list, &data_ref, &is_equal, &free_int);
	check(list == NULL);

	data_ref = 1;
	data1 = 1;
	data2 = -10;
	data3 = 10;
	ft_list_push_front(&list, &data1);
	ft_list_push_front(&list, &data2);
	ft_list_push_front(&list, &data3);
	ret = ft_list_remove_if(&list, &data_ref, &is_equal, &free_int);
	check(list != NULL
		&& list->next == NULL 				&& list->data == &data1);

	delete_list(&list);

}
