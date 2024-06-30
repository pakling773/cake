import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/app/actions/shop_action.dart';
import 'package:frontend/app/common/context_extenstion.dart';
import 'package:frontend/app/common/mutation_hook.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/providers/brands/brands_repository.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/providers/cake/manage_cakes_provider.dart';
import 'package:frontend/app/providers/shop_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/fields/floating_input.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/main.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';

class ManageCakesForm extends StatefulHookConsumerWidget {
  final String? id;
  const ManageCakesForm({super.key, this.id});

  @override
  ConsumerState<ManageCakesForm> createState() => _ManageCakesFormState();
}

class _ManageCakesFormState extends ConsumerState<ManageCakesForm> {
  CakeModel? cake;

  final FormGroup formGroup = FormGroup({
    'name': FormControl<String>(value: '', validators: [Validators.required]),
    'price': FormControl<int>(value: 1, validators: [Validators.required]),
    'category_id':
        FormControl<String>(value: '', validators: [Validators.required]),
    'flavour_id':
        FormControl<String>(value: '', validators: [Validators.required]),
    'featured':
        FormControl<bool>(value: false, validators: [Validators.required]),
    'photo': FormControl<List<SelectedFile>>(validators: [Validators.required]),
    'description': FormControl<String>(value: '', validators: []),
    'specification': FormControl<String>(value: '', validators: []),
  });

  @override
  void initState() {
    super.initState();

    getCake();
  }

  @override
  void dispose() {
    super.dispose();

    formGroup.dispose();
  }

  Future<void> getCake() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.id != null) {
        final data = await ref.watch(cakeProvider.notifier).getCake(widget.id!);

        if (data != null) {
          setState(() {
            cake = data;
            patchFormValues(data);
          });
        }
      }
    });
  }

  Future<void> patchFormValues(CakeModel cake) async {
    List<SelectedFile>? selectedFile;
    if (cake.photo != null) {
      selectedFile = [SelectedFile.image(url: cake.photo)];
    }

    formGroup.patchValue({
      'name': cake.name,
      'price': cake.price,
      'category_id': cake.categoryId,
      'flavour_id': cake.flavourId,
      'featured': cake.featured,
      'photo': selectedFile,
      'description': cake.description,
      'specification': cake.specification,
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getCategoriesProvider);
    final brands = ref.watch(brandsRepositoryProvider);

    final Mutation(mutate: onSave, state: state) = useMutation(
      () async {
        if (formGroup.valid) {
          final image =
              (formGroup.control('photo').value as List<SelectedFile>).first;

          String? selectedImage = image.url ??
              await ShopAction().uploadImage(File(image.file!.path));

          if (selectedImage == null) {
            throw Exception("Image upload failed");
          }

          final shop = ref.watch(shopProvider);

          final data = CakeModel(
            id: widget.id,
            featured: formGroup.control('featured').value,
            flavourId: formGroup.control('flavour_id').value,
            name: formGroup.control('name').value,
            photo: selectedImage,
            price: formGroup.control('price').value,
            shopId: shop?.id,
            categoryId: formGroup.control('category_id').value,
            description: formGroup.control('description').value,
            specification: formGroup.control('specification').value,
          );

          return await ref
              .read(manageCakesProvider.notifier)
              .save(widget.id, data);
        }
      },
      onSuccess: (result) async {
        formGroup.reset();
        if (context.canPop()) {
          context.pop();
        } else {
          context.goNamed(AppRouterEnum.manageCakes.name);
        }
      },
      onError: (error) {
        logger.d('🔴 $error');
        throw Exception('Failed to save cake: $error');
      },
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.2),
        titleSpacing: 0,
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: Text(
          cake?.name ?? 'Create Cake',
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    FloatingInput(
                      key: UniqueKey(),
                      formControlName: 'name',
                      label: 'Cake Name',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please fill in your cake name'
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FloatingInput(
                      key: UniqueKey(),
                      formControlName: 'price',
                      inputType: InputMode.digit,
                      label: 'Price',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please fill in your price'
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    categories.when(
                      data: (data) => ReactiveDropdownField<String>(
                        key: UniqueKey(),
                        formControlName: 'category_id',
                        decoration:
                            const InputDecoration(labelText: 'Category'),
                        items: data.map((category) {
                          return DropdownMenuItem<String>(
                            value: category.id,
                            child: Text(category.name ?? ''),
                          );
                        }).toList(),
                      ),
                      loading: () => const CircularProgressIndicator.adaptive(),
                      error: (error, stack) =>
                          const Text('Error loading categories'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    brands.when(
                      data: (data) => ReactiveDropdownField(
                        key: UniqueKey(),
                        formControlName: 'flavour_id',
                        decoration: const InputDecoration(labelText: 'Brand'),
                        items: data.map((brand) {
                          return DropdownMenuItem<String>(
                            value: brand.id,
                            child: Text(brand.name ?? ''),
                          );
                        }).toList(),
                      ),
                      loading: () => const CircularProgressIndicator.adaptive(),
                      error: (error, stack) =>
                          const Text('Error loading brands'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FloatingInput(
                      key: UniqueKey(),
                      formControlName: 'description',
                      maxLines: 4,
                      label: 'Description',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please fill in your description'
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FloatingInput(
                      key: UniqueKey(),
                      formControlName: 'specification',
                      maxLines: 4,
                      label: 'Specification',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please fill in your specification'
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReactiveSwitchListTile.adaptative(
                      contentPadding: const EdgeInsets.all(0),
                      key: UniqueKey(),
                      formControlName: 'featured',
                      title: Text(
                        'Featured',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      dense: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReactiveImagePicker(
                      key: UniqueKey(),
                      formControlName: 'photo',
                      modes: const [
                        ImagePickerMode.cameraImage,
                        ImagePickerMode.galleryImage,
                      ],
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: 'Photo',
                        filled: false,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        helperText: '',
                      ),
                      preprocessError: (e) async {
                        if (e is PlatformException) {
                          switch (e.code) {
                            case 'photo_access_denied':
                              await _photoDenied(context);
                              break;
                            case 'camera_access_denied':
                              await _cameraDenied(context);
                              break;
                          }
                        }
                      },
                      inputBuilder: (onPressed) => OutlinedButton.icon(
                        onPressed: onPressed,
                        icon: const Icon(Icons.add),
                        label: const Text('Add an image'),
                      ),
                      imageContainerDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15)
                  .copyWith(bottom: 30),
              child: ReactiveFormConsumer(builder: (context, form, _) {
                return SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed:
                        formGroup.invalid || (state.result?.isLoading == true)
                            ? null
                            : onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      foregroundColor: AppColors.white,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: 10,
                      children: [
                        if ((state.result?.isLoading == true))
                          const CircularProgressIndicator.adaptive(),
                        Text(
                          widget.id != null ? 'Update' : 'Submit',
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _photoDenied(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Photo access required'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Open settings to allow access',
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('Settings'),
                onPressed: () async {
                  await AppSettings.openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

  Future<void> _cameraDenied(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Camera access required'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Open settings to allow access',
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('Settings'),
                onPressed: () async {
                  await AppSettings.openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
}
