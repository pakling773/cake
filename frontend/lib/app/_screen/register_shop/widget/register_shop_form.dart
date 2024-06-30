import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterShopForm extends StatefulWidget {
  const RegisterShopForm({super.key});

  @override
  State<RegisterShopForm> createState() => _RegisterShopFormState();
}

class _RegisterShopFormState extends State<RegisterShopForm> {
  final form = FormGroup({
    'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(4)]),
    'address': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)]),
    'phone': FormControl<String>(validators: [Validators.required]),
    'logo': FormControl<String>(validators: [
      Validators.required,
    ]),
  });

  void _register(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDBD5D5)),
      borderRadius: BorderRadius.circular(25),
    );

    final enabledBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDBD5D5)),
      borderRadius: BorderRadius.circular(25),
    );

    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.gray),
      borderRadius: BorderRadius.circular(25),
    );
    const focusedErrorBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 162, 8, 8)),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Name Field

            SizedBox(
              height: 62,
              child: ReactiveTextField(
                formControlName: 'name',
                validationMessages: {
                  'required': (error) => 'Product name is required',
                  'minLength': (error) => 'Please enter at least 4 characters'
                },
                style: inputstyle,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Name',
                  hintStyle: hintStyle,
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  focusedErrorBorder: focusedErrorBorder,
                  border: border,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                ),
              ),
            ),

            // Address Field

            SizedBox(
              height: 62,
              child: ReactiveTextField(
                formControlName: 'address',
                validationMessages: {
                  'required': (error) => 'address name is required',
                  'minLength': (error) => 'Please enter at least 6 characters'
                },
                style: inputstyle,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Address',
                  hintStyle: hintStyle,
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  focusedErrorBorder: focusedErrorBorder,
                  border: border,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                ),
              ),
            ),

            // Phone Field

            SizedBox(
              height: 62,
              child: ReactiveTextField(
                formControlName: 'phone',
                validationMessages: {
                  'required': (error) => 'phone name is required',
                },
                style: inputstyle,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Phone',
                  hintStyle: hintStyle,
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  focusedErrorBorder: focusedErrorBorder,
                  border: border,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),

            // Logo Field

            SizedBox(
              height: 62,
              child: ReactiveTextField(
                formControlName: 'logo',
                validationMessages: {
                  'required': (error) => 'logo name is required',
                },
                style: inputstyle,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Logo',
                  hintStyle: hintStyle,
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  focusedErrorBorder: focusedErrorBorder,
                  border: border,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
              ),
            ),
            const SizedBox(
              height: 0,
            ),

            // ReactiveFormConsumer(
            //   builder: (context, form, child) {
            //     return Center(
            //       child: GestureDetector(
            //         onTap: form.valid ? () => _register(context) : null,
            //         child: Container(
            //           constraints: const BoxConstraints(maxWidth: 262),
            //           width: double.infinity,
            //           padding: const EdgeInsets.symmetric(
            //               vertical: 15, horizontal: 15),
            //           decoration: BoxDecoration(
            //             color: form.valid
            //                 ? AppColors.peru
            //                 : const Color.fromARGB(255, 238, 184, 122),
            //             borderRadius: BorderRadius.circular(25),
            //           ),
            //           child: Center(
            //             child: Text(
            //               'Register',
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .headlineLarge!
            //                   .copyWith(
            //                     fontSize: 15,
            //                     height: 16 / 15,
            //                     color: AppColors.white,
            //                   ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
