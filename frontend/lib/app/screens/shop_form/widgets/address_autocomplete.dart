import 'package:flutter/material.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:frontend/app/screens/@shared_widgets/fields/floating_autocomplete.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddressAutocomplete extends HookConsumerWidget {
  const AddressAutocomplete({
    super.key,
    required this.selection,
    required this.items,
    this.initialName,
    this.onCitySelected,
    this.label,
    this.required = false,
    this.validator,
    this.onChanged,
  });

  final AddressModel? selection;
  final String? label;
  final bool required;
  final Iterable<AddressModel> items;
  final String? initialName;
  final void Function(AddressModel)? onCitySelected;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = items;

    logger.d(options);

    getOptionLabel(AddressModel addressModel) => addressModel.address ?? '';

    return FloatingAutocomplete<AddressModel>(
      selection: selection,
      label: label,
      getOptionLabel: getOptionLabel,
      required: required,
      validator: validator,
      optionsBuilder: (value, state) {
        final query = value.toLowerCase();

        return options;
        // return options.where((address) {
        //   if (query == selection?.let(getOptionLabel).toLowerCase() &&
        //       !state.isDirty) {
        //     return true;
        //   }
        //   return address.address?.toLowerCase().contains(query) == true;
        // });
      },
      optionsScrollviewBuilder: (context, onSelected, options) {
        return Material(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 5),
              separatorBuilder: (_, __) => const Divider(
                height: 0.5,
                color: Color(0xFFD3D2CE),
              ),
              itemBuilder: (context, index) {
                final item = options.toList()[index];

                final String centre = getOptionLabel(options.toList()[index]);

                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      centre,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.dark,
                        height: 16.0 / 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () => onSelected(item),
                );
              },
              itemCount: options.length,
            ),
          ),
        );
      },
      onItemSelected: (item) {
        onCitySelected?.call(item);
      },
      onChanged: onChanged,
      onValueSubmitted: (value) {
        final city = options.firstWhere(
          (element) =>
              element.address?.toLowerCase().contains(value.toLowerCase()) ==
              true,
          orElse: () => options.first,
        );
        onCitySelected?.call(city);
      },
    );
  }
}
