cmake_minimum_required(VERSION 3.23)

# Project definition

project(idea VERSION 1.0.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 11)

# Build options

option(BUILD_SHARED_LIBS "Build shared library" ON)
option(FORTRAN_INTERFACE "Build with Fortran interface" ON)
option(BUILD_TESTING "Build IDEA Testing" ON)

# Enable Fortran

if (FORTRAN_INTERFACE)
    enable_language(Fortran)
    set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/fortran)
endif()

# Compiler flags

# Locate source files

file(GLOB SRCS CONFIGURE_DEPENDS "src/*.cpp")
file(GLOB SRCS_FORTRAN CONFIGURE_DEPENDS "src/*.f90")

# Create library files

add_library(idea ${SRCS})
target_sources(idea
    PRIVATE src/model.h
    PUBLIC FILE_SET HEADERS
    BASE_DIRS ${CMAKE_SOURCE_DIR}/include
    FILES include/idea.h)

if (FORTRAN_INTERFACE)
    add_library(idea_fortran ${SRCS_FORTRAN})
    target_link_libraries(idea_fortran PUBLIC idea)
endif()

# Testing

if (BUILD_TESTING)
    enable_testing()
    add_executable(main_example main_example.cpp)
    target_link_libraries(main_example PRIVATE idea)
    add_test(NAME main_example COMMAND main_example WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
    if (FORTRAN_INTERFACE)
        add_executable(fortran_example main_example.f90)
        target_link_libraries(fortran_example PRIVATE idea_fortran)
        add_test(NAME fortran_example COMMAND fortran_example WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
    endif()
endif()

# Install

install(TARGETS idea EXPORT ideaTargets FILE_SET HEADERS)
if (FORTRAN_INTERFACE)
    install(TARGETS idea_fortran EXPORT ideaTargets)
    install(FILES ${CMAKE_Fortran_MODULE_DIRECTORY}/idea.mod DESTINATION include)
endif()

install(EXPORT ideaTargets NAMESPACE idea:: DESTINATION lib/cmake/idea)

include(CMakePackageConfigHelpers)
write_basic_package_version_file("ideaConfigVersion.cmake"
    VERSION ${idea_VERSION} COMPATIBILITY SameMajorVersion)
install(FILES
    ${CMAKE_SOURCE_DIR}/ideaConfig.cmake
    ${CMAKE_BINARY_DIR}/ideaConfigVersion.cmake
    DESTINATION lib/cmake/idea)
