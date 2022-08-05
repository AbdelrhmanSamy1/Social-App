import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/shop_app/login_model.dart';
import 'package:flutter_app/models/social_app/social_user_model.dart';
import 'package:flutter_app/modules/shop_app/login/cubit/states.dart';
import 'package:flutter_app/modules/social_app/social_register/cubit/states.dart';
import 'package:flutter_app/networks/end_points.dart';
import 'package:flutter_app/networks/local/cache_helper.dart';
import 'package:flutter_app/networks/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel;

  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
  })
  {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password : password,
    )
        .then((value)
    {
      print(value.user.email);
      print(value.user.uid);
      userCreate(name: name,
        email: email,
          phone: phone,
          uId: value.user.uid,);
          emit(SocialRegisterSuccessState(loginModel)
          );
    })
        .catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String name,
    @required String email,
    @required String phone,
    @required String uId,
  })
  {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: 'Write your bio',
      image: 'https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/216834921_1989580147855823_242511097726442783_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=677B0PshWdkAX_8qz2q&_nc_ht=scontent.fcai20-1.fna&oh=2ce6473b793a7002e6d133a20f869101&oe=61969998',
      cover: 'https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/217807040_1989579817855856_3962746803666036789_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=e3f864&_nc_ohc=j5upZJ1DShYAX_qNadG&_nc_ht=scontent.fcai20-2.fna&oh=c46b0ab15b7a963449672c2f2018753f&oe=61958BDA',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId).set(model.toMap())
        .then((value)
    {
          emit(SocialCreateUserSuccessState());
    })
        .catchError((error) {
          print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;


  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
