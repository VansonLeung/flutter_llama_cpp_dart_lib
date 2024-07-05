import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_llama_cpp_dart_lib/flutter_llama_cpp_dart_lib.dart';
import 'package:flutter_llama_cpp_dart_lib/flutter_llama_cpp_dart_lib_platform_interface.dart';
import 'package:flutter_llama_cpp_dart_lib/flutter_llama_cpp_dart_lib_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLlamaCppDartLibPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLlamaCppDartLibPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLlamaCppDartLibPlatform initialPlatform = FlutterLlamaCppDartLibPlatform.instance;

  test('$MethodChannelFlutterLlamaCppDartLib is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLlamaCppDartLib>());
  });

  test('getPlatformVersion', () async {
    FlutterLlamaCppDartLib flutterLlamaCppDartLibPlugin = FlutterLlamaCppDartLib();
    MockFlutterLlamaCppDartLibPlatform fakePlatform = MockFlutterLlamaCppDartLibPlatform();
    FlutterLlamaCppDartLibPlatform.instance = fakePlatform;

    expect(await flutterLlamaCppDartLibPlugin.getPlatformVersion(), '42');
  });
}
