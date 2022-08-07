/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ChelseyLeonia <ChelseyLeonia@student.42    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/07 16:11:32 by celys             #+#    #+#             */
/*   Updated: 2021/11/22 10:52:46 by ChelseyLeon      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

void	minishell(t_main *main, struct termios *term_settings)
{
	int				retval;
	char			*line;

	line = ft_readline();
	tcsetattr(0, TCSANOW, &(*term_settings));
	if (line == NULL)
		exit(main->exit_status);
	if (*line == '\0')
		return (free(line));
	add_history(line);
	retval = parser(&line, main);
	if (main->exit_status == NOT_ERROR)
		main->exit_status = main->last_exit_status;
	main->gap = main->first_gap;
	init_first_arg(main);
	if (retval != E_PREPARSER)
	{
		init_pid(main);
		execute(main);
		wait_pid(main);
	}
	ft_free_main(main, line);
}

int	main(int argc, char **argv, char **envp)
{
	struct termios	term_settings;
	t_main			main;

	(void) argc;
	(void) argv;
	rl_catch_signals = 0;
	tcgetattr(0, &term_settings);
	main.envp = array_2d_dup(envp);
	main.exit_status = 0;
	signal(SIGQUIT, signal_handler);
	while (1)
		minishell(&main, &term_settings);
	return (0);
}
