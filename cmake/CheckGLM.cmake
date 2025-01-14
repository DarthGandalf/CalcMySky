include(CheckIncludeFileCXX)
check_include_file_cxx("glm/glm.hpp" HAVE_GLM)
if(NOT HAVE_GLM)
    unset(HAVE_GLM CACHE)
    message(FATAL_ERROR "GLM was not found. Please install it from your repositories (usually named libglm-dev or glm-devel), or from https://glm.g-truc.net .")
endif()
message(STATUS "Checking that GLM has the required features")
try_compile(HAVE_GLM_CONSTEXPR "${CMAKE_BINARY_DIR}/detect/"
            "${CMAKE_CURRENT_LIST_DIR}/check-glm-constexpr-ctor.cpp")
if(NOT HAVE_GLM_CONSTEXPR)
    unset(HAVE_GLM_CONSTEXPR CACHE)
    message(FATAL_ERROR "GLM doesn't appear to support constexpr constructors. Please check that your GLM is at least 0.9.9.5.")
endif()
message(STATUS "Checking that GLM has the required features - done")
