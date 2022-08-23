import 'dart:convert';
import 'dart:io';

import 'package:classfrase_console/model/user_model.dart';

void lerUsers2B4a() {
  print('lendo arquivos do google docs apos revisao');
  Users2B4a google2json = Users2B4a();
  google2json.readJson();
  google2json.writeCsv();
}

class Users2B4a {
  final List<UserModel> list = [];

  void readJson() {
    String pathFileName =
        '/home/catalunha/myapp/classfrase_console/data/firebase/users.json';

    var jsonData = File(pathFileName).readAsStringSync();
    final jsonObj = json.decode(jsonData);
    list.clear();
    for (var element in jsonObj) {
      list.add(UserModel.fromMap(element));
    }
  }

  void writeCsv() {
    String pathFileName =
        '/home/catalunha/myapp/classfrase_console/data/b4a/users1.csv';

    if (File(pathFileName).existsSync()) File(pathFileName).deleteSync();
    var fileOpen = File(pathFileName).openWrite(mode: FileMode.append);
    // fileOpen.write('[');
    fileOpen.write(list.map((e) => e.email).join(','));
    // fileOpen.write(']');
    fileOpen.close();
  }
}
