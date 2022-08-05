import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/cubit/cubit.dart';

import '../../layout/cubit/states.dart';


class NewPostScreen extends StatelessWidget
{

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Create Post',
            actions:
            [
              defaultTextButton(
            function: () {
              var now = DateTime.now();

          if (SocialCubit.get(context).postImage == null)
          {
            SocialCubit.get(context).createPost(
              dateTime: now.toString(),
              text: textController.text,
            );
          }else
            {
              SocialCubit.get(context).uploadPostImage(
              dateTime: now.toString(),
              text: textController.text,
              );
            }
        },
                  text: 'post'
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  SizedBox(
                  height: 10.0,
                ),
                Row(
                  children:
                  [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          'https://image.freepik.com/free-photo/young-caucasian-man-celebrating-new-year-isolated-yellow-background_1187-198788.jpg'
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                        'Abdelrhman Samy',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'What is in your mind ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                if(SocialCubit.get(context).postImage != null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 140.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                            image: FileImage(SocialCubit.get(context).postImage),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    IconButton(
                      onPressed: ()
                      {
                        SocialCubit.get(context).removePostImage();
                      },
                      icon: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.close,
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: ()
                          {
                            SocialCubit.get(context).getPostImage();
                          },

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              Icon(
                                Icons.image_outlined,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                  'Add Photo'
                              ),
                            ],
                          )
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child:
                          Text(
                              '# tags'
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}
