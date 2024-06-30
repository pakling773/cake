import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/app/actions/shop_action.dart';
import 'package:frontend/app/common/mutation_hook.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:frontend/app/providers/places/places_provider.dart';
import 'package:frontend/app/providers/shop_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/alerter.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/screens/@shared_widgets/fields/floating_input.dart';
import 'package:frontend/app/screens/@shared_widgets/snacker.dart';
import 'package:frontend/app/screens/@shared_widgets/submit_button.dart';
import 'package:frontend/app/screens/shop_form/widgets/address_autocomplete.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/main.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ShopForm extends StatefulHookConsumerWidget {
  const ShopForm({super.key});

  @override
  ConsumerState<ShopForm> createState() => _ShopForm();
}

class _ShopForm extends ConsumerState<ShopForm> {
  File? _seletedImage;
  String? _imageUrl = "";
  bool isUpdate = false;
  late ShopModel? shop;
  AddressModel? selectedAddress;

  TextEditingController addressController = TextEditingController();

  Timer? _debounce;

  final FormGroup form = FormGroup({
    'shop_name': FormControl<String>(validators: [Validators.required]),
    'address1': FormControl<AddressModel?>(),
    'address2': FormControl<String>(validators: [Validators.required]),
    'logo': FormControl<String>(validators: [Validators.required]),
    'phone_number': FormControl<String>(validators: [Validators.required]),
    'openingHour': FormControl<DateTime>(
        value: DateTime.now(), validators: [Validators.required]),
    'closeingHour': FormControl<DateTime>(
        value: DateTime.now().add(const Duration(hours: 1)),
        validators: [Validators.required]),
  });

