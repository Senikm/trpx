# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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

# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.26.0/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.26.0/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/matiny0000/Documents/PhD/terse

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/matiny0000/Documents/PhD/terse/build

# Include any dependencies generated for this target.
include src/CMakeFiles/prolix.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/prolix.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/prolix.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/prolix.dir/flags.make

src/CMakeFiles/prolix.dir/prolix.cpp.o: src/CMakeFiles/prolix.dir/flags.make
src/CMakeFiles/prolix.dir/prolix.cpp.o: /Users/matiny0000/Documents/PhD/terse/src/prolix.cpp
src/CMakeFiles/prolix.dir/prolix.cpp.o: src/CMakeFiles/prolix.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/matiny0000/Documents/PhD/terse/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/prolix.dir/prolix.cpp.o"
	cd /Users/matiny0000/Documents/PhD/terse/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/prolix.dir/prolix.cpp.o -MF CMakeFiles/prolix.dir/prolix.cpp.o.d -o CMakeFiles/prolix.dir/prolix.cpp.o -c /Users/matiny0000/Documents/PhD/terse/src/prolix.cpp

src/CMakeFiles/prolix.dir/prolix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prolix.dir/prolix.cpp.i"
	cd /Users/matiny0000/Documents/PhD/terse/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/matiny0000/Documents/PhD/terse/src/prolix.cpp > CMakeFiles/prolix.dir/prolix.cpp.i

src/CMakeFiles/prolix.dir/prolix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prolix.dir/prolix.cpp.s"
	cd /Users/matiny0000/Documents/PhD/terse/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/matiny0000/Documents/PhD/terse/src/prolix.cpp -o CMakeFiles/prolix.dir/prolix.cpp.s

# Object files for target prolix
prolix_OBJECTS = \
"CMakeFiles/prolix.dir/prolix.cpp.o"

# External object files for target prolix
prolix_EXTERNAL_OBJECTS =

src/prolix: src/CMakeFiles/prolix.dir/prolix.cpp.o
src/prolix: src/CMakeFiles/prolix.dir/build.make
src/prolix: src/CMakeFiles/prolix.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/matiny0000/Documents/PhD/terse/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable prolix"
	cd /Users/matiny0000/Documents/PhD/terse/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/prolix.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/prolix.dir/build: src/prolix
.PHONY : src/CMakeFiles/prolix.dir/build

src/CMakeFiles/prolix.dir/clean:
	cd /Users/matiny0000/Documents/PhD/terse/build/src && $(CMAKE_COMMAND) -P CMakeFiles/prolix.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/prolix.dir/clean

src/CMakeFiles/prolix.dir/depend:
	cd /Users/matiny0000/Documents/PhD/terse/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/matiny0000/Documents/PhD/terse /Users/matiny0000/Documents/PhD/terse/src /Users/matiny0000/Documents/PhD/terse/build /Users/matiny0000/Documents/PhD/terse/build/src /Users/matiny0000/Documents/PhD/terse/build/src/CMakeFiles/prolix.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/prolix.dir/depend

