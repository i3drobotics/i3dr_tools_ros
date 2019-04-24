# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "i3dr_stereo_camera: 0 messages, 2 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(i3dr_stereo_camera_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv" NAME_WE)
add_custom_target(_i3dr_stereo_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "i3dr_stereo_camera" "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv" ""
)

get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv" NAME_WE)
add_custom_target(_i3dr_stereo_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "i3dr_stereo_camera" "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/i3dr_stereo_camera
)
_generate_srv_cpp(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/i3dr_stereo_camera
)

### Generating Module File
_generate_module_cpp(i3dr_stereo_camera
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/i3dr_stereo_camera
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(i3dr_stereo_camera_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(i3dr_stereo_camera_generate_messages i3dr_stereo_camera_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_cpp _i3dr_stereo_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_cpp _i3dr_stereo_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(i3dr_stereo_camera_gencpp)
add_dependencies(i3dr_stereo_camera_gencpp i3dr_stereo_camera_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS i3dr_stereo_camera_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/i3dr_stereo_camera
)
_generate_srv_eus(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/i3dr_stereo_camera
)

### Generating Module File
_generate_module_eus(i3dr_stereo_camera
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/i3dr_stereo_camera
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(i3dr_stereo_camera_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(i3dr_stereo_camera_generate_messages i3dr_stereo_camera_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_eus _i3dr_stereo_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_eus _i3dr_stereo_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(i3dr_stereo_camera_geneus)
add_dependencies(i3dr_stereo_camera_geneus i3dr_stereo_camera_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS i3dr_stereo_camera_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/i3dr_stereo_camera
)
_generate_srv_lisp(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/i3dr_stereo_camera
)

### Generating Module File
_generate_module_lisp(i3dr_stereo_camera
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/i3dr_stereo_camera
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(i3dr_stereo_camera_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(i3dr_stereo_camera_generate_messages i3dr_stereo_camera_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_lisp _i3dr_stereo_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_lisp _i3dr_stereo_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(i3dr_stereo_camera_genlisp)
add_dependencies(i3dr_stereo_camera_genlisp i3dr_stereo_camera_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS i3dr_stereo_camera_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/i3dr_stereo_camera
)
_generate_srv_nodejs(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/i3dr_stereo_camera
)

### Generating Module File
_generate_module_nodejs(i3dr_stereo_camera
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/i3dr_stereo_camera
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(i3dr_stereo_camera_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(i3dr_stereo_camera_generate_messages i3dr_stereo_camera_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_nodejs _i3dr_stereo_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_nodejs _i3dr_stereo_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(i3dr_stereo_camera_gennodejs)
add_dependencies(i3dr_stereo_camera_gennodejs i3dr_stereo_camera_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS i3dr_stereo_camera_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/i3dr_stereo_camera
)
_generate_srv_py(i3dr_stereo_camera
  "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/i3dr_stereo_camera
)

### Generating Module File
_generate_module_py(i3dr_stereo_camera
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/i3dr_stereo_camera
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(i3dr_stereo_camera_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(i3dr_stereo_camera_generate_messages i3dr_stereo_camera_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_py _i3dr_stereo_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv" NAME_WE)
add_dependencies(i3dr_stereo_camera_generate_messages_py _i3dr_stereo_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(i3dr_stereo_camera_genpy)
add_dependencies(i3dr_stereo_camera_genpy i3dr_stereo_camera_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS i3dr_stereo_camera_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/i3dr_stereo_camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/i3dr_stereo_camera
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(i3dr_stereo_camera_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/i3dr_stereo_camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/i3dr_stereo_camera
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(i3dr_stereo_camera_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/i3dr_stereo_camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/i3dr_stereo_camera
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(i3dr_stereo_camera_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/i3dr_stereo_camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/i3dr_stereo_camera
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(i3dr_stereo_camera_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/i3dr_stereo_camera)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/i3dr_stereo_camera\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/i3dr_stereo_camera
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(i3dr_stereo_camera_generate_messages_py std_msgs_generate_messages_py)
endif()
