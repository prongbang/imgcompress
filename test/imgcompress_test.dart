import 'package:flutter_test/flutter_test.dart';
import 'package:imgcompress/imgcompress.dart';

void main() {
  test('instance is not null', () async {
    FlutterImgCompress imgcompressPlugin = FlutterImgCompress.instance;
    expect(imgcompressPlugin, isNotNull);
  });
}
