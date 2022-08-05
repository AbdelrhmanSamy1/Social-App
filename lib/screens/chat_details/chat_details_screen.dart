import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/social_user_model.dart';
class ChatDetailsScreen extends StatelessWidget
{
  SocialUserModel userModel;
  ChatDetailsScreen({
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children:
          [
            CircleAvatar(
              radius:20.0,
              backgroundImage: NetworkImage('https://image.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Mohamed Ahmed',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(10.0),
                      topStart: Radius.circular(10.0),
                      topEnd: Radius.circular(10.0),
                    )
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: Text(
                  'Hello world',
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                decoration: BoxDecoration(
                    color: defaultColor.withOpacity(.27,),
                    borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(10.0),
                      topStart: Radius.circular(10.0),
                      topEnd: Radius.circular(10.0),
                    )
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: Text(
                  'Hello world',
                ),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0,),

              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children:
                [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'type your message here ...',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 47.0,
                    color: defaultColor,
                    child: MaterialButton(
                      onPressed:() {},
                      minWidth: 1.0,
                      child: Icon(
                        Icons.send,
                        // size: ,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}