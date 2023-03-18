import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
   runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return WeatherProvider();
      },
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: Color(0xFFF5F5F5))),
        initialRoute: "/",
        home: Homepage(),
      ),
    );
  }
}
// // void main()
// // {
// //   String date="2023-03-15";
// //   DateTime KK=DateTime.parse(date);
// //   const Map<int, String> weekdayName = {1: "Monday", 2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday", 6: "Saturday", 7: "Sunday"};

// //   print(weekdayName[KK.weekday]);

// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:workmanager/workmanager.dart';
// import 'package:flutter/cupertino.dart';

// void main() {

// // needed if you intend to initialize in the `main` function
// WidgetsFlutterBinding.ensureInitialized();

// print("start");
// // Periodic task registration
// // Workmanager().registerPeriodicTask(
// // 	"2",

// // 	//This is the value that will be
// // 	// returned in the callbackDispatcher
// // 	"simplePeriodicTask",

// // 	// When no frequency is provided
// // 	// the default 15 minutes is set.
// // 	// Minimum frequency is 15 min.
// // 	// Android will automatically change
// // 	// your frequency to 15 min
// // 	// if you have configured a lower frequency.
// // 	frequency: Duration(minutes: 15),
// // );
// runApp(MyApp());
// }

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

// Future showNotification() async {


//   AndroidNotificationDetails androidPlatformChannelSpecifics =
//   AndroidNotificationDetails(

//     'تطبيق المسلم',
//     'تطبيق اذكار وادعية وتلاوة وقراءة القرءان الكريم',
//     importance: Importance.max,
//     priority: Priority.high,
//     playSound: true,
//     enableVibration: true,

//   );
//   // var iOSPlatformChannelSpecifics = IOSNotificationDetails(
//   //   threadIdentifier: 'thread_id',
//   // );
//   var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//   );

//   await flutterLocalNotificationsPlugin.show(
//     1,
//     'فَذَكِّرْ',
//     'hihihihi',
//     platformChannelSpecifics,
//   );

//   /// periodically...but const id && const title,body
//   /*await flutterLocalNotificationsPlugin.periodicallyShow(
//     Random().nextInt(azkar.length-1),
//     'السلام عليكم',
//     azkar[Random().nextInt(azkar.length-1)],
//     RepeatInterval.everyMinute,
//     platformChannelSpecifics,
//     androidAllowWhileIdle: true,
//     payload: '',
//   );*/

// }



// void callbackDispatcher() {
//   print("hi im her hgsbhdchsddfhksv");

//   // initial notifications
//   var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

//   var initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );

//   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   WidgetsFlutterBinding.ensureInitialized();

//   flutterLocalNotificationsPlugin!.initialize(
//     initializationSettings,
//   );


//   Workmanager().executeTask((task, inputData) {
//     showNotification();
//     return Future.value(true);
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     Workmanager().initialize(

// 	// The top level function, aka callbackDispatcher
// 	callbackDispatcher,

// 	// If enabled it will post a notification whenever
// 	// the task is running. Handy for debugging tasks
// 	isInDebugMode: true
// );
//     print("object");
//     Workmanager().registerPeriodicTask(
//       "1",
//       "periodic Notification",
//       frequency: Duration(minutes: 15),
//     );

//     Workmanager().registerPeriodicTask(
//       "2",
//       "periodic Notification at day",
//       frequency: Duration(days: 1),
//     );
//     super.initState();
//   }
// // This widget is the root of your application.
// @override
// Widget build(BuildContext context) {
//  	return MaterialApp(
// 	title: 'Geeks Demo',
// 	theme: ThemeData(

// 		// This is the theme
// 		// of your application.
// 		primarySwatch: Colors.green,
// 	),
// 	home: Scaffold(
//     appBar: AppBar(),
//     body: Center(child: ElevatedButton(onPressed: ()async

//     {await showNotification();}, child: Text("ff")),),

//   ),
// 	);
// }
// }

// class HomePage extends StatefulWidget {
// HomePage({Key? key, this.title}) : super(key: key);
// // This widget is the home page of your application.
// // It is stateful, meaning
// // that it has a State object (defined below)
// // that contains fields that affect
// // how it looks.

// // This class is the configuration for the state.
// // It holds the values (in this
// // case the title) provided by the parent
// // (in this case the App widget) and
// // used by the build method of the State.
// // Fields in a Widget subclass are
// // always marked "final".

// final String? title;

// @override
// _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
// @override
// Widget build(BuildContext context) {

// 	// This method is rerun every time setState is called.
// 	// The Flutter framework has been optimized
// 	// to make rerunning build methods
// 	// fast, so that you can just rebuild
// 	// anything that needs updating rather
// 	// than having to individually change
// 	//instances of widgets.
// 	return Scaffold(
// 	appBar: AppBar(

// 		// Here we take the value from
// 		// the MyHomePage object that was created by
// 		// the App.build method, and use it
// 		// to set our appbar title.
// 		title: Text(widget.title!),
// 	),
// 	body: new Container(),
// 	);
// }
// }
