/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_push_front_test.c                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/30 15:32:29 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/31 16:03:41 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"
/*
static int	test()
{
	int		check = 1;

	return (check);
}*/

void	ft_list_push_front_test(void)
{
	print_header("ft_list_push_front");

	t_list *list = 0;

	list = ft_create_elem("head");
	printf("Data: %s\n", list->data);
	printf("Next: %p\n", list->next);
	ft_list_push_front(&list, "new head");
	printf("Data: %s\n", list->next->data);
	printf("Next: %p\n", list->next->next);

	free(list->next);
	free(list);


//	check(test());
}
