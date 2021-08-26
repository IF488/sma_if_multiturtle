#!/bin/bash

#roslaunch amclmulti amcl_tb0.launch

a=-2
b=2
roslaunch amclmulti test_multiple.launch multi_robot_name:=$1 x_pos:="$((a+RANDOM%(b-a))).$((RANDOM%9))" y_pos:="$((a+RANDOM%(b-a))).$((RANDOM%9))"




