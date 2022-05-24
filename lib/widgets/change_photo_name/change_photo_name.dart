import 'dart:io';

import 'package:path/path.dart';

//TODO: Here you can change your names photo


void main() async {
  final listFiles = Directory('ar-emma-aleiman').listSync();
  for (var item in listFiles) {
    String path = item.path;
    final point1 = RegExp(r'-').allMatches(path).last.start;
    final point2 = RegExp(r'_').allMatches(path).last.start;
    try {
      int index = int.parse(path.substring(point1 + 1, point2));
      final file = File(path);
      String dir = dirname(file.path);
      String newPath = join(dir, '$index.jpg');
      file.renameSync(newPath);
    } catch (e) {
      print(path);
    }
  }
}


