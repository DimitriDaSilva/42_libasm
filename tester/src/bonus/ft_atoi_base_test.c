/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base_test.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-silv <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/29 12:50:26 by dda-silv          #+#    #+#             */
/*   Updated: 2021/04/04 09:02:04 by dda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	ft_atoi_base_test(void)
{
	char *bin = "01";
	char *hex = "0123456789abcdef";
	char *dec = "0123456789";

	print_header("ft_atoi_base");

	check(ft_atoi_base(0, dec) == 0);

	check(ft_atoi_base("    +++12", 0) == 0);
	check(ft_atoi_base("    +++12", "") == 0);
	check(ft_atoi_base("    +++12", "1") == 0);
	check(ft_atoi_base("    +++12", "-123456789") == 0);
	check(ft_atoi_base("    +++12", "12345-6789") == 0);
	check(ft_atoi_base("    +++12", "123456789-") == 0);
	check(ft_atoi_base("    +++12", "12345+6789") == 0);
	check(ft_atoi_base("    +++12", "12345        6789") == 0);
	check(ft_atoi_base("    +++12", "11") == 0);
	check(ft_atoi_base("    +++12", "1234556789") == 0);

	check(ft_atoi_base("    +++42", dec) == 42);
	check(ft_atoi_base("    ++-+42", dec) == -42);
	check(ft_atoi_base("  \t \r 42", dec) == 42);

	check(ft_atoi_base("    +++2a", hex) == 42);
	check(ft_atoi_base("    +-++2a", hex) == -42);
	check(ft_atoi_base("  \t \r 2a", hex) == 42);

	check(ft_atoi_base("    +++1010", bin) == 10);
	check(ft_atoi_base("    +-++1010", bin) == -10);
	check(ft_atoi_base("  \t \r 1010", bin) == 10);
}
