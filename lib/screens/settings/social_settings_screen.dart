import 'package:flutter/material.dart';
import 'package:flutter_app/components/components.dart';
import 'package:flutter_app/layout/social_app/cubit/cubit.dart';
import 'package:flutter_app/layout/social_app/cubit/states.dart';
import 'package:flutter_app/modules/social_app/edit_profile/edit_profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialSettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state){},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              Container(
                height: 200.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children:
                  [
                    Align(
                      child: Container(
                        height: 140.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0,),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                '${userModel.cover}'
                              ),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 63.0,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                            '${userModel.image}'
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0,),
              Text(
                '${userModel.name}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 5.0,),
              Text(
                '${userModel.bio}',
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(height: 8.0,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children:
                          [
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children:
                          [
                            Text(
                              '55',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'photos',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children:
                          [
                            Text(
                              '10K',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children:
                          [
                            Text(
                              '99',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'Following',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: (){},
                      child: Text (
                      'Add Photos',
                        style: TextStyle(
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  OutlinedButton(
                      onPressed: ()
                      {
                        navigateTo(context, EditProfileScreen());
                      },
                      child: Icon (
                        Icons.edit_outlined,
                        size: 20.0,
                      ),
                  ),
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}
