# policy settings

if(COMMAND cmake_policy)

  # Libraries linked via full path no longer produce linker search paths.
  # This policy affects how libraries whose full paths are NOT known are
  # found at link time, but was created due to a change in how CMake deals
  # with libraries whose full paths are known (changed in cmake >2.6)
  cmake_policy(SET CMP0002 NEW)
  cmake_policy(SET CMP0003 NEW)

  # Disallow use of the LOCATION property for build targets.
  cmake_policy(SET CMP0026 NEW)

  # use <PackageName>_ROOT environment variables for find_package
  cmake_policy(SET CMP0074 NEW)

endif(COMMAND cmake_policy)

