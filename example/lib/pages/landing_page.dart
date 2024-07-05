

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_llama_cpp_dart_lib/llama_cpp_dart.dart';
import 'package:flutter_llama_cpp_dart_lib_example/repositories/gguf_file_picker.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final TextEditingController _modelPathController = TextEditingController();
  final TextEditingController _promptController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  LlamaProcessor? llamaProcessor;
  StreamSubscription<String>? _streamSubscription;
  bool isModelLoaded = false;




  @override
  void initState() {
    super.initState();
    _modelPathController.text = "";
    _promptController.text = "### Human: divide by zero please\n### Assistant:";
  }





  @override
  void dispose() {
    _streamSubscription?.cancel();
    _modelPathController.dispose();
    _promptController.dispose();
    _resultController.dispose();
    llamaProcessor?.unloadModel();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter llama cpp sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onTap: () async {
                String? filePath = await ggufFilePickerGetFilePathFromFilePicker();
                _modelPathController.text = (filePath != null) ? filePath : "";
              },
              controller: _modelPathController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Model Path',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _promptController,
              decoration: const InputDecoration(
                labelText: 'Prompt',
                border: OutlineInputBorder(),
              ),
              minLines: 5,
              maxLines: null,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                  controller: _resultController,
                  decoration: const InputDecoration(
                    labelText: 'Result',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top),
            ),
            const SizedBox(height: 10),
            Text(isModelLoaded ? 'Model Loaded' : 'Model Not Loaded'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    llamaProcessor = LlamaProcessor(
                      path: _modelPathController.text,
                      modelParams: () {
                        ModelParams modelParams = ModelParams();
                        modelParams.format = PromptFormatType.raw;
                        return modelParams;
                      }(),
                      contextParams: ContextParams(),
                      samplingParams: SamplingParams.fromJson({
                        "penaltyRepeat": 1.1,
                        "temp": 0.7,
                      }),
                      onDone: () {
                        print("Done");
                      },
                    );
                    setState(() {
                      isModelLoaded = true;
                    });
                  },
                  child: const Text('Load Model'),
                ),
                ElevatedButton(
                  onPressed: isModelLoaded
                      ? () {
                    llamaProcessor?.unloadModel();
                    setState(() {
                      isModelLoaded = false;
                    });
                  }
                      : null,
                  child: const Text('Unload Model'),
                ),
                ElevatedButton(
                  onPressed: isModelLoaded
                      ? () {
                    _streamSubscription?.cancel();
                    _resultController.text = "";
                    _streamSubscription =
                        llamaProcessor?.stream.listen((data) {
                          _resultController.text += data;
                        }, onError: (error) {
                          _resultController.text = "Error: $error";
                        }, onDone: () {});
                    llamaProcessor?.prompt(_promptController.text);
                  }
                      : null,
                  child: const Text('Generate Answer'),
                ),
                ElevatedButton(
                  onPressed: isModelLoaded
                      ? () {
                    llamaProcessor?.stop();
                  }
                      : null,
                  child: const Text('Stop Generation'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

