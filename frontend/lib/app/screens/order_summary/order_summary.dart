import 'package:flutter/material.dart';
import 'package:frontend/app/common/mutation_hook.dart';
import 'package:frontend/app/models/order_summary/order_summary_model.dart';
import 'package:frontend/app/providers/cart/cart_provider.dart';
import 'package:frontend/app/providers/checkout_provider.dart';
import 'package:frontend/app/providers/order_summary/order_summary_provider.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/alerter.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/main.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localstorage/localstorage.dart';

class OrderSummaryScreen extends HookConsumerWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutData = ref.watch(checkoutProvider);

    final Mutation(mutate: onSubmit, state: submitState) = useMutation(
      () async {
        final carts = ref.watch(cartProvider);
        String userId = localStorage.getItem('user_id')!;
        final total = ref.watch(cartProvider.notifier).getTotal;
        final points = total / 10;

        final data = OrderSummaryRequestModel(
          userId: userId,
          cart: carts,
          orderSummary: OrderDetailsSummary(
            quantity: carts?.length,
            total: total.toDouble(),
          ),
          paymentInfo: PaymentInfo(
            maymentMethod: checkoutData.paymentMethod,
            accountNumber: checkoutData.cardNumber.toString(),
          ),
          shippingInfo: ShippingInfo(
            name: checkoutData.name,
            address1: checkoutData.shippingAddress1,
            address2: checkoutData.shippingAddress2,
          ),
        );

        await ref.watch(orderSummaryProvider.notifier).saveOrder(data);
        await ref.watch(userProvider.notifier).updateProfilePoints(points);
      },
      onSuccess: (result) {
        ref.watch(cartProvider.notifier).clearAll();

        Alerter.showSimpleAlert(
          context,
          'Order Submited',
          'Your Order Is Submitted Successfully.',
          onCancel: () {
            if (context.canPop()) {
              context.pop();
            }
            context.goNamed(AppRouterEnum.home.name);
          },
        );
      },
      onError: (error) {
        logger.e(error);
      },
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        titleSpacing: 0,
        shadowColor: Colors.black.withOpacity(0.2),
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: Text(
          'Confirm Order',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: AppColors.black),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Subtotal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.gray, fontSize: 16),
                          ),
                        ),
                        Text(
                          '\$200',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Delivery',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.gray, fontSize: 16),
                          ),
                        ),
                        Text(
                          '\$50',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Total',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.gray, fontSize: 16),
                          ),
                        ),
                        Text(
                          '\$250',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Please confirm and submit your order',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'By clicking submit order, you agree to Terms of Use and Privacy Policy',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Payment',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: AppColors.black),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0)),
                          onPressed: () {},
                          child: Text(
                            'Edit',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: AppColors.deepOrange,
                                ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 5,
                            children: [
                              const AppImage(
                                'assets/icons/mastercard-icon.svg',
                                width: 20,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                '******8252',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.black,
                                    ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '07/25',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.black,
                                  ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Shipping Address',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: AppColors.black),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0)),
                          onPressed: () {},
                          child: Text(
                            'Edit',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: AppColors.deepOrange,
                                ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Name',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.gray,
                                ),
                          ),
                        ),
                        Text(
                          checkoutData.name.toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.black,
                                  ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Street',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.gray,
                                ),
                          ),
                        ),
                        Text(
                          checkoutData.shippingAddress1.toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.black,
                                  ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                  ),
                  onPressed:
                      submitState.result?.isLoading == true ? null : onSubmit,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      if (submitState.result?.isLoading == true)
                        const CircularProgressIndicator.adaptive(),
                      Text(
                        'Submit Order',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
