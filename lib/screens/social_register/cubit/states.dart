import 'package:flutter_app/models/shop_app/login_model.dart';


abstract class SocialRegisterStates {}

class SocialRegisterInitialState extends SocialRegisterStates {}

class SocialRegisterLoadingState extends SocialRegisterStates {}

class SocialRegisterSuccessState extends SocialRegisterStates
{
  final LoginModel loginModel;

  SocialRegisterSuccessState(this.loginModel);
}

class SocialRegisterErrorState extends SocialRegisterStates
{
  final String error;

  SocialRegisterErrorState(this.error);
}

class SocialCreateUserSuccessState extends SocialRegisterStates {}

class SocialCreateUserErrorState extends SocialRegisterStates
{
  final String error;

  SocialCreateUserErrorState(this.error);
}


class SocialRegisterChangePasswordVisibilityState extends SocialRegisterStates {}