  @override
  void initState() {
    super.initState();

    shop = ref.read(shopProvider);
    if (shop != null) {
      form.patchValue({
        'shop_name': shop?.name,
        'address1': shop?.address1,
        'address2': shop?.address2,
        'logo': shop?.logo,
        'phone_number': shop?.phoneNumber,
        'openingHour': shop?.openingHour,
        'closeing_hour': shop?.closeingHour,
      });

      isUpdate = true;
      setState(() {
        selectedAddress = shop?.address1;
        _imageUrl = shop?.logo;
      });
    }

    logger.d(form.control('address1').value);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  selectLogo() async {
    _seletedImage = await ShopAction().pickImage();

    if (_seletedImage != null) {
      _imageUrl = await ShopAction().uploadImage(_seletedImage!);
      form.control('logo').value = _imageUrl;
      setState(() {
        _imageUrl = _imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final lablestyle = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(fontSize: 14, color: AppColors.black);

    final place = ref.watch(placeProvider);

    final Mutation(mutate: registerShop, state: formState) = useMutation(
      () async {
        form.markAllAsTouched();
        if (_imageUrl == "") {}
        if (form.valid) {
          // final List<Location> locations =
          //     await locationFromAddress(selectedAddress!.address!);

          // double? lat;
          // double? lng;
          // if (locations.isNotEmpty) {
          //   final location = locations.first;
          //   lat = location.latitude;
          //   lng = location.longitude;
          // }

          // logger.d(lat);
          // logger.d(lng);

          form.control('address1').patchValue(
                selectedAddress!.copyWith(
                  latitude: 22.277657,
                  longitude: 114.175827,
                ),
              );

          if (isUpdate) {
            await ShopAction().saveShop(form, id: shop!.id!).then(
              (value) {
                ref.read(shopProvider.notifier).setShop();
              },
            );
          } else {
            await ShopAction().saveShop(form).then(
              (value) {
                ref.read(shopProvider.notifier).setShop();
              },
            );
          }
        } else {
          Sncaker().showSnack(context, 'Form invalid');
        }
      },
      onSuccess: (result) async {
        if (isUpdate) {
          Alerter.showSimpleAlert(
            mounted ? context : context,
            'Shop Updated.',
            'Shop Updated Successfully.',
            onCancel: () {
              if (mounted) {
                context.goNamed(AppRouterEnum.home.name);
              }
            },
          );
        } else {
          await ShopAction().saveShop(form);
          Alerter.showSimpleAlert(
            mounted ? context : context,
            'Shop Created',
            'Shop created successfully.',
            onCancel: () {
              if (mounted) {
                context.goNamed(AppRouterEnum.home.name);
              }
            },
          );
        }
      },
      onError: (error) {
        logger.e(error);

        Alerter.showSimpleAlert(
          mounted ? context : context,
          'Error',
          '$error',
        );
      },
    );

    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Shop Name field

                  const SizedBox(height: 15),

                  // Shop logo field
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: selectLogo,
                          borderRadius: BorderRadius.circular(100),
                          splashColor: AppColors.red,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 4,
                                color: AppColors.gray.withOpacity(0.5),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppImage(
                                _imageUrl == null || _imageUrl == ''
                                    ? 'assets/images/image-picker.png'
                                    : _imageUrl,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Logo ',
                          style: lablestyle,
                        ),
                        Visibility(
                          visible: false,
                          child: ReactiveTextField(
                            formControlName: 'logo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  SizedBox(
                    child: FloatingInput(
                      key: UniqueKey(),
                      formControlName: 'shop_name',
                      label: 'Shop Name',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please enter your Shop name',
                        ValidationMessage.minLength: (error) =>
                            'Please enter at least 5 characters'
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  if (place != null)
                    AddressAutocomplete(
                      key: UniqueKey(),
                      selection: selectedAddress,
                      label: 'Address 1',
                      items: place
                          .map(
                            (e) => AddressModel(
                              // address: e.structuredFormatting?.mainText ?? '',
                              address: e.description ?? '',
                            ),
                          )
                          .toList(),
                      onCitySelected: (address) async {
                        logger.d(address);
                        setState(() {
                          selectedAddress = address;
                        });
                      },
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 1000),
                          () {
                            ref.watch(placeProvider.notifier).getPlace(value);
                          },
                        );
                      },
                      required: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your address 1';
                        }
                        return null;
                      },
                    ),

                  const SizedBox(height: 20),

                  // Shop Address 2 field
                  FloatingInput(
                    key: UniqueKey(),
                    formControlName: 'address2',
                    label: 'Address 2',
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Please enter your Address 2',
                      ValidationMessage.minLength: (error) =>
                          'Please enter at least 8 characters'
                    },
                  ),
                  const SizedBox(height: 20),

                  FloatingInput(
                    key: UniqueKey(),
                    formControlName: 'phone_number',
                    label: 'Phone Number',
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Please enter your Phone number',
                    },
                    inputType: InputMode.digit,
                  ),
                  const SizedBox(height: 20),

                  ReactiveDateTimePicker(
                    key: UniqueKey(),
                    formControlName: 'openingHour',
                    type: ReactiveDatePickerFieldType.time,
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Please enter your opening hour',
                    },
                    decoration: const InputDecoration(
                      labelText: 'Opening Hour',
                      border: OutlineInputBorder(),
                      helperText: '',
                      suffixIcon: Icon(Icons.watch_later_outlined),
                    ),
                  ),

                  const SizedBox(height: 5),

                  ReactiveDateTimePicker(
                    key: UniqueKey(),
                    formControlName: 'closeingHour',
                    type: ReactiveDatePickerFieldType.time,
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Please enter your Closeing hour',
                    },
                    decoration: const InputDecoration(
                      labelText: 'Closeing Hour',
                      border: OutlineInputBorder(),
                      helperText: '',
                      suffixIcon: Icon(Icons.watch_later_outlined),
                    ),
                  ),

                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                .copyWith(top: 5),
            child: ReactiveFormConsumer(
              key: const Key('submit'),
              builder: (context, _, __) => SubmitButton(
                button_text: isUpdate ? 'Update Shop' : 'Register Shop',
                isLoading: formState.result?.isLoading ?? false,
                onSubmitClick: form.invalid ? null : registerShop,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
