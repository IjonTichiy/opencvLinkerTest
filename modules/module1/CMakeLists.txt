cmake_minimum_required(VERSION ${MINIMUM_REQUIRED_CMAKE_VERSION})

# set these variables to get versioning info in Properties Menu -> Details
set(FILE_DESCRIPTION_STR "module 1")
set(MAJOR_NUMBER 1)
set(MINOR_NUMBER 1)
set(REVISION_NUMBER 3)

# basic utilities
#---------------------------------------
project(module1
  VERSION ${MAJOR_NUMBER}.${MINOR_NUMBER}
  DESCRIPTION "${FILE_DESCRIPTION_STR}"
  LANGUAGES CXX
  )

add_library(${PROJECT_NAME})

target_include_directories(
  ${PROJECT_NAME} PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/>
  $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/modules/>
  $<INSTALL_INTERFACE:include/${CMAKE_PROJECT_NAME}>
  )

set(PROJECT_HEADERS
  ${CMAKE_SOURCE_DIR}/modules/${PROJECT_NAME}/Helpers.h
  )

target_sources(${PROJECT_NAME}
  PRIVATE
  ${CMAKE_SOURCE_DIR}/modules/${PROJECT_NAME}/Helpers.cpp
  ${${PROJECT_NAME}_HEADERS}
  )

set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${PROJECT_HEADERS}")

install(
  TARGETS ${PROJECT_NAME}
  EXPORT "${PROJECT_NAME}-targets"
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib/${CMAKE_PROJECT_NAME}
  RUNTIME DESTINATION bin
  PUBLIC_HEADER DESTINATION include/${CMAKE_PROJECT_NAME}/${PROJECT_NAME}
)
