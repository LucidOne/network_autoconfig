cmake_minimum_required(VERSION 2.8.3)
project(network_autoconfig)

find_package(catkin REQUIRED)

catkin_package()

include_directories()

catkin_add_env_hooks(20.network_autoconfig SHELLS sh DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/env-hooks)
