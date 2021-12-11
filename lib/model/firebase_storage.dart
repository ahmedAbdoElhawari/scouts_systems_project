import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:scouts_system/common_ui/toast_show.dart';

class FirebaseStorageImage{
  Future<void> deleteImageFromStorage(String imageFileUrl) async {
    String fileUrl = Uri.decodeFull(Path.basename(imageFileUrl))
        .replaceAll(new RegExp(r'(\?alt).*'), '');

    final Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child(fileUrl);
    await firebaseStorageRef
        .delete()
        .then((value){})
        .catchError((e) {ToastShow().redToast(e);});
  }
}