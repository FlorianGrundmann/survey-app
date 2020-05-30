import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';

class FileDataSource {
  void export(File file) {
    Share.file(
      file.path,
      file.path,
      file.readAsBytesSync(),
      'text/csv',
    );
  }
}
