# Project configuration
#------------------------------------------------------------------------------
set(MINIMUM_REQUIRED_CMAKE_VERSION 3.21)
cmake_minimum_required(VERSION ${MINIMUM_REQUIRED_CMAKE_VERSION})

# default value for CMAKE_INSTALL_PREFIX if it is not defined by user
# needs to be set before the "project" command
set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/install" CACHE PATH "default install prefix")
set(CMAKE_CONFIGURATION_TYPES "Release;Debug" CACHE STRING "config types")

project(OpenCVLinkerTest
  VERSION 0.0.1 
  DESCRIPTION "minimum reproducable example"
  LANGUAGES CXX
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY bin)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/.cmake")

# Compiler flags and definitions
#------------------------------------------------------------------------------
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Additional cmake stuff - files are located in ./.cmake
#------------------------------------------------------------------------------
include(policy)

include_directories(${CMAKE_SOURCE_DIR}/include)

# list(APPEND CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/lib/opencv/debug")
# TODO: fix this find_package stuff so i can build both release and debug
find_package(OpenCV REQUIRED
    PATHS 
    "${CMAKE_SOURCE_DIR}/lib/opencv/release"
    "${CMAKE_SOURCE_DIR}/lib/opencv/debug"
    )

# Libraries
add_subdirectory(modules)

# Applications
add_subdirectory(apps)
