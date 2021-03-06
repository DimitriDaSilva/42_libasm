/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.h                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:01:14 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/04 10:23:34 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MAIN_H
# define MAIN_H

typedef struct s_list
{
	void 		*data;
	struct		s_list *next;
} 				t_list;

# include <errno.h>
# include <stdio.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>
# include "../../includes/libasm.h"
# include "utils.h"

void	ft_strlen_test(void);
void	ft_strcpy_test(void);
void	ft_strcmp_test(void);
void	ft_write_test(void);
void	ft_read_test(void);
void	ft_strdup_test(void);
void	ft_atoi_base_test(void);
void	ft_list_push_front_test(void);
void	ft_list_size_test(void);
void	ft_list_sort_test(void);
void	ft_list_remove_if_test(void);

#endif
