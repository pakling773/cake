import 'package:flutter/material.dart';
import 'package:frontend/app/common/cake_sizes.dart';
import 'package:frontend/app/screens/product_detail/widgets/item_size.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSizeList extends StatefulWidget {
  ItemSizeList({super.key, this.text = "222", required this.onChangeSize});
  String text;
  Function onChangeSize;

  @override
  State<ItemSizeList> createState() => _ItemSizeList();
}

class _ItemSizeList extends State<ItemSizeList> {
  int selectedSize = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              widget.text,
              style: GoogleFonts.nunito(
                fontSize: 12,
                height: 18 / 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xff6E7489),
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),

          /// cake sizes
          SizedBox(
            height: 32,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(0),
                itemCount: cakeSizes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    // Item Size Component
                    child: ItemSize(
                      size: cakeSizes[index],
                      index: index,
                      selectedSize: selectedSize,
                      onTap: () {
                        widget.onChangeSize(cakeSizes[index]);
                        setState(() {
                          selectedSize = index;
                        });
                      },
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 16,
          ),
          // Row(
          //   children: [
          //     SvgPicture.asset('assets/icons/edit.svg'),
          //     const SizedBox(
          //       width: 8,
          //     ),
          //     Text(
          //       'Add wording on your cake (optional)',
          //       style: GoogleFonts.nunito(
          //         fontSize: 12,
          //         height: 16 / 12,
          //         fontWeight: FontWeight.w400,
          //         color: const Color(0xff6E7489),
          //         fontStyle: FontStyle.italic,
          //         decoration: TextDecoration.none,
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
