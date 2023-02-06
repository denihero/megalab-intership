import 'package:auto_route/auto_route.dart';
import 'package:mega_intern/core/storage/storage.dart';
import 'package:mega_intern/navigation/router_nav.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async{
    if(await SecureStorage.storage.containsKey(key: 'mega')){
      resolver.next(true);
    }else{
      router.push(const RegistrationScreenRoute());
    }
  }
}