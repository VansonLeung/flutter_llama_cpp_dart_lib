import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_llama_cpp_dart_lib_platform_interface.dart';

/// An implementation of [FlutterLlamaCppDartLibPlatform] that uses method channels.
class MethodChannelFlutterLlamaCppDartLib extends FlutterLlamaCppDartLibPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_llama_cpp_dart_lib');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
