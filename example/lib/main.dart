import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:imgcompress/imgcompress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _imgCompress = FlutterImgCompress.instance;

  Uint8List? _image;
  String _before = '';
  String _after = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin compress image'),
        ),
        body: Column(
          children: [
            Text(_before),
            Builder(builder: (context) {
              if (_image != null) {
                return Image.memory(_image!);
              }
              return const SizedBox();
            }),
            Text(_after),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _processCompressJpeg,
              child: const Text('Compress Jpeg'),
            ),
          ],
        ),
      ),
    );
  }

  void _processCompressJpeg() async {
    final imgBytes = await rootBundle.load('assets/images/img.jpg');
    final image = imgBytes.buffer.asUint8List();

    final imgs = img.decodeImage(image)!;
    final width = imgs.width;
    final height = imgs.height;
    const quality = 90;
    _before =
        'before: ${(image.length / 1024).toStringAsFixed(4)} KB, width: $width, height: $height';
    print(_before);
    setState(() {});
    var data = await _imgCompress.compress(ImgCompressOption(
      image,
      quality: quality.toDouble(),
      width: width,
      height: height,
      format: ImgCompressFormat.jpeg,
    ));
    _after =
        'after: ${(data.length / 1024).toStringAsFixed(4)} KB, width: $width, height: $height';
    print(_after);
    _image = data;
    setState(() {});
  }
}
