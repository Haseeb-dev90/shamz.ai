import '/app_exports.dart';
import 'firebase_options.dart';

void main() async {
  //make sure to intalize di
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kScaffoldBlackColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc()..add(AuthStarted()),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shamz AI',
      theme: AppTheme.lightTheme,
      navigatorKey: navigatorKey,
      onGenerateRoute: AppGenerateRoute.generateRoute,
    );
  }
}
