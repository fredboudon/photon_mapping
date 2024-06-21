# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /tmp/pip-build-env-_pyv4d4y/overlay/lib/python3.12/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /tmp/pip-build-env-_pyv4d4y/overlay/lib/python3.12/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tmnguyen/Bureau/photon_mapping

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core

# Include any dependencies generated for this target.
include src/cpp/include/CMakeFiles/triangle.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/cpp/include/CMakeFiles/triangle.dir/compiler_depend.make

# Include the progress variables for this target.
include src/cpp/include/CMakeFiles/triangle.dir/progress.make

# Include the compile flags for this target's objects.
include src/cpp/include/CMakeFiles/triangle.dir/flags.make

src/cpp/include/CMakeFiles/triangle.dir/triangle.cpp.o: src/cpp/include/CMakeFiles/triangle.dir/flags.make
src/cpp/include/CMakeFiles/triangle.dir/triangle.cpp.o: /home/tmnguyen/Bureau/photon_mapping/src/cpp/include/triangle.cpp
src/cpp/include/CMakeFiles/triangle.dir/triangle.cpp.o: src/cpp/include/CMakeFiles/triangle.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/cpp/include/CMakeFiles/triangle.dir/triangle.cpp.o"
	cd /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/src/cpp/include && /home/tmnguyen/anaconda3/envs/photonmap/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/cpp/include/CMakeFiles/triangle.dir/triangle.cpp.o -MF CMakeFiles/triangle.dir/triangle.cpp.o.d -o CMakeFiles/triangle.dir/triangle.cpp.o -c /home/tmnguyen/Bureau/photon_mapping/src/cpp/include/triangle.cpp

src/cpp/include/CMakeFiles/triangle.dir/triangle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/triangle.dir/triangle.cpp.i"
	cd /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/src/cpp/include && /home/tmnguyen/anaconda3/envs/photonmap/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tmnguyen/Bureau/photon_mapping/src/cpp/include/triangle.cpp > CMakeFiles/triangle.dir/triangle.cpp.i

src/cpp/include/CMakeFiles/triangle.dir/triangle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/triangle.dir/triangle.cpp.s"
	cd /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/src/cpp/include && /home/tmnguyen/anaconda3/envs/photonmap/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tmnguyen/Bureau/photon_mapping/src/cpp/include/triangle.cpp -o CMakeFiles/triangle.dir/triangle.cpp.s

# Object files for target triangle
triangle_OBJECTS = \
"CMakeFiles/triangle.dir/triangle.cpp.o"

# External object files for target triangle
triangle_EXTERNAL_OBJECTS =

src/cpp/include/libtriangle.a: src/cpp/include/CMakeFiles/triangle.dir/triangle.cpp.o
src/cpp/include/libtriangle.a: src/cpp/include/CMakeFiles/triangle.dir/build.make
src/cpp/include/libtriangle.a: src/cpp/include/CMakeFiles/triangle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libtriangle.a"
	cd /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/src/cpp/include && $(CMAKE_COMMAND) -P CMakeFiles/triangle.dir/cmake_clean_target.cmake
	cd /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/src/cpp/include && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/triangle.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cpp/include/CMakeFiles/triangle.dir/build: src/cpp/include/libtriangle.a
.PHONY : src/cpp/include/CMakeFiles/triangle.dir/build

src/cpp/include/CMakeFiles/triangle.dir/clean:
	cd /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/src/cpp/include && $(CMAKE_COMMAND) -P CMakeFiles/triangle.dir/cmake_clean.cmake
.PHONY : src/cpp/include/CMakeFiles/triangle.dir/clean

src/cpp/include/CMakeFiles/triangle.dir/depend:
	cd /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tmnguyen/Bureau/photon_mapping /home/tmnguyen/Bureau/photon_mapping/src/cpp/include /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/src/cpp/include /home/tmnguyen/Bureau/photon_mapping/build/temp.linux-x86_64-cpython-312/photonmap/libphotonmap_core/src/cpp/include/CMakeFiles/triangle.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/cpp/include/CMakeFiles/triangle.dir/depend

