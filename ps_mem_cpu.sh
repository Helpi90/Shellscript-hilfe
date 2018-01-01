# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ps_mem_cpu.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: macbook <macbook@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/30 22:53:46 by macbook           #+#    #+#              #
#    Updated: 2017/12/30 23:42:02 by macbook          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10

  PID  PPID CMD                         %MEM %CPU
 9032  8947 /home/pi/MagicMirror/node_m 33.4 43.9
 9020  8945 /home/pi/MagicMirror/node_m 12.1  218
 8945  8939 /home/pi/MagicMirror/node_m 10.4 33.7
 8899  8898 npm                          4.1  1.1
  846   837 /usr/lib/xorg/Xorg -s 0 -dp  3.5 12.1
  915     1 PM2 v2.6.1: God Daemon (/ho  2.5  0.0
 8947  8945 /home/pi/MagicMirror/node_m  2.4  0.0
 8939  8938 node /home/pi/MagicMirror/n  2.1  0.1
 1055   902 lxpanel --profile LXDE-pi    2.0  0.2

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head