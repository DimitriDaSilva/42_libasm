/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <dda-silv@student.42lisboa.com>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/16 17:11:41 by dda-silv          #+#    #+#             */
/*   Updated: 2021/03/20 17:05:00 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./includes/libasm.h"

int main(void)
{
	char *str = "Hello, world!";

    printf("Libasm: %ld\n", ft_strlen(str));
    printf("Libc: %ld\n", strlen(str));
    return 0;
}
