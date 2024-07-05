#include "include/flutter_llama_cpp_dart_lib/flutter_llama_cpp_dart_lib_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_llama_cpp_dart_lib_plugin.h"

void FlutterLlamaCppDartLibPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_llama_cpp_dart_lib::FlutterLlamaCppDartLibPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
