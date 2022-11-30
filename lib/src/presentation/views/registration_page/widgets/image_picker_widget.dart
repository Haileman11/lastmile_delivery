import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/common/app_snack_bar.dart';
import 'package:lastmile_mobile/src/presentation/common/image_pick_options.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/image_upload/image_upload_bloc.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUploadBloc, ImageUploadState>(
      builder: (context, state) {
        if (state is ImageUploadDone) {
          return GestureDetector(
            onTap: () {
              final globalContext = context;
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ImagePickOptions(globalContext: globalContext);
                  });
            },
            child: Stack(
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGrey.withOpacity(0.5),
                  ),
                  child: CircleAvatar(
                    backgroundImage: Image.network(
                      state.imageUrl,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.lightGrey,
                      ),
                      color: AppColors.white,
                    ),
                    child: Icon(
                      PhosphorIcons.camera_light,
                      color: AppColors.appGreen,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (state is ImageUploadError) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildAppSnackBar(
              bgColor: AppColors.errorRed,
              txtColor: AppColors.white,
              msg: 'Image upload failed, try again',
              isFloating: false,
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            final globalContext = context;
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ImagePickOptions(globalContext: globalContext);
                });
          },
          child: Stack(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightGrey.withOpacity(0.5),
                  border: Border.all(color: AppColors.appGreen),
                ),
                child: const Center(
                  child: Icon(
                    PhosphorIcons.user_light,
                    size: 40.0,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.lightGrey.withOpacity(0.5),
                    ),
                    color: AppColors.white,
                  ),
                  child: Icon(
                    PhosphorIcons.camera_light,
                    color: AppColors.appGreen,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
