import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:path_provider/path_provider.dart';

class FileDataSource {
  void export(File file, String fileName) {
    Share.file(
      fileName,
      fileName,
      file.readAsBytesSync(),
      'text/csv',
    );
  }

  Future<void> exportAsFile(String text, String fileName) async {
    Directory tempDirectory = await getTemporaryDirectory();
    File file =
        await File('${tempDirectory.path}/$fileName').writeAsString(text);
    export(file, fileName);
  }
}
