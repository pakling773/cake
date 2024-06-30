import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class TopIconMenu extends StatelessWidget {
  bool isFav;
  Function onAddToFav;
  TopIconMenu({super.key, required this.onAddToFav, this.isFav = false});

  @override
  Widget build(BuildContext context) {
    print(isFav);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Icon Wrapper
          GestureDetector(
            onTap: () {
              context.goNamed(AppRouterEnum.home.name);
            },
            child: Container(
              height: 32,
              width: 32,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xff3E3E3E).withOpacity(0.6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SvgPicture.asset('assets/icons/back_icon.svg'),
            ),
          ),

          // favourite icon  Wrapper
          Container(
            padding: const EdgeInsetsDirectional.all(2),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white.withOpacity(0.5),
            ),
            child: GestureDetector(
              onTap: () => onAddToFav(),
              child: Center(
                child: isFav
                    ? SvgPicture.asset(
                        'assets/icons/red_heart.svg',
                        width: 26,
                        height: 26,
                      )
                    : SvgPicture.asset(
                        'assets/icons/menu/heart.svg',
                        width: 26,
                        height: 26,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
