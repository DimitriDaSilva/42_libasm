/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <dda-silv@student.42lisboa.com>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/16 17:11:41 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/31 15:31:55 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

int	main(int argc, char *argv[])
{
	(void)argv;
	(void)argc;

	print_header("MANDATORY PART");

	ft_strlen_test();
	ft_strcpy_test();
	ft_strcmp_test();
	ft_write_test();
	ft_read_test();
	ft_strdup_test();

	printf("\n");
	print_header("BONUS PART");

	ft_atoi_base_test();
	ft_list_push_front_test();
	//ft_list_size_test();
	//ft_list_sort_test();
	//ft_list_remove_if_test();

	return (0);
}
