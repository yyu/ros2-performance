#!/bin/bash

ROS2_SDK_INSTALL_PATH="/home/ubuntu/___/ros2_with_rclcpp690_ws/install"
ROS2_PERFORMANCE_TEST_INSTALL_PATH="/home/ubuntu/___/irobot_perf_ws/install"

. $ROS2_SDK_INSTALL_PATH/local_setup.bash
. $ROS2_PERFORMANCE_TEST_INSTALL_PATH/local_setup.bash
. env_with690.sh
export MAX_PUBLISHERS=1
export MAX_SUBSCRIBERS=5
export MSG_TYPES=8mb
export PUBLISH_FREQUENCY=100
export DURATION=600
export NUM_EXPERIMENTS=3
export MON_CPU_RAM=1
bash scripts/pub_sub_ros2.sh

echo -e "\033[36mpython scripts/plot_scripts/cpu_ram_plot.py <path_to_experiments> --x subs --y cpu --skip 5\033[0m"

