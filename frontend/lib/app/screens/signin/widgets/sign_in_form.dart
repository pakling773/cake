import 'package:flutter/material.dart';
import 'package:frontend/app/actions/signup_action.dart';
import 'package:frontend/app/common/mutation_hook.dart';
import 'package:frontend/app/models/user_model.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/fields/floating_input.dart';
import 'package:frontend/app/screens/@shared_widgets/snacker.dart';
import 'package:frontend/app/screens/@shared_widgets/submit_button.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInForm extends HookConsumerWidget {
  SignInForm({
    super.key,
    required this.signInParent,
  });

  bool? isLoading;
  final Function signInParent;

  final FormGroup formGroup = FormGroup({
    'email': FormControl<String>(
      // value: 'json@gmail.com',
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    'password': FormControl<String>(
      // value: 'tester',
      validators: [
        Validators.required,
        Validators.minLength(6),
      ],
    ),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Mutation(mutate: signEmailPassword, state: submitState) = useMutation(
      () async {
        isLoading = true;

        final email = formGroup.control('email').value;
        final password = formGroup.control('password').value;

        final authResponse =
            await AuthAction().signInWithEmailPassword(email, password);
        // authResponse.

        if (authResponse.runtimeType == String) {
          Sncaker().showSnack(context, authResponse);
        } else {
          // var user = UserModel.fromJson(authResponse);
          ref.read(userProvider.notifier).saveUser(authResponse as UserModel);
          context.goNamed(AppRouterEnum.home.name);
        }
      },
      onError: (error) {},
      onSuccess: (result) {},
    );

    return ReactiveForm(
      formGroup: formGroup,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          FloatingInput(
            formControlName: 'email',
            label: 'Email',
            validationMessages: {
              'required': (error) => 'Please enter your email',
              'email': (error) => 'Please enter the valid email'
            },
          ),
          const SizedBox(height: 20),
          FloatingInput(
            formControlName: 'password',
            label: 'Password',
            inputType: InputMode.password,
            validationMessages: {
              'required': (error) => 'Please enter your password',
              'minLength': (error) => 'Please enter 8 characters'
            },
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Forget passwords ',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors.black),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ReactiveFormConsumer(
            builder: (context, form, child) {
              return Center(
                child: SubmitButton(
                  button_text: 'Login ',
                  isLoading: submitState.result?.isLoading ?? false,
                  onSubmitClick: () {
                    if (form.invalid) {}
                    form.markAllAsTouched();
                    // print(form.control('email').value);
                    // print(form.control('password').value);
                    signEmailPassword();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                signInParent();
              },
              child: Container(
                constraints: const BoxConstraints(maxWidth: 280),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  // color: AppColors.peru,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColors.peru, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Login With Google',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 15,
                                height: 17 / 15,
                                color: AppColors.black,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
