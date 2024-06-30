import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/providers/shop_provider.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProductForm extends ConsumerWidget {
  ProductForm({super.key});

  final form = FormGroup({
    'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(4)]),
    'category_id': FormControl<int>(validators: [Validators.required]),
    'shop_id': FormControl<int>(validators: [Validators.required]),
    'price': FormControl<String>(validators: [
      Validators.required,
    ]),
    'images': FormControl<String>(validators: [Validators.required]),
    'favorite': FormControl<int>(validators: [Validators.required]),
  });

  void _send(BuildContext context) {}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shop = ref.read(shopProvider);
    final focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDBD5D5)),
      borderRadius: BorderRadius.circular(4),
    );

    final enabledBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDBD5D5)),
      borderRadius: BorderRadius.circular(4),
    );

    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.gray),
      borderRadius: BorderRadius.circular(4),
    );
    const focusedErrorBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 156, 8, 8)),
    );

    final hintStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: AppColors.gray, fontSize: 12, height: 14 / 10);

    final inputstyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: AppColors.gray, fontSize: 12, height: 14 / 10);

    final lablestyle = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(fontSize: 14, color: AppColors.black);

    final textStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: AppColors.gray);

    return Column(
      children: [
        ReactiveForm(
          formGroup: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name Field
              Text(
                'Product Name',
                style: lablestyle,
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 53,
                child: ReactiveTextField(
                  formControlName: 'name',
                  validationMessages: {
                    'required': (error) => 'Please enter your product name',
                    'minLength': (error) => 'Please enter at least 4 characters'
                  },
                  style: inputstyle,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter your product name',
                    hintStyle: hintStyle,
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    focusedErrorBorder: focusedErrorBorder,
                    border: border,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              //  category id Field
              Text(
                'Category Id',
                style: lablestyle,
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 53,
                child: ReactiveDropdownField<int>(
                    iconSize: 16,
                    iconEnabledColor: Colors.black,
                    formControlName: 'category_id',
                    validationMessages: {
                      'required': (error) => 'Please selete your category id',
                    },
                    hint: Text(
                      'Please selete your category id',
                      style: textStyle,
                    ),
                    style: inputstyle,
                    decoration: InputDecoration(
                      isDense: true,
                      border: border,
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      focusedErrorBorder: focusedErrorBorder,
                      hintStyle: hintStyle,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                    ),
                    dropdownColor: AppColors.white,
                    items: const [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          '10',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text('2'),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text('8'),
                      ),
                    ]),
              ),

              //  Shop id Field
              Text(
                'Shop Id',
                style: lablestyle,
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 53,
                child: ReactiveDropdownField<int>(
                    validationMessages: {
                      'required': (error) => 'Please selete your shop id',
                    },
                    iconSize: 16,
                    iconEnabledColor: Colors.black,
                    formControlName: 'shop_id',
                    hint: Text(
                      'Please selete your shop id',
                      style: textStyle,
                    ),
                    style: inputstyle,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      focusedErrorBorder: focusedErrorBorder,
                      border: border,
                      hintStyle: hintStyle,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                    ),
                    dropdownColor: AppColors.white,
                    items: const [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          '4242',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text('0088'),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text('2244'),
                      ),
                    ]),
              ),
              Text(
                'Price',
                style: lablestyle,
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 53,
                child: ReactiveTextField(
                  formControlName: 'price',
                  validationMessages: {
                    'required': (error) => 'please enter your price ',
                  },
                  style: inputstyle,
                  decoration: InputDecoration(
                    isDense: true,
                    border: border,
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    focusedErrorBorder: focusedErrorBorder,
                    hintText: 'Please enter your price',
                    hintStyle: hintStyle,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              Text(
                'Images',
                style: lablestyle,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 53,
                child: ReactiveTextField(
                  formControlName: 'images',
                  validationMessages: {
                    'required': (error) => ' ',
                  },
                  style: inputstyle,
                  decoration: InputDecoration(
                    isDense: true,
                    border: border,
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    focusedErrorBorder: focusedErrorBorder,
                    hintText: 'Images',
                    hintStyle: hintStyle,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              Text(
                'Favorite Items',
                style: lablestyle,
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 53,
                child: ReactiveDropdownField<int>(
                    validationMessages: {
                      'required': (error) => 'Please selete your Favorite item',
                    },
                    iconSize: 16,
                    iconEnabledColor: Colors.black,
                    formControlName: 'favorite',
                    hint: Text(
                      'Please selete your favorite Items',
                      style: textStyle,
                    ),
                    style: inputstyle,
                    decoration: InputDecoration(
                      border: border,
                      isDense: true,
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      focusedErrorBorder: focusedErrorBorder,
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      hintStyle: hintStyle,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                    ),
                    dropdownColor: AppColors.white,
                    items: const [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          'Vanilla cake',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text('Chocolate cake'),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text('Pineapple cake'),
                      ),
                    ]),
              ),
              const SizedBox(height: 10),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return Center(
                    child: GestureDetector(
                      onTap: form.valid ? () => _send(context) : null,
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 253),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          color: form.valid
                              ? AppColors.peru
                              : const Color.fromARGB(255, 238, 184, 122),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Send',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 15,
                                  height: 16 / 15,
                                  color: AppColors.white,
                                ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
