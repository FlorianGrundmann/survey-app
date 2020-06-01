import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';

class FileDataSource {
  void export(File file, String fileName) {
    Share.file(
      fileName,
      fileName,
      file.readAsBytesSync(),
      'text/csv',
    );
  }
}
