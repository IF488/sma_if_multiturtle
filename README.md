# sma_if_multiturtle
Ce package contient le package de la deuxième partie du projet SMA.
Il permet d'implémenter un système scalable de Turtlebot Leader-Follower sur Gazebo.

## Installation
Pour installer ce noeud il faut le cloner dans le dossier src de votre catkin workspace (catkin_ws).

```
cd catkin_ws/src
git clone https://github.com/IF488/sma_if_multiturtle.git
cd ..
catkin_make
source devel/setup.bash
```

## Execution
### Lancer Gazebo
Dans un premier terminal, lancer le Turtle World vide Gazebo:

```
roslaunch sma_if_multiturtle launch_gazebo.launch
```

### Lancer les Turtlebots
Il existe deux façons de lancer les turtlebots sur Gazebo.  
1) Nous pouvons faire directement appel au launch file, et définir les positions initiales des robots:

```
roslaunch sma_if_multiturtle turtle_multiple.launch multi_robot_name:=tb3_0 x_pos:=-2.0 y_pos:=1.0

roslaunch sma_if_multiturtle turtle_multiple.launch multi_robot_name:=tb3_1 x_pos:=-2.0 y_pos:=0.0

roslaunch sma_if_multiturtle turtle_multiple.launch multi_robot_name:=tb3_2 x_pos:=-2.0 y_pos:=-1.0
```
Note: Chaque commande doit etre lancé dans un terminal différent.  

2) Nous pouvons utiliser le Shell Script. Dans ce cas, seulement le nom du robot est requis, les positions des robots sont définis aléatoirement:

```
./n_robot.sh tb3_0

./n_robot.sh tb3_1

./n_robot.sh tb3_2
```
Note: Il faut avoir fait cd dans le directoire ou se trouve le Shell Script  

### Lancer les noeud leader-follower
Deux noeud leader-follower sont proposés.
1) multi_leader_follower.py permet d'implémenter un train robot. Le premier argument est le nom du leader, le deuxième argument est le nom du follower.

```
rosrun sma_if_multiturtle multi_leader_follower.py tb3_0 tb3_1

rosrun sma_if_multiturtle multi_leader_follower.py tb3_1 tb3_2
```
 
  
2) inter_leader_follower.py fait que si un robot se trouve a proximité du train robot, celui-ci devra rejoidre la flotte:

```
rosrun sma_if_multiturtle inter_leader_follower.py tb3_0 tb3_1

rosrun sma_if_multiturtle inter_leader_follower.py tb3_1 tb3_2
```

Note: Chaque commande doit etre lancé dans un terminal différent. Ici nous avons trois turtlebots nommés tb3_0 tb3_1 tb3_2, il est possible d'implémenter avec plus de robots.

### Lancer teleop pour le robot leader (ici tb3_0)

```
ROS_NAMESPACE=tb3_0 rosrun turtlebot3_teleop turtlebot3_teleop_key
```


