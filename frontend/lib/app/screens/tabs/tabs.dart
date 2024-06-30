import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationMenu extends StatefulWidget {
  final Widget child;

  const BottomNavigationMenu({super.key, required this.child});

  @override
  createState() => _BottomNavigationMenu();
}

class _BottomNavigationMenu extends State<BottomNavigationMenu> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    String currentPage =
        GoRouter.of(context).routeInformationProvider.value.uri.path;
    return Scaffold(
      body: widget.child,
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            top: 11.15,
            bottom: 4.15 + MediaQuery.of(context).padding.bottom,
            right: 28,
            left: 28),
        height: 49 + MediaQuery.of(context).padding.bottom,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -4),
              blurRadius: 4,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.04),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabsItem(
              onTap: () {
                setState(() {
                  currentindex = 0;
                });
                context.goNamed(AppRouterEnum.home.name);
              },
              label: 'Home',
              icon: 'home',
              isActive: (currentPage == AppRouterEnum.home.path),
            ),

            // Menu
            TabsItem(
              onTap: () {
                setState(() {
                  currentindex = 1;
                });
                context.pushNamed(AppRouterEnum.favs.name);
              },
              label: 'Favorites',
              icon: 'heart',
              isActive: (currentPage == AppRouterEnum.favs.path),
            ),

            // card
            TabsItem(
              onTap: () {
                setState(() {
                  currentindex = 2;
                });
                context.goNamed(AppRouterEnum.cart.name);
              },
              label: 'Cart',
              icon: 'cart',
              isActive: (currentPage == AppRouterEnum.cart.path),
            ),

            // Profile
            TabsItem(
              onTap: () {
                setState(() {
                  currentindex = 3;
                  context.goNamed(AppRouterEnum.profile.name);
                });
              },
              label: 'Profle',
              icon: 'profile',
              isActive: (currentPage == AppRouterEnum.profile.path),
            ),
          ],
        ),
      ),
    );
  }
}

class TabsItem extends StatelessWidget {
  const TabsItem({
    super.key,
    this.onTap,
    required this.label,
    required this.icon,
    this.isActive = false,
  });

  final VoidCallback? onTap;
  final String label;
  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/tabs/${isActive ? 'active_' : ''}$icon.svg',
            height: 21.03,
            width: 21.03,
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.deepOrange : const Color(0xff9e9e9e),
              BlendMode.srcIn,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 8.76,
                  color: isActive ? AppColors.deepOrange : AppColors.gray,
                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
                  letterSpacing: 0.18,
                ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
