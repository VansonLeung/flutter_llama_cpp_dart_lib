
import 'flutter_llama_cpp_dart_lib_platform_interface.dart';

class FlutterLlamaCppDartLib {
  Future<String?> getPlatformVersion() {
    return FlutterLlamaCppDartLibPlatform.instance.getPlatformVersion();
  }
}
