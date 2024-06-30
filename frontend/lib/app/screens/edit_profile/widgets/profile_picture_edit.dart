import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:frontend/app/actions/shop_action.dart';
import 'package:frontend/app/common/mutation_hook.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/main.dart';

class ProfilePictureEdit extends HookWidget {
  final String photoUrl;
  final ValueChanged<String> onPhotoUrlChanged;

  const ProfilePictureEdit(
      {super.key, required this.photoUrl, required this.onPhotoUrlChanged});

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    final Mutation(mutate: changeProfilePic) = useMutation(
      () async {
        isLoading.value = true;
        var shopAction = ShopAction();
        File? file = await shopAction.pickImage();
        if (file == null) {
          isLoading.value = false;
          return;
        }

        String? url = await shopAction.uploadImage(file);

        if (url != null) {
          onPhotoUrlChanged(url);
        }

        isLoading.value = false;
      },
    );

    logger.d('Updated Photo $photoUrl');

    return SizedBox(
      height: 190,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: AppColors.peru,
            height: 120,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: changeProfilePic,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ClipOval(
                        child: isLoading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : (photoUrl.isEmpty)
                                ? const Icon(Icons.photo_camera)
                                : Image.network(
                                    photoUrl,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Change Picture',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 14,
                          height: 16 / 14,
                          color: AppColors.black,
                        ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
