import 'dart:typed_data';

import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUseCase {
  final ImagePicker _imagePicker = getIt<ImagePicker>();

  Future<Uint8List?> selectImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    return await image?.readAsBytes();
  }
}
