# imgcompress

[![pub package](https://img.shields.io/pub/v/imgcompress.svg)](https://pub.dartlang.org/packages/imgcompress)

Compress JPEG Images in Flutter Using MozJpeg

## Getting Started

It is really easy to use! You should ensure that you add the `imgcompress` as a dependency in your flutter project.

```yaml
imgcompress: "^1.0.0"
```

![screenshot.png](example/screenshot.png)

## Usage

#### New instance

```dart
final _imgCompress = FlutterImgCompress.instance;
```

#### Compress Jpeg

```dart
final imgBytes = await rootBundle.load('assets/images/img.jpg');
final image = imgBytes.buffer.asUint8List();

final imgDecode = img.decodeImage(image)!;
final width = imgDecode.width;
final height = imgDecode.height;
const quality = 90.0;

var data = await _imgCompress.compress(ImgCompressOption(
  image,
  quality: quality,
  width: width,
  height: height,
  format: ImgCompressFormat.jpeg,
));
```