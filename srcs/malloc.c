/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   malloc.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tkara2 <tkara2@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/09/15 12:32:58 by tkara2            #+#    #+#             */
/*   Updated: 2025/09/15 15:56:08 by tkara2           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_malloc.h"

void	*malloc(size_t size)
{
	(void)size;
	write(STDOUT_FILENO, "Hello from malloc\n",strlen("Hello from malloc\n"));
	return NULL;
}