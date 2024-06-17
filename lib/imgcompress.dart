import 'package:flutter/foundation.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:imgcompress/imgcompress.d.dart';
import 'package:imgcompress/imgcompress.g.dart';

export 'imgcompress.d.dart';
export 'imgcompress.g.dart';

final _dylib = loadLibForFlutter('libcompress.so');

final ImgCompress _imgCompress = ImgCompressImpl(_dylib);

enum ImgCompressFormat {
  jpeg,
}

class ImgCompressOption {
  final Uint8List image;
  final double quality;
  final int width;
  final int height;
  final ImgCompressFormat format;

  ImgCompressOption(
    this.image, {
    this.quality = 75,
    this.width = 1920,
    this.height = 1080,
    this.format = ImgCompressFormat.jpeg,
  });
}

Future<Uint8List> _computeCompressMozJpeg(ImgCompressOption option) =>
    compute(_compressMozJpeg, option);

Future<Uint8List> _compressMozJpeg(ImgCompressOption option) =>
    _imgCompress.compressMozjpeg(
      image: option.image,
      quality: option.quality,
      width: option.width,
      height: option.height,
    );

abstract class FlutterImgCompress {
  static final FlutterImgCompress _instance = FlutterImgCompressImpl();

  static FlutterImgCompress get instance => _instance;

  Future<Uint8List> compress(ImgCompressOption option);
}

class FlutterImgCompressImpl implements FlutterImgCompress {
  @override
  Future<Uint8List> compress(ImgCompressOption option) async {
    if (option.format == ImgCompressFormat.jpeg) {
      return _computeCompressMozJpeg(option);
    }
    throw UnsupportedError('Unsupported format ${option.format}');
  }
}
