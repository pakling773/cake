import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/models/checkout_model.dart';
import 'package:frontend/app/providers/checkout_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/screens/@shared_widgets/snacker.dart';
import 'package:frontend/app/screens/payment_screen/widgets/payment_form.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum PaymentMethod { creditCard }

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  final PaymentMethod _method = PaymentMethod.creditCard;

  final formGroup = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'card_number': FormControl<int>(validators: [Validators.required]),
    'expiry_date': FormControl<String>(validators: [Validators.required]),
    'cvc': FormControl<int>(
        validators: [Validators.required, Validators.maxLength(4)]),
    'shipping_address1': FormControl<String>(validators: [Validators.required]),
    'shipping_address2': FormControl<String>(validators: [Validators.required]),
    'phone': FormControl<int>(validators: [Validators.required]),
  });

  nextScreen() {
    formGroup.markAllAsTouched();
    if (formGroup.valid) {
      CheckoutModel data = CheckoutModel(
        name: formGroup.value['name'] as String?,
        cardNumber: formGroup.value['card_number'] as int?,
        expiryDate: formGroup.value['expiry_date'] as String?,
        securityCode: formGroup.value['security_code'] as int?,
        shippingAddress1: formGroup.value['shipping_address1'] as String?,
        shippingAddress2: formGroup.value['shipping_address2'] as String?,
        phoneNumber: formGroup.value['phone'] as int?,
      );
      ref.read(checkoutProvider.notifier).setData(data);
      context.pushNamed(AppRouterEnum.orderSummary.name);
    } else {
      Sncaker().showSnack(context, 'Form invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        titleSpacing: 0,
        shadowColor: Colors.black.withOpacity(0.2),
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: false,
      ),
      body: ReactiveForm(
        formGroup: formGroup,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose a payment method',
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                      const Text(
                        'Please select a payment method most convenient to you.',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Text(
                                  'Credit Card',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppColors.black,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                              leading: SizedBox(
                                width: 20,
                                child: Radio<PaymentMethod>(
                                  value: PaymentMethod.creditCard,
                                  groupValue: _method,
                                  onChanged: (PaymentMethod? value) {
                                    print(value);
                                  },
                                ),
                              ),
                            ),
                          ),
                          const AppImage(
                            'assets/icons/visa-icon.svg',
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                            color: Colors.black,
                          )),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 5,
                            children: [
                              const AppImage(
                                'assets/images/google.png',
                                width: 30,
                              ),
                              Text(
                                'Google Pay',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                            color: Colors.black,
                          )),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 5,
                            children: [
                              const AppImage(
                                'assets/icons/apple.svg',
                                width: 25,
                              ),
                              Text(
                                'Apple Pay',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const PaymentForm(),
                    ],
                  ),
                ),
              ),
            ),

            // ! Action
            ReactiveFormConsumer(builder: (context, form, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(bottom: 20, top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                        ),
                        onPressed: form.invalid ? null : nextScreen,
                        child: Text(
                          'Next',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
