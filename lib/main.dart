
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  await CacheHelper. init();

  bool isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  // bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  //  token = CacheHelper.getData(key: 'token');

  uId = CacheHelper.getData(key: 'uId');
  print(token);

  // if(onBoarding != null)
  //   {
  //     if(token != null ) widget = ShopLayout();
  //     else widget = ShopLoginScreen();
  //   }

  if(uId !=null)
  {
    widget = SocialLayout();
  } else{
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}


class MyApp extends StatelessWidget
{
  final bool isDark;
  final Widget startWidget;
  MyApp({
    this.isDark,
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        // BlocProvider(
        // create: (BuildContext context) => AppCubit()
        // ..changeAppMode(
        // fromShared: isDark,
        // ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()..getHomeData()..getCategories()..getFavorits(),
        ),
        BlocProvider(
          create: (BuildContext context) => SocialCubit()..getUserData()..getPosts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        // themeMode: SocialCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
        home: BmiResultScreen(),
      ),
    );

  }
}
