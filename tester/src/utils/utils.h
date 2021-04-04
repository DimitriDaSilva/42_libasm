/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/25 13:00:36 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/04 12:56:13 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef UTILS_H
# define UTILS_H

# define GREEN "\033[0;32m"
# define RED "\033[0;31m"
# define RESET "\033[0m"

# include "main.h"

void	print_header(char *str);
void	check(int answer);
void 	delete_list(t_list **head);
void 	print_list(t_list *head);

#endif
