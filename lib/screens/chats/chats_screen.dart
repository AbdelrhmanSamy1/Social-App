import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/components.dart';
import 'package:flutter_app/layout/social_app/cubit/cubit.dart';
import 'package:flutter_app/layout/social_app/cubit/states.dart';
import 'package:flutter_app/models/social_app/social_user_model.dart';
import 'package:flutter_app/modules/social_app/chat_details/chat_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildChatItem(SocialCubit.get(context).users[index],context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 1,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildChatItem(SocialUserModel model, context)  => InkWell(
    onTap: (){
      navigateTo(context, ChatDetailsScreen(
        userModel: model,
          ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children:
        [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
              'https://image.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg'
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
              'Mohamed Ahmed',
                  style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

