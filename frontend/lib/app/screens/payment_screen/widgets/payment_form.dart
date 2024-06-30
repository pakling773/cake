import 'package:flutter/material.dart';
import 'package:frontend/app/screens/@shared_widgets/fields/floating_input.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  bool sameAddress = false;

  _onCheckboxChanged(value) {
    setState(() {
      sameAddress = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.black,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
    final hintStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: AppColors.gray, fontSize: 14);
    final inputstyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: AppColors.black, fontSize: 14);

    return Column(
      children: [
        FloatingInput(
          formControlName: 'name',
          label: 'Name on card',
          validationMessages: {
            ValidationMessage.required: (error) => 'Please enter name on card',
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingInput(
          formControlName: 'card_number',
          label: 'Card number',
          validationMessages: {
            ValidationMessage.required: (error) => 'Please enter card number',
          },
          inputType: InputMode.digit,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FloatingInput(
                formControlName: 'expiry_date',
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'Please enter expiry date',
                },
                label: 'Expiry Date',
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                child: FloatingInput(
                  formControlName: 'cvc',
                  validationMessages: {
                    ValidationMessage.required: (error) => 'Please enter cvc',
                  },
                  label: 'Security Code',
                  inputType: InputMode.digit,
                  maxLength: 4,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingInput(
          formControlName: 'shipping_address1',
          validationMessages: {
            ValidationMessage.required: (error) =>
                'Please enter shipping address 1',
          },
          label: 'Shipping Address 1',
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingInput(
          formControlName: 'shipping_address2',
          label: 'Shipping Address 2',
          validationMessages: {
            ValidationMessage.required: (error) =>
                'Please enter shipping address 2',
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingInput(
          formControlName: 'phone',
          label: 'Phone Number',
          validationMessages: {
            ValidationMessage.required: (error) => 'Please enter phone number',
          },
          inputType: InputMode.digit,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
              child: Checkbox(
                value: sameAddress,
                onChanged: _onCheckboxChanged,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onCheckboxChanged(!sameAddress),
                child: Text(
                  'My billing address is the same as my shipping address.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
