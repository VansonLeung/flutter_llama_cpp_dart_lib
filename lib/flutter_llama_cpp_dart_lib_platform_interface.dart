import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_llama_cpp_dart_lib_method_channel.dart';

abstract class FlutterLlamaCppDartLibPlatform extends PlatformInterface {
  /// Constructs a FlutterLlamaCppDartLibPlatform.
  FlutterLlamaCppDartLibPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLlamaCppDartLibPlatform _instance = MethodChannelFlutterLlamaCppDartLib();

  /// The default instance of [FlutterLlamaCppDartLibPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLlamaCppDartLib].
  static FlutterLlamaCppDartLibPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLlamaCppDartLibPlatform] when
  /// they register themselves.
  static set instance(FlutterLlamaCppDartLibPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
