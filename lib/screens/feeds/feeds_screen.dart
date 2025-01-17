import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/components.dart';
import 'package:flutter_app/layout/social_app/cubit/cubit.dart';
import 'package:flutter_app/layout/social_app/cubit/states.dart';
import 'package:flutter_app/models/social_app/post_model.dart';
import 'package:flutter_app/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.length > 0 && SocialCubit.get(context).userModel != null ,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children:
              [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10.0,
                  margin: EdgeInsets.all(8.0,),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:
                    [
                      Image(image: NetworkImage(
                        'https://image.freepik.com/free-photo/optimistic-laughing-black-woman-posing-studio-orange-background-relaxed-curly-female-model-enjoying-life_273443-74.jpg',
                      ),
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'communicate with friends',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontSize: 15,),
                        ),
                      ),

                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildPostItem(SocialCubit.get(context).posts[index], context, index),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.0,
                  ),
                  itemCount: SocialCubit.get(context).posts.length,
                ),
                SizedBox(
                  height: 8.0,
                ),

              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
  Widget buildPostItem(PostModel model, context, index) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Row(
            children:
            [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    '${model.image}'
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Row(
                      children: [
                        Text('${model.name}'),
                        SizedBox(
                          width: 4.0,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: defaultColor,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text('${model.dateTime}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  size: 20.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Text( '${model.text}',
          ),
          if(model.postImage != '')
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom:10.0,
            ),
            child: Container(
              width: double.infinity,
              child: Wrap(
                children:
                [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 2.0),
                    child: Container(
                      height:20.0,
                      child: MaterialButton(
                        onPressed: () {},
                        height: 20.0,
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text(
                            '#Reading',
                            style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue) ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 2.0),
                    child: Container(
                      height:20.0,
                      child: MaterialButton(
                        onPressed: () {},
                        height: 20.0,
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text(
                            '#Coffee',
                            style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue) ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(model.postImage != '')

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 140.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${model.image}',
                    ),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 15.0),
            child: Row(
              children:
              [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children:
                        [
                          Icon(
                            Icons.favorite_border_outlined,
                            size: 18.0,
                            color: Colors.red[300],
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${SocialCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: ()
                    {

                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:
                        [
                          Icon(
                            Icons.comment_outlined,
                            size: 17.0,
                            color: Colors.blue[300],
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '0',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ), //divider
          Row(
            children:
            [
              Expanded(
                child: InkWell(
                  child: Row(
                    children:
                    [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage(
                            '${SocialCubit.get(context).userModel.image}'
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text('Write a comment...',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children:
                    [
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 18.0,
                        color: Colors.red[300],
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                ),
                onTap: ()
                {
                   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                },
              ),

            ],
          ),
        ],
      ),
    ),
  );
}

