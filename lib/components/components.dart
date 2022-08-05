
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';


Widget defaultButton({
    double width = double.infinity,
    Color background = Colors.blue,
    bool isUpperCase = true,
    double radius = 3.0,
    @required Function function,
    @required String text,
}) =>
      Container(
        width: width,
        height: 50.0,
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              radius,
          ),
          color: background,
        ),
      ) ;

Widget defaultTextButton({
    @required Function function,
    @required String text,
}) =>
    TextButton(
        onPressed: function,
        child: Text(text.toUpperCase(),
        ),
    );


 defaultFormField({
    @required TextEditingController controller,
    @required TextInputType type,
    Function onSubmit,
    Function onChange,
    Function onTap,
    bool isPassword = false,
    @required Function validate,
    @required String label,
    @required IconData prefix,
    IconData suffix,
    Function suffixPressed,
    bool isClickable = true,
}) => TextFormField(
   controller: controller,
   keyboardType: type,
   obscureText: isPassword,
   enabled: isClickable,
   onFieldSubmitted: onSubmit,
   onChanged: onChange,
   onTap: onTap,
   validator: validate,
   decoration: InputDecoration(
     labelText: label,
     prefixIcon: Icon(
       prefix,
     ),
     suffixIcon: suffix != null
       ? IconButton(
         onPressed: suffixPressed,
         icon: Icon(
             suffix,
         ),
       )
         :null,
     border: OutlineInputBorder(),
   ),
 );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
          ),
          SizedBox(
            width: 20.0,
          ),
          IconButton(
              onPressed: (){
                AppCubit.get(context).updataData(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
          ),
          IconButton(onPressed: () {
            AppCubit.get(context).updataData(
              status: 'archive',
              id: model['id'],
            );
          },
              icon: Icon(
                Icons.archive,
                color: Colors.black45,
              ),
          ),
          ],
        ),
      )
);
)
      onDismissed: (direction)

Widget myDivider() => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0,),
          image: DecorationImage(
            image: NetworkImage('urlToImage'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'title',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
              Text(
                'publishedAt',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0,),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,



                  ),

                ),

                Text(

                  'publishedAt',

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

void navigateTo(context, widget) {
}

Widget articleBuilder(list, context) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) =>
        ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) => myDivider(),
            itemBuilder: (BuildContext context,int  index) => buildArticleItem(list[index], context),
          itemCount: 10,
        ),
  fallback: (context)=> Center(child: CircularProgressIndicator()),
);

void navigateAndFinish(
    context,
    widget
    ) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => widget,
        ),
        (route)
      {
          return false;
        },
    );






