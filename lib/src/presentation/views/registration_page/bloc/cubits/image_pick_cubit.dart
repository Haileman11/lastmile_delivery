import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickCubit extends Cubit<XFile?> {
  ImagePickCubit() : super(null);

  pickImage(XFile? pickedImage) {
    emit(pickedImage);
  }
}
