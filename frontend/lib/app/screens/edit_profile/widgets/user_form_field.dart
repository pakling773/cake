import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:frontend/app/actions/user_action.dart';
import 'package:frontend/app/models/user_model.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/alerter.dart';
import 'package:frontend/app/screens/@shared_widgets/fields/floating_input.dart';
import 'package:frontend/app/screens/@shared_widgets/snacker.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UserFormField extends StatefulHookConsumerWidget {
  UserModel? userState;
  ValueNotifier<String>? photoUrl;

  UserFormField({super.key, required this.userState, this.photoUrl});

  @override
  ConsumerState<UserFormField> createState() => _UserFormFieldState();
}

class _UserFormFieldState extends ConsumerState<UserFormField> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  final FormGroup form = fb.group({
    'name': ['', Validators.required],
    'email': ['', Validators.required, Validators.email],
    'phone': [
      '',
      Validators.required,
      Validators.number(allowNegatives: false, allowedDecimals: 0)
    ],
    'photoUrl': FormControl<String>(
      value: '',
    ),
    // 'date_of_birth': FormControl<DateTime>(
    //   value: DateTime.now(),
    //   validators: [Validators.required],
    // ),
  });

  final inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFF5D5C5C), width: 1),
    borderRadius: BorderRadius.circular(6),
  );

  @override
  Widget build(BuildContext context) {
    if (widget.photoUrl != null) {
      final value = useValueListenable(widget.photoUrl!);

      if (value != '') {
        form.control('photoUrl').patchValue(value);
      }
    }

    form.patchValue({
      'name': widget.userState?.name,
      'email': widget.userState?.email,
      'phone': widget.userState?.phone,
      'date_of_birth': widget.userState?.dateOfBirth,
    });

    void saveProfile() async {
      if (widget.userState == null || widget.userState?.id == null) return;

      if (form.valid) {
        setState(() {
          isLoading = true;
        });
        try {
          UserAction().updateUser(form);
          ref.read(userProvider.notifier).setUserFromLocalStorage();
          Alerter.showSimpleAlert(
              context, 'Profile Updated', 'Your Profile Updated Successfully.');
        } catch (e) {
          print(e);
          setState(() {
            isLoading = false;
          });
        } finally {
          setState(() {
            isLoading = false;
          });
          ref.read(userProvider.notifier).setUserFromLocalStorage();
          context.goNamed(AppRouterEnum.profile.name);
        }
      } else {
        Sncaker().showSnack(context, 'Form invalid');
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      // User Name
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            FloatingInput(
              formControlName: 'name',
              label: 'User Name',
              validationMessages: {
                ValidationMessage.required: (error) =>
                    'Please fill in your username',
              },
            ),
            const SizedBox(
              height: 20,
            ),

            FloatingInput(
              readOnly: true,
              formControlName: 'email',
              label: 'Email id',
              validationMessages: {
                ValidationMessage.required: (error) =>
                    'Please fill in your email id',
              },
            ),

            const SizedBox(
              height: 20,
            ),

            // Phone Number
            FloatingInput(
              inputType: InputMode.digit,
              formControlName: 'phone',
              label: 'Phone Number',
              validationMessages: {
                ValidationMessage.required: (error) =>
                    'Please fill in your phone number',
              },
            ),
            const SizedBox(
              height: 8,
            ),

            // Text(
            //   'Date Of Birth',
            //   style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            //         fontSize: 16,
            //       ),
            // ),
            // const SizedBox(
            //   height: 3,
            // ),
            // ReactiveDateTimePicker(
            //   formControlName: 'date_of_birth',
            //   type: ReactiveDatePickerFieldType.date,
            //   validationMessages: {
            //     ValidationMessage.required: (error) =>
            //         'Please select your date of birth',
            //   },
            // ),

            const SizedBox(
              height: 30,
            ),

            Center(
              child: GestureDetector(
                onTap: (isLoading) ? null : saveProfile,
                child: Container(
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'UPDATE',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 14,
                                  height: 16 / 14,
                                  color: AppColors.white,
                                ),
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
