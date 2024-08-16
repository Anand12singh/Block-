import 'package:image_picker/image_picker.dart';

class ImagePic {
  final ImagePicker pickImage = ImagePicker();

  Future<XFile?> cameraImage() async {
    final XFile? file = await pickImage.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> galleryImage() async {
    final XFile? file = await pickImage.pickImage(source: ImageSource.gallery);
    return file;
  }
}
