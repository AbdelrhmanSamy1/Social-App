import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/shop_app/login_model.dart';
import 'package:flutter_app/modules/shop_app/login/cubit/states.dart';
import 'package:flutter_app/modules/social_app/social_login/cubit/states.dart';
import 'package:flutter_app/modules/social_app/social_register/cubit/states.dart';
import 'package:flutter_app/networks/end_points.dart';
import 'package:flutter_app/networks/local/cache_helper.dart';
import 'package:flutter_app/networks/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisibilityState());
  }
  SocialLoginCubit() : super(SocialLoginInitialState());
  static SocialLoginCubit get(context) => BlocProvider.of(context);


  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(SocialLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print((value.user.email));
      print((value.user.uid));
      emit(SocialLoginSuccessState(value.user.uid));
    })
        .catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
    });
  }
}