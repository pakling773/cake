import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/app/models/module_enum.dart';
import 'package:frontend/app/models/user_model.dart';
import 'package:localstorage/localstorage.dart';

class UserAction {
  Future<void> updateUser(form) async {
    String userId = localStorage.getItem('user_id')!;
    final userData = UserModel(
      id: userId,
      name: form.value['name'] as String,
      email: form.value['email'] as String,
      phone: form.value['phone'] as String,
      photoUrl: form.value['photoUrl'] as String,
      // dateOfBirth: form.value['date_of_birth'] as DateTime,
    );

    CollectionReference user =
        FirebaseFirestore.instance.collection(ModulesEnum.users.name);

    return await user.doc(userId).update(userData.toJson());
  }
}
