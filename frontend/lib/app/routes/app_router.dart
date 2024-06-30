import 'package:flutter/material.dart';
// import 'package:frontend/app/_screen/login/google_login.dart';
import 'package:frontend/app/_screen/register_shop/register_shop_screen.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/cart/cart_screen.dart';
import 'package:frontend/app/screens/edit_profile/edit_profile_screen.dart';
import 'package:frontend/app/screens/fav/fav_screen.dart';
import 'package:frontend/app/screens/home/home_screen.dart';
import 'package:frontend/app/screens/mange_cakes/form/mange_cakes_form.dart';
import 'package:frontend/app/screens/mange_cakes/mange_cakes_screen.dart';
import 'package:frontend/app/screens/mood_select/mood_select_screen.dart';
import 'package:frontend/app/screens/order_summary/order_summary.dart';
import 'package:frontend/app/screens/payment_screen/payment_screen.dart';
import 'package:frontend/app/screens/product/widgets/product_form_screen.dart';
import 'package:frontend/app/screens/product_detail/product_detail_screen.dart';
import 'package:frontend/app/screens/profile/profile_screen.dart';
import 'package:frontend/app/screens/shop/shop_screen.dart';
import 'package:frontend/app/screens/shop_form/shop_form_screen.dart';
import 'package:frontend/app/screens/signin/signin_screen.dart';
import 'package:frontend/app/screens/signup/signup_screen.dart';
import 'package:frontend/app/screens/splash/splash_screen.dart';
import 'package:frontend/app/screens/tabs/tabs.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRouterEnum.splash.path,
    routes: <RouteBase>[
      GoRoute(
        name: AppRouterEnum.splash.name,
        path: AppRouterEnum.splash.path,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      ShellRoute(
        builder: (context, state, Widget child) {
          return BottomNavigationMenu(
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: AppRouterEnum.home.name,
            path: AppRouterEnum.home.path,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            name: AppRouterEnum.favs.name,
            path: AppRouterEnum.favs.path,
            builder: (BuildContext context, GoRouterState state) {
              return const FavScreen();
            },
          ),
          GoRoute(
            name: AppRouterEnum.shopDetail.name,
            path: AppRouterEnum.shopDetail.path,
            builder: (BuildContext context, GoRouterState state) {
              return ShopScreen(
                shop_id: state.extra as String,
              );
            },
          ),
          GoRoute(
            name: AppRouterEnum.cart.name,
            path: AppRouterEnum.cart.path,
            builder: (BuildContext context, GoRouterState state) {
              return const CartScreen();
            },
          ),
          GoRoute(
            name: AppRouterEnum.profile.name,
            path: AppRouterEnum.profile.path,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileScreen();
            },
          ),
        ],
      ),
      // GoRoute(
      //   name: AppRouterEnum.detail.name,
      //   path: AppRouterEnum.detail.path,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const DetailScreen();
      //   },
      // ),
      GoRoute(
        name: AppRouterEnum.editProfile.name,
        path: AppRouterEnum.editProfile.path,
        builder: (BuildContext context, GoRouterState state) {
          return const EditProfileScreen();
        },
      ),
      GoRoute(
        name: AppRouterEnum.signIn.name,
        path: AppRouterEnum.signIn.path,
        builder: (BuildContext context, GoRouterState state) {
          return const SigninScreen();
        },
      ),
      GoRoute(
        name: AppRouterEnum.singUp.name,
        path: AppRouterEnum.singUp.path,
        builder: (BuildContext context, GoRouterState state) {
          return const SignupScreen();
        },
      ),
      GoRoute(
        name: AppRouterEnum.shopForm.name,
        path: AppRouterEnum.shopForm.path,
        builder: (BuildContext context, GoRouterState state) {
          return const ShopFormScreen();
        },
      ),
      GoRoute(
        name: AppRouterEnum.productForm.name,
        path: AppRouterEnum.productForm.path,
        builder: (BuildContext context, GoRouterState state) {
          return const ProductFormScreen();
        },
      ),
      GoRoute(
        name: AppRouterEnum.itemDetail.name,
        path: AppRouterEnum.itemDetail.path,
        builder: (BuildContext context, GoRouterState state) {
          return ProductDetailScreen(
            cake: state.extra as CakeModel,
          );
        },
      ),

      GoRoute(
        name: AppRouterEnum.paymentScreen.name,
        path: AppRouterEnum.paymentScreen.path,
        builder: (BuildContext context, GoRouterState state) {
          return const PaymentScreen();
        },
      ),
      GoRoute(
        name: AppRouterEnum.orderSummary.name,
        path: AppRouterEnum.orderSummary.path,
        builder: (BuildContext context, GoRouterState state) {
          return const OrderSummaryScreen();
        },
      ),
      GoRoute(
        name: AppRouterEnum.registerShop.name,
        path: AppRouterEnum.registerShop.path,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterShopScreen();
        },
      ),
      GoRoute(
        name: AppRouterEnum.manageCakes.name,
        path: AppRouterEnum.manageCakes.path,
        builder: (BuildContext context, GoRouterState state) {
          return const ManageCakesScreen();
        },
        routes: [
          GoRoute(
            name: AppRouterEnum.manageCakesForm.name,
            path: AppRouterEnum.manageCakesForm.path,
            builder: (BuildContext context, GoRouterState state) {
              final id = state.uri.queryParameters['id'];
              return ManageCakesForm(
                id: id,
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRouterEnum.moodSelect.name,
        path: AppRouterEnum.moodSelect.path,
        builder: (BuildContext context, GoRouterState state) {
          return const MoodSelectScreen();
        },
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      // final String? path = state.fullPath;
      // final token = localStorage.getItem('accessToken');
      // final user = FirebaseAuth.instance.currentUser;

      // if (user == null && token == null) {
      //   return AppRouterEnum.signIn.path;
      // }
      return null;
    },
  );
}
