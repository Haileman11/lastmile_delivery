import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/common/image_pick_options.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/cubits/image_pick_cubit.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickCubit, XFile?>(
      builder: (context, state) {
        if (state == null) {
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
        }

        if (state != null) {
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
                    backgroundImage: Image.file(
                      File(state.path),
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

        return const SizedBox();
      },
    );
  }
}
