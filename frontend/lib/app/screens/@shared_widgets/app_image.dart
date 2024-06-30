import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:shimmer/shimmer.dart';

class AppImage extends ConsumerWidget {
  const AppImage(
    this.image, {
    super.key,
    this.placeholder,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.alignment = Alignment.center,
  });

  final String? image;
  final String? placeholder;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Return placeholder directly
    if (image == null || image!.isEmpty) {
      return _PlaceholderImageView(
        width: width,
        height: height,
        placeholder: placeholder,
        fit: fit,
      );
    }

    if (image!.startsWith('http')) {
      return buildNetworkImage(context, image!);
    }

    return StreamBuilder<File?>(
      stream: null,
      builder: (context, snapshot) {
        File? file = snapshot.data;
        if (image!.endsWith('png')) {
          return Image.asset(
            image!,
            width: width,
            height: height,
            alignment: alignment,
            fit: fit ?? BoxFit.contain,
            color: color,
            errorBuilder: (_, e, s) => _PlaceholderImageView(
              width: width,
              height: height,
              placeholder: placeholder,
              fit: fit,
            ),
          );
        }

        if (image!.endsWith('.svg')) {
          return SvgPicture.asset(
            image!,
            width: width,
            height: height,
            alignment: alignment,
            fit: fit ?? BoxFit.contain,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          );
        } else {
          ImageProvider? imageProvider;
          if (file != null) {
            imageProvider = _FileImage(file);
          } else {
            imageProvider = AssetImage(image!);
          }
          return Image(
            width: width,
            height: height,
            image: imageProvider,
            alignment: alignment,
            fit: fit,
            color: color,
            errorBuilder: (_, e, s) => _PlaceholderImageView(
              width: width,
              height: height,
              placeholder: placeholder,
              fit: fit,
            ),
          );
        }
      },
    );
  }

  Widget buildNetworkImage(BuildContext context, String imageName) {
    // use CachedNetworkImage instead of CachedNetworkImageProvider,
    // since CachedNetworkImageProvider cannot handle placeholder (loading widget)
    return CachedNetworkImage(
      imageUrl: imageName,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      progressIndicatorBuilder: (context, url, progress) {
        // return Center(
        //   child: ClipRRect(
        //     child: BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //       child: Image.network(
        //         url,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // );

        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: width,
            height: height,
            color: AppColors.gray,
          ),
        );
      },
      errorWidget: (_, __, ___) {
        return _PlaceholderImageView(
          width: width,
          height: height,
          placeholder: 'assets/images/no-image.jpg',
          fit: fit,
        );
      },

      // placeholder: (_, __) {
      //   return Shimmer.fromColors(
      //     baseColor: Colors.grey.shade300,
      //     highlightColor: Colors.grey.shade100,
      //     child: SizedBox(
      //       width: width,
      //       height: height,
      //     ),
      //   );
      // },
      // placeholder: (_, __) {
      //   return _PlaceholderImageView(
      //     width: width,
      //     height: height,
      //     placeholder: placeholder,
      //     fit: fit,
      //   );
      // },
    );
  }
}

//

class _PlaceholderImageView extends StatelessWidget {
  final double? width;
  final double? height;
  final String? placeholder;
  final BoxFit? fit;

  const _PlaceholderImageView({
    required this.width,
    required this.height,
    required this.placeholder,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: placeholder == null
          ? Container(color: Colors.grey.shade300)
          : Image.asset(
              placeholder!,
              fit: fit,
            ),
      // ),
    );
  }
}

/// Modified `FileImage` which use a stricter equality comparison.
class _FileImage extends FileImage {
  /// Cache the last modified date in init.
  ///
  /// As last modified date may change from time to time, it's not safe to get it during equality comparison,
  /// which may break the rule that hash codes must be the same for objects that are equal to each other.
  final DateTime cachedLastModified;

  _FileImage(super.file) : cachedLastModified = file.lastModifiedSync();

  @override
  int get hashCode => Object.hash(file.path, scale, cachedLastModified);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is _FileImage &&
        other.file.path == file.path &&
        other.scale == scale &&
        other.cachedLastModified == cachedLastModified;
  }
}
