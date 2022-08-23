import 'dart:convert';
import 'dart:io';

import 'package:classfrase_console/google/user_in_b4a.dart';
import 'package:classfrase_console/google/users2b4a.dart';
import 'package:classfrase_console/model/phrase_model.dart';

void lerPhrases2B4a() {
  print('Lendo json phrases e users...');
  Users2B4a users2b4a = Users2B4a();
  users2b4a.readJson();
  Phrases2B4a phrases2b4a = Phrases2B4a();
  phrases2b4a.readJson();
  UserInB4a userInB4a = UserInB4a();
  userInB4a.readJson();

  phrases2b4a.join2B4a(users2b4a, userInB4a);

  // phrases2b4a.writeCsv();
}

class Phrases2B4a {
  final List<PhraseModel> list = [];

  void readJson() {
    String pathFileName =
        '/home/catalunha/myapp/classfrase_console/data/firebase/phrases.json';

    var jsonData = File(pathFileName).readAsStringSync();
    final jsonObj = json.decode(jsonData);
    list.clear();
    for (var element in jsonObj) {
      list.add(PhraseModel.fromMap(element));
    }
  }

  void writeCsv() {
    String pathFileName =
        '/home/catalunha/myapp/classfrase_console/data/b4a/phrases.csv';

    if (File(pathFileName).existsSync()) File(pathFileName).deleteSync();
    var fileOpen = File(pathFileName).openWrite(mode: FileMode.append);
    // fileOpen.write('[');
    for (var phrase in list) {
      fileOpen.writeln(phrase.phrase);
    }
    // fileOpen.write(']');
    fileOpen.close();
  }

  void join2B4a(Users2B4a users2b4a, UserInB4a userInB4a) {
    String pathFileName =
        '/home/catalunha/myapp/classfrase_console/data/b4a/phrases_2_b4a.json';

    if (File(pathFileName).existsSync()) File(pathFileName).deleteSync();
    var fileOpen = File(pathFileName).openWrite(mode: FileMode.append);

    fileOpen.write('[');
    for (var phrase in list) {
      for (var user in users2b4a.list) {
        if (phrase.userRef.id == user.id) {
          for (var userb4a in userInB4a.list) {
            if (userb4a.email == user.email) {
              fileOpen.writeln(
                  '{"user":{"__type": "Pointer","className": "_User","objectId": "${userb4a.objectId}"},"phrase": "${phrase.phrase}","phraseList":${json.encode(phrase.phraseList)},"classifications":${json.encode(phrase.classifications)},"classOrder":${json.encode(phrase.classOrder)},"folder": "/todas","font": "${phrase.font}","diagramUrl": "${phrase.diagramUrl}","isArchived": ${phrase.isArchived},"isDeleted":  ${phrase.isDeleted}, "isPublic": ${phrase.isPublic}},');

              break;
            }
          }
          break;
        }
      }
    }
    fileOpen.write(']');
    fileOpen.close();
  }
}
