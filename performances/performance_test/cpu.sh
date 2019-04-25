#!/bin/bash

ROS2_SDK_INSTALL_PATH="/home/ubuntu/___/ros2_release-latest_20190424_ws/install"

ROS2_PERFORMANCE_TEST_INSTALL_PATH="/home/ubuntu/___/irobot_perf_with_no_690/ws/install"

. $ROS2_SDK_INSTALL_PATH/local_setup.bash
. $ROS2_PERFORMANCE_TEST_INSTALL_PATH/local_setup.bash
. env_no690.sh
export MAX_PUBLISHERS=1
export MAX_SUBSCRIBERS=10
export MSG_TYPES=10b
export PUBLISH_FREQUENCY=100
export DURATION=30
export NUM_EXPERIMENTS=10
export MON_CPU_RAM=1
bash scripts/pub_sub_ros2.sh

echo -e "\033[36mpython scripts/plot_scripts/cpu_ram_plot.py <path_to_experiments> --x subs --y cpu --skip 5\033[0m"

