
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';

Future<String?> ggufFilePickerGetFilePathFromFilePicker() async {

  if (!kIsWeb && TargetPlatform.android == defaultTargetPlatform) {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    return result?.files.first.path;
  }

  final file = await openFile(acceptedTypeGroups: <XTypeGroup>[
    const XTypeGroup(
      label: '.gguf',
      extensions: ['gguf'],
      // UTIs are required for iOS, which does not have a .gguf UTI.
      uniformTypeIdentifiers: [],
    ),
  ]);

  if (file == null) {
    return null;
  }

  final filePath = file.path;
  return filePath;
}
