part of 'image_upload_bloc.dart';

abstract class ImageUploadState extends Equatable {
  const ImageUploadState({this.imageUrl});
  final String? imageUrl;
  @override
  List<Object> get props => [];
}

class ImageUploadInitial extends ImageUploadState {}

class ImageUploadLoading extends ImageUploadState {
  const ImageUploadLoading();
}

class ImageUploadDone extends ImageUploadState {
  const ImageUploadDone(String imageUrl) : super(imageUrl: imageUrl);
}

class ImageUploadError extends ImageUploadState {
  final String errorMessage;

  const ImageUploadError(this.errorMessage);
}
