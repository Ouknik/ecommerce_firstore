import 'package:firebase_core/firebase_core.dart';
import 'package:firebasegetex/helpear/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpear/bindings.dart';
import 'view/auth/login_scren.dart';
import 'view/controller_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'GetX Firebase Firestore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ControllerView(),
    );
  }
}




/*
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high impprtance channel', 'hjigh important notification',
    // "this hanel is used for important notification",
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loogin(),
    );
  }
}

class loogin extends StatefulWidget {
  const loogin({Key? key}) : super(key: key);

  @override
  _looginState createState() => _looginState();
}

class _looginState extends State<loogin> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                  title: Text(notification.title.toString()),
                  content: SingleChildScrollView(
                    //controller: controllor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(notification.body.toString())],
                    ),
                  ));
            });
      }
    });
  }

  final email = TextEditingController();
  final password = TextEditingController();
  void showNoification() {
    flutterLocalNotificationsPlugin.show(
      0,
      'ouknik abdellah',
      'hhhhhh',
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Center(
            child: Column(
              children: [
                const Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 40,
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      icon: new Icon(Icons.person),
                      border: OutlineInputBorder(),
                      // border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password_sharp),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_outlined)),

                      border: OutlineInputBorder(),
                      // border: UnderlineInputBorder(),
                      labelText: 'Enter your password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(SignUp());
                    },
                    // color: Colors.gr,
                    child: const Text(
                      'signup',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/