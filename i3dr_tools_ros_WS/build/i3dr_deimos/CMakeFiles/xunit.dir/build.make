# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_deimos

# Include any dependencies generated for this target.
include CMakeFiles/xunit.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/xunit.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/xunit.dir/flags.make

CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o: CMakeFiles/xunit.dir/flags.make
CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o: /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros/src/xunit/xunit_lib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_deimos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o   -c /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros/src/xunit/xunit_lib.c

CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros/src/xunit/xunit_lib.c > CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.i

CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros/src/xunit/xunit_lib.c -o CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.s

CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o.requires:

.PHONY : CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o.requires

CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o.provides: CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o.requires
	$(MAKE) -f CMakeFiles/xunit.dir/build.make CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o.provides.build
.PHONY : CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o.provides

CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o.provides.build: CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o


CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o: CMakeFiles/xunit.dir/flags.make
CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o: /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros/src/xunit/xunit_lib_cug.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_deimos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o   -c /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros/src/xunit/xunit_lib_cug.c

CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros/src/xunit/xunit_lib_cug.c > CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.i

CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros/src/xunit/xunit_lib_cug.c -o CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.s

CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o.requires:

.PHONY : CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o.requires

CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o.provides: CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o.requires
	$(MAKE) -f CMakeFiles/xunit.dir/build.make CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o.provides.build
.PHONY : CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o.provides

CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o.provides.build: CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o


# Object files for target xunit
xunit_OBJECTS = \
"CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o" \
"CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o"

# External object files for target xunit
xunit_EXTERNAL_OBJECTS =

/home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/devel/.private/i3dr_deimos/lib/libxunit.so: CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o
/home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/devel/.private/i3dr_deimos/lib/libxunit.so: CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o
/home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/devel/.private/i3dr_deimos/lib/libxunit.so: CMakeFiles/xunit.dir/build.make
/home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/devel/.private/i3dr_deimos/lib/libxunit.so: CMakeFiles/xunit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_deimos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/devel/.private/i3dr_deimos/lib/libxunit.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/xunit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/xunit.dir/build: /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/devel/.private/i3dr_deimos/lib/libxunit.so

.PHONY : CMakeFiles/xunit.dir/build

CMakeFiles/xunit.dir/requires: CMakeFiles/xunit.dir/src/xunit/xunit_lib.c.o.requires
CMakeFiles/xunit.dir/requires: CMakeFiles/xunit.dir/src/xunit/xunit_lib_cug.c.o.requires

.PHONY : CMakeFiles/xunit.dir/requires

CMakeFiles/xunit.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/xunit.dir/cmake_clean.cmake
.PHONY : CMakeFiles/xunit.dir/clean

CMakeFiles/xunit.dir/depend:
	cd /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_deimos && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_deimos-ros /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_deimos /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_deimos /home/htp/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_deimos/CMakeFiles/xunit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/xunit.dir/depend

