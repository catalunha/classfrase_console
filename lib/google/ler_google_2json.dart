import 'package:classfrase_console/google/google_2json.dart';

void lerGoogle2Json() {
  print('lendo arquivos do google docs apos revisao');
  Google2Json google2json = Google2Json(
    path: '/home/catalunha/myapp/classfrase_console/data/google_docs',
    fileName: 'Semântica',
  );
  google2json.readCategory();
  google2json.writeJsonCategory();
}
