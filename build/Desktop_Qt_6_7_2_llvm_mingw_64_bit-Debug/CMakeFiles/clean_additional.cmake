# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appcoin-app_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appcoin-app_autogen.dir\\ParseCache.txt"
  "appcoin-app_autogen"
  )
endif()
