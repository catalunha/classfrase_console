import 'dart:io';

import 'package:classfrase_console/ngb/ngb_category_model.dart';
import 'package:uuid/uuid.dart';

class Google2Json {
  final String path;
  final String fileName;
  List<NgbCategory> _ngbCategoryList = [];

  Google2Json({
    required this.path,
    required this.fileName,
  });

  void readCategory() {
    String pathFileName = '$path/$fileName.txt';
    var lineList = File(pathFileName).readAsLinesSync();

    final List<NgbCategory> ngbCategoryList = lineList.map((line) {
      var fieldList = line.split('\t');

      return NgbCategory(
        title: fieldList[0].trim(),
        description: fieldList[1].trim(),
        filter: fieldList[2]
            .replaceAll('[', '')
            .replaceAll(']', '')
            .trim()
            .split(','),
        id: fieldList[3].trim(),
        group: fieldList[4].trim(),
      );
    }).toList();

    // ngbCategoryList.forEach(((element) {
    //   print(
    //       '${element.title} |${element.description}| ${element.filter} | ${element.id} | ${element.group}');
    // }));
    _ngbCategoryList = ngbCategoryList;
  }

  void writeJsonCategory() {
    String pathFileName = '$path/$fileName.json';

    if (File(pathFileName).existsSync()) File(pathFileName).deleteSync();
    var fileOpen = File(pathFileName).openWrite(mode: FileMode.append);
    fileOpen.write('[');
    fileOpen.write(_ngbCategoryList.map((e) => e.toJson()).join(','));
    fileOpen.write(']');
    fileOpen.close();
  }
}
