import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/domain/repositories/image_upload_repository.dart';

part 'image_upload_event.dart';
part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final ImageUploadRepository _imageUploadRepository;

  ImageUploadBloc(this._imageUploadRepository) : super(ImageUploadInitial()) {
    on<UploadImage>((event, emit) async {
      emit(const ImageUploadLoading());
      final result = await _imageUploadRepository.uploadImage(event.filePath);
      result.fold(
        (l) => emit(const ImageUploadError('Something went wrong')),
        (r) => emit(ImageUploadDone(r)),
      );
    });
  }
}
