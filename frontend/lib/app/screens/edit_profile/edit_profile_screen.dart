import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/screens/edit_profile/widgets/edit_profile_menu.dart';
import 'package:frontend/app/screens/edit_profile/widgets/profile_picture_edit.dart';
import 'package:frontend/app/screens/edit_profile/widgets/user_form_field.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfileScreen extends HookConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoUrl = useState('');

    final userState = ref.watch(userProvider);

    useEffect(() {
      if (userState != null && userState.photoUrl != null) {
        photoUrl.value = userState.photoUrl!;
      }
      return null;
    }, []);

    void updatePhotoUrl(String newUrl) {
      photoUrl.value = newUrl;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          color: AppColors.peru,
          child: const SafeArea(child: EditProfileMenu()),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePictureEdit(
                photoUrl: photoUrl.value, onPhotoUrlChanged: updatePhotoUrl),
            UserFormField(userState: userState, photoUrl: photoUrl),
          ],
        ),
      ),
    );
  }
}
