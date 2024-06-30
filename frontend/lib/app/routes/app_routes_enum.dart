// class AppRoutes {
//   static const String home = 'home';
//   static const String menu = 'menu';
//   static const String order = 'order';
//   static const String cart = 'cart';
//   static const String splash = 'splash';
//   static const String profile = 'profile';
//   static const String editProfile = 'editProfile';
//   static const String signIn = 'signIn';
//   static const String signUP = 'signUP';
// }

// enum AppRoutes {
//   const AppRoutes({required this.name, required this.path});
//   final String name;
//   final String path;

//   home(path:'')
// }

enum AppRouterEnum {
  splash(name: 'splash', path: '/'),
  googleLogin(name: 'google-login', path: '/google-login'),
  home(name: 'home', path: '/home'),
  shopDetail(name: 'shop-detail', path: '/shop-detail'),
  itemDetail(name: 'item-detail', path: '/item-detail'),
  detail(name: 'order', path: '/order'),
  cart(name: 'cart', path: '/cart'),
  profile(name: 'profile', path: '/profile'),
  editProfile(name: 'edit-profile', path: '/edit-profile'),
  signIn(name: 'signin', path: '/signin'),
  singUp(name: 'signup', path: '/signup'),
  shopForm(name: 'shop-form', path: '/shop-form'),
  productForm(name: 'productForm', path: '/productForm'),
  registerShop(name: 'register-shop', path: '/register-shop'),
  manageCakes(name: 'manage_cakes', path: '/manage_cakes'),
  manageCakesForm(name: 'manage_cakes_form', path: 'manage_cakes_form'),
  favs(name: 'favs', path: '/favs'),
  paymentScreen(name: 'payment-screen', path: '/payment-screen'),
  orderSummary(name: 'order-summary', path: '/order-summary'),
  moodSelect(name: 'mood_select', path: '/mood_select'),
  ;

  final String name;
  final String path;

  const AppRouterEnum({required this.name, required this.path});
}
