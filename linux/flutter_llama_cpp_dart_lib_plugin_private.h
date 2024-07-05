#include <flutter_linux/flutter_linux.h>

#include "include/flutter_llama_cpp_dart_lib/flutter_llama_cpp_dart_lib_plugin.h"

// This file exposes some plugin internals for unit testing. See
// https://github.com/flutter/flutter/issues/88724 for current limitations
// in the unit-testable API.

// Handles the getPlatformVersion method call.
FlMethodResponse *get_platform_version();
