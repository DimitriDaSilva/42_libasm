/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_remove_if_test.c                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/04 10:20:28 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/04 11:25:52 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

/* CMP functions */

static int	is_equal(void *data1, void *data2)
{
	return ((long long)data1 == (long long)data2);
}

/* FREE functions */

static void	free_int(void *data)
{
	int *tmp = data;
	*tmp = 0;
}

/*
static void	free_str(void *data)
{
	free(data);
}
*/

void	ft_list_remove_if_test(void)
{
	print_header("ft_remove_if");

	t_list	*list = NULL;
	void	*ret;

	ft_list_remove_if(0, (void *)1, &is_equal, &free_int);
	check(1);

	ft_list_remove_if(&list, (void *)1, &is_equal, &free_int);
	check(1);

	ft_list_push_front(&list, (void *)1);
	printf("Free's addr: %x\n", &free_int);
	printf("Cmp's addr: %x\n", &is_equal);
	ret = ft_list_remove_if(&list, (void *)2, &is_equal, &free_int);
	printf("Ret value: %d\n", (int)ret);
	check(list == NULL);



	/*
	check(list != NULL
		&& list->next != NULL 				&& list->data == (void *)10
		&& list->next->next != NULL			&& list->next->data == (void *)1
		&& list->next->next->next == NULL 	&& list->next->next->data == (void *)-10);
	*/

	delete_list(&list);

}
