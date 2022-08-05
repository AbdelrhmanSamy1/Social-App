
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/components.dart';
import 'package:flutter_app/layout/social_app/cubit/cubit.dart';
import 'package:flutter_app/layout/social_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget
{

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>
      (
      listener: (context, state){},
      builder: (context, state)
      {
        var userModel = SocialCubit.get(context).userModel;
        var ProfileImage = SocialCubit.get(context).profileImage;
        var CoverImage = SocialCubit.get(context).coverImage;


        nameController.text = userModel.name;
        phoneController.text = userModel.phone;
        bioController.text = userModel.bio;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              defaultTextButton(
                function: ()
                {
                  SocialCubit.get(context).updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                },
                text: 'Update',
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:
                [
                  if(state is SocialUdateLoadingState)
                  LinearProgressIndicator(),
                  if(state is SocialUdateLoadingState)
                    SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 200.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children:
                      [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0,),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    image: DecorationImage(
                                      image: CoverImage == null ? NetworkImage(
                                          '${userModel.cover}'
                                      ) : FileImage(CoverImage),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              IconButton(
                                  onPressed: ()
                                  {
                                    SocialCubit.get(context).getCoverImage();
                                  },
                                  icon: CircleAvatar(
                                    radius: 20.0,
                                      backgroundColor: Colors.blue,
                                      child: Icon(
                                          Icons.camera_alt_outlined,
                                        size: 18.0,
                                        color: Colors.white,
                                      ),
                                  ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                            CircleAvatar(
                            radius: 63.0,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: ProfileImage == null ? NetworkImage(
                                  '${userModel.image}'
                              ) : FileImage(ProfileImage),
                            ),
                          ),
                              IconButton(
                                onPressed: ()
                                {
                                  SocialCubit.get(context).getProfileImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.blue,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if(SocialCubit.get(context).profileImage != null || SocialCubit.get(context).coverImage != null)
                  Row(
                    children:
                    [
                      if(SocialCubit.get(context).profileImage != null)
                      Expanded(
                        child: Column(
                          children: [
                            defaultButton(
                                function: ()
                                {
                                  SocialCubit.get(context).uploadProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                  );
                                },
                                text: 'Upload Profile',
                            ),
                            // SizedBox(height: 5.0,),
                            // LinearProgressIndicator(),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      if(SocialCubit.get(context).coverImage != null)
                        Expanded(
                        child: Column(
                          children: [
                            defaultButton(
                              function: ()
                              {
                                SocialCubit.get(context).uploadCoverImage(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    bio: bioController.text,
                                );
                              },
                              text: 'Upload Cover',
                            ),
                            // SizedBox(height: 5.0,),
                            // LinearProgressIndicator(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if(SocialCubit.get(context).profileImage != null || SocialCubit.get(context).coverImage != null)
                    SizedBox(height: 10.0,),
                    defaultFormField
                    (
                      controller: nameController,
                      type: TextInputType.name,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                        {
                          return'Please Enter Your Name';
                        }
                      return null;
                    },
                      label: 'name',
                      prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField
                    (
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return'Please Enter Your Phone';
                      }
                      return null;
                    },
                    label: 'Phone',
                    prefix: Icons.phone_outlined,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField
                    (
                    controller: bioController,
                    type: TextInputType.text,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return'Please Enter Your Bio';
                      }
                      return null;
                    },
                    label: 'Bio',
                    prefix: Icons.info_outline,
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );

  }
}