#!/bin/bash

ROS2_SDK_INSTALL_PATH="/home/ubuntu/___/ros2_with_rclcpp690_ws/install"
ROS2_PERFORMANCE_TEST_INSTALL_PATH="/home/ubuntu/___/irobot_perf_ws/install"

. $ROS2_SDK_INSTALL_PATH/local_setup.bash
. $ROS2_PERFORMANCE_TEST_INSTALL_PATH/local_setup.bash
. env_no690.sh

export MAX_PUBLISHERS=1
export MAX_SUBSCRIBERS=1
export MSG_TYPES="10b 100b 250b 1kb 10kb 250kb 1mb 4mb 8mb"
export DURATION=10
export NUM_EXPERIMENTS=3
bash scripts/only_subs.sh

echo -en "\033[36m"
echo -en "python3 scripts/plot_scripts/cpu_ram_plot.py results/only_subs_ros2/cpu_ram* --x subs --y rss --y2 vsz"
echo -e "\033[0m"

