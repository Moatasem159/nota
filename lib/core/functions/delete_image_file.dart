import 'dart:io';
void deleteImageFile(String filePath) {
  File imageFile = File(filePath);
  if (imageFile.existsSync()) {
    imageFile.deleteSync();
  }
}