cmake_minimum_required(VERSION ${MINIMUM_REQUIRED_CMAKE_VERSION})

# set these variables to get versioning info in Properties Menu -> Details
set(FILE_DESCRIPTION_STR "sample app 1")
set(MAJOR_NUMBER 1)
set(MINOR_NUMBER 0)
set(REVISION_NUMBER 0)

project(app1
  VERSION ${MAJOR_NUMBER}.${MINOR_NUMBER}
  LANGUAGES CXX
  DESCRIPTION ""
  )

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} module1 ${OpenCV_LIBS})

install(TARGETS ${PROJECT_NAME}
        EXPORT ${PROJECT_NAME}-targets
        RUNTIME DESTINATION ${PROJECT_NAME})

