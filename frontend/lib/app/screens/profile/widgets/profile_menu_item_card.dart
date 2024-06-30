import 'package:flutter/material.dart';

class ProfileMenuItemCard extends StatelessWidget {
  const ProfileMenuItemCard({
    super.key,
    required this.title,
    this.subTitle,
    this.onTap,
  });

  final String title;
  final String? subTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Ink(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 30,
              color: Color.fromRGBO(0, 0, 0, 0.15),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyMedium!.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
