import 'package:flutter/material.dart';
import 'package:flutter_app/bincalc.dart';
import 'package:flutter_app/shop.dart';
import 'package:flutter_app/alert.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/classiccalc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter project',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.amber,
          brightness: Brightness.light,
          hoverColor: Colors.yellow,
          backgroundColor: Colors.white,
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        accentColor: Colors.amber,
        hoverColor: Colors.yellow,
        backgroundColor: Colors.black45,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),

      ),
      home: const LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key,required this.username, required this.password}) : super(key: key);
  final String username;
  final String password;
  final String title = 'Flutter Project';
  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {_navigateToLoginScreen(context);},
          icon : Image.asset('img/logo_flutter.png'),
        ),
      ),
      body:AlertDialog(
        content:
        Text(_Text(widget.username,widget.password)),
      ),
      bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Alert',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: 'Binary Calculator',
            ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Calculator',
              ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
            ),
            ],
            currentIndex: _selectedPage,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }

  String _Text(String user, String pass) {
    if (user == '') {
      return ('Welcome, you are not connected please try again later');
    }else return ('Welcome '+user+', your password is '+pass);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
    if (index==0) _navigateToAlertScreen(context);
    else if(index==1) _navigateToBinaryCalculatorScreen(context);
    else if(index==2) _navigateToCalculatorScreen(context);
    else _navigateToShopScreen(context);
  }
  void _navigateToLoginScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
  void _navigateToAlertScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AlertPage()));
  }
  void _navigateToBinaryCalculatorScreen(BuildContext context) {
    Navigator.of(context)
        //.push(MaterialPageRoute(builder: (context) => Calculator()));
        .push(MaterialPageRoute(builder: (context) => BinaryCalc()));
  }
  void _navigateToCalculatorScreen(BuildContext context) {
    Navigator.of(context)
    //.push(MaterialPageRoute(builder: (context) => Calculator()));
        .push(MaterialPageRoute(builder: (context) => Calculator()));
  }
  void _navigateToShopScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Shop()));
  }

}


