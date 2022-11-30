import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/image_upload/image_upload_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickOptions extends StatelessWidget {
  const ImagePickOptions({Key? key, required this.globalContext})
      : super(key: key);

  final BuildContext globalContext;

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          title: Text('Choose From...'),
        ),
        ListTile(
          leading: const Icon(Icons.photo),
          title: const Text('Gallery'),
          onTap: () async {
            if (await Permission.storage.request().isGranted) {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                BlocProvider.of<ImageUploadBloc>(globalContext)
                    .add(UploadImage(File(image.path)));
              }
              Navigator.pop(context);
            } else {
              print(await Permission.photos.status);
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Camera'),
          onTap: () async {
            if (await Permission.camera.request().isGranted) {
              final XFile? photo =
                  await _picker.pickImage(source: ImageSource.camera);
              if (photo != null) {
                BlocProvider.of<ImageUploadBloc>(globalContext)
                    .add(UploadImage(File(photo.path)));
              }
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
