if(NOT DEFINED src)
  message(FATAL_ERROR "RobocopyDirectory.cmake requires -Dsrc=<source directory>")
endif()

if(NOT DEFINED dst)
  message(FATAL_ERROR "RobocopyDirectory.cmake requires -Ddst=<destination directory>")
endif()

file(MAKE_DIRECTORY "${dst}")

execute_process(
  COMMAND robocopy "${src}" "${dst}" /E /NFL /NDL /NJH /NJS /NC /NS /NP
  RESULT_VARIABLE RobocopyExitCode
)

if(RobocopyExitCode GREATER 7)
  message(FATAL_ERROR "robocopy failed with exit code ${RobocopyExitCode}")
endif()
