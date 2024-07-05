#ifndef FLUTTER_PLUGIN_FLUTTER_LLAMA_CPP_DART_LIB_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_LLAMA_CPP_DART_LIB_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_llama_cpp_dart_lib {

class FlutterLlamaCppDartLibPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterLlamaCppDartLibPlugin();

  virtual ~FlutterLlamaCppDartLibPlugin();

  // Disallow copy and assign.
  FlutterLlamaCppDartLibPlugin(const FlutterLlamaCppDartLibPlugin&) = delete;
  FlutterLlamaCppDartLibPlugin& operator=(const FlutterLlamaCppDartLibPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_llama_cpp_dart_lib

#endif  // FLUTTER_PLUGIN_FLUTTER_LLAMA_CPP_DART_LIB_PLUGIN_H_
