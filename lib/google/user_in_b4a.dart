import 'dart:convert';
import 'dart:io';

import 'package:classfrase_console/model/user_b4a_model.dart';

void lerUserInB4a() {
  print('lendo arquivos do google docs apos revisao');
  UserInB4a userInB4a = UserInB4a();
  userInB4a.readJson();
  // google2json.writeCsv();
}

class UserInB4a {
  final List<UserB4aModel> list = [];

  void readJson() {
    String pathFileName =
        '/home/catalunha/myapp/classfrase_console/data/b4a/user_in_b4a.json';

    var jsonData = File(pathFileName).readAsStringSync();
    final jsonObj = json.decode(jsonData);
    list.clear();
    for (var element in jsonObj) {
      list.add(UserB4aModel.fromMap(element));
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
