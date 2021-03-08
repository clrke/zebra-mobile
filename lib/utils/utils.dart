import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Utils{
  static Future<File> imageCompression({@required PickedFile file})async{
    var result = await FlutterImageCompress.compressWithFile(
        File(file.path).absolute.path,
        minWidth: 640,
        minHeight: 320,
        quality: 100
    );
    File compressedImage = File(file.path)..writeAsBytesSync(result);
    return compressedImage;
  }
}