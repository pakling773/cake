import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/common/mutation_hook.dart';
import 'package:frontend/app/providers/shop_provider.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/profile/widgets/member_card.dart';
import 'package:frontend/app/screens/profile/widgets/profile_menu_item_card.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/main.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',

    );

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    logger.i(user);
    final shop = ref.watch(shopProvider);

    final Mutation(mutate: logout) = useMutation(
      () async {
        final logout = await _googleSignIn.signOut();
        await _googleSignIn.disconnect();
        ref.watch(userProvider.notifier).removeUser();
        FirebaseAuth.instance.signOut();
      },
      onSuccess: (result) {
        context.goNamed(AppRouterEnum.signIn.name);
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: 'Hello, ',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
            children: [
              TextSpan(
                text: (user?.name != null) ? user?.name : " User",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColors.orange,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TextSpan(
                text: '!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16)
            .copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            // ! Member Card
            const MemberCard(),
            const SizedBox(
              height: 28,
            ),

            // Member Menus
            Wrap(
              runSpacing: 14,
              children: [
                ProfileMenuItemCard(
                  title: 'Edit profile',
                  onTap: () {
                    context.pushNamed(AppRouterEnum.editProfile.name);
                  },
                ),
                ProfileMenuItemCard(
                  onTap: () {
                    context.pushNamed(AppRouterEnum.shopForm.name);
                  },
                  title: (shop != null)
                      ? 'Manage ${shop.name}'
                      : " Create New Shop",
                ),
                if ((shop != null)) ...[
                  ProfileMenuItemCard(
                    onTap: () {
                      context.pushNamed(AppRouterEnum.manageCakes.name);
                    },
                    title: 'Manage Cakes',
                  )
                ],
                ProfileMenuItemCard(
                  title: 'AI Cake Suggestion 😊',
                  onTap: () {
                    context.pushNamed(AppRouterEnum.moodSelect.name);
                  },
                ),
                const ProfileMenuItemCard(
                  title: 'Terms and Conditions',
                ),
                ProfileMenuItemCard(
                  onTap: () {
                    logout();
                  },
                  title: 'Logout',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
