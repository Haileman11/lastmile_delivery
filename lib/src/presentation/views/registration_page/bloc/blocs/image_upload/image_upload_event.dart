part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();
  @override
  List<Object> get props => [];
}

class UploadImage extends ImageUploadEvent {
  final String filePath;
  const UploadImage(this.filePath);
}
