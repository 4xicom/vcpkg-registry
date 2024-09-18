cmake_minimum_required(VERSION 3.10)

project(bolib)

# Find the fmt library
find_package(fmt CONFIG REQUIRED)

# Add your library
add_library(bolib STATIC bolib.cpp)

# Link your library to fmt
target_link_libraries(bolib PRIVATE fmt::fmt)

# Add include directories
target_include_directories(bolib PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>   # for headers when building
    $<INSTALL_INTERFACE:include>  # for client in install mode
)
# Install the library and its headers
install(TARGETS bolib
        EXPORT bolib_targets
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)

install(FILES bolib.h DESTINATION include)


# Generate and install *-targets.cmake 
install(EXPORT bolib_targets
        FILE bolib-targets.cmake
        NAMESPACE bolib::
        DESTINATION share/bolib)

# Generate the config file in the current binary dir (this ensures it's not placed directly in source)
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/bolib-config.cmake"
"include(CMakeFindDependencyMacro)\n"
"find_dependency(fmt CONFIG REQUIRED)\n"
"include(\"\${CMAKE_CURRENT_LIST_DIR}/bolib-targets.cmake\")\n"
)

# Install the generated config file
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/bolib-config.cmake"
        DESTINATION share/bolib)