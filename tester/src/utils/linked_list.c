/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   linked_list.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/04 10:29:03 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/04 10:30:27 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "utils.h"

void delete_list(t_list **head)
{
	t_list *tmp = NULL;

	while (*head != NULL)
	{
		tmp = *head;
		*head = (*head)->next;
		free(tmp);
	}

	*head = NULL;
}

void print_list(t_list *head)
{
	if (head == NULL)
	{
		printf("List empty\n");
		return;
	}

	t_list *tmp = head;

	while (tmp->next != NULL)
	{
		printf("%d > ", (int)tmp->data);
		tmp = tmp->next;
	}
	printf("%d\n", (int)tmp->data);
}
