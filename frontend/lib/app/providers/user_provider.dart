import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/app/models/module_enum.dart';
import 'package:frontend/app/models/user_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
// @riverpod
class User extends _$User {
  final initialState = const UserModel(
    id: 'id',
    name: 'name',
    email: 'email',
    photoUrl: 'photoUrl',
    accessToken: 'accessToken',
  );

  @override
  UserModel? build() {
    return null;

    // return if initalState needd
    // return initialState;
  }

  Future<dynamic> setUserFromLocalStorage() async {
    var userId = localStorage.getItem('user_id');
    var email = localStorage.getItem('email');
    print(email);
    if (userId == null) {
      state = null;
      return false;
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final userDocument = await firestore
        .collection("users")
        .where('uid', isEqualTo: userId)
        .get();
    if (userDocument.docs.length == 0) {
      localStorage.clear();
      return false;
    }
    final userlist = userDocument.docs.map(
      (e) {
        return {'data': e.data(), 'id': e.id};
      },
    ).toList();

    final user = userDocument.docs[0].data();

    UserModel userModel = UserModel(
      id: user['uid'],
      name: user['name'],
      email: user['email'],
      phone: user['phone'],
      photoUrl: user['photoUrl'],
      // dateOfBirth: DateTime.tryParse(user['date_of_birth']),
      points: user['points'] ?? 0.0,
    );

    state = userModel;
  }

  saveUser(UserModel user) async {
    state = user;
    localStorage.setItem('accessToken', user.accessToken!);
    localStorage.setItem('user_id', user.id);
  }

  Future<void> updateProfilePoints(double points) async {
    String userId = localStorage.getItem('user_id')!;

    CollectionReference user =
        FirebaseFirestore.instance.collection(ModulesEnum.users.name);

    await setUserFromLocalStorage();

    await user.doc(userId).update({'points': (state!.points! + points)});
  }

  removeUser() {
    state = null;
    localStorage.removeItem('accessToken');
    localStorage.removeItem('user_id');
    localStorage.clear();
  }
}
