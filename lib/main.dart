import 'package:flutter/material.dart';
import 'package:flutter_app/bincalc.dart';

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
  const MainPage({Key? key}) : super(key: key);
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


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Project',
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _navigateToNextScreen(context);
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                /*Container(
                  height: 50,
                  alignment: Alignment.centerRight
                    ,
                  child: const Text(
                    'hehehehe')
                  ),*/
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                        _navigateToNextScreen(context);
                      },
                    ))
              ],
            )));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainPage()));
  }
}



class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget calcbutton(String btntxt,Color btncolor,Color txtcolor){
    return  Container(
      child: RaisedButton(
        onPressed: (){
          calculation(btntxt);
        },
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC',Colors.grey,Colors.black),
                calcbutton('+/-',Colors.grey,Colors.black),
                calcbutton('%',Colors.grey,Colors.black),
                calcbutton('/',Colors.amber,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7',Colors.grey,Colors.white),
                calcbutton('8',Colors.grey,Colors.white),
                calcbutton('9',Colors.grey,Colors.white),
                calcbutton('x',Colors.amber,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4',Colors.grey,Colors.white),
                calcbutton('5',Colors.grey,Colors.white),
                calcbutton('6',Colors.grey,Colors.white),
                calcbutton('-',Colors.amber,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1',Colors.grey,Colors.white),
                calcbutton('2',Colors.grey,Colors.white),
                calcbutton('3',Colors.grey,Colors.white),
                calcbutton('+',Colors.amber,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: (){
                    calculation('0');
                  },
                  shape: StadiumBorder(),
                  child: Text('0',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white),
                  ),
                  color: Colors.grey[850],
                ),
                calcbutton('.',Colors.grey,Colors.white),
                calcbutton('=',Colors.amber,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  //Calculator logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}


class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertState();
}

class _AlertState extends State<AlertPage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Incoming')),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a Text',
                    )),
                ElevatedButton(
                  child: Text(
                    'Alert page',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(textController.text),
                        );
                      },
                    );
                    //onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyLayout()),*/
                    //showAlertDialog(context);
                  },
                ),

              ]),
        ));
  }
}

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Shop')),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 60.0,
            horizontal: 80.0,
          ),
          color: Color(0xFFFFFFFF),
          child: Content_Shop(),
        ),
    );
  }
}

class Content_Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        Item('Pull',329,'img/pull_1.jpg'),
        Item('T-shirt',425,'img/t-shirt_1.jpg'),
      ],
    );
  }
}

class Item extends StatefulWidget {
  final String _name;
  final String _picture;
  final int _value;
  Item(this._name,this._value,this._picture);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(widget._picture,height: 60,width: 50,),
          _ItemLabel(widget._name),
          _ItemValue(widget._value),
          _ItemButton(
            count,
            onPressed: () {
              setState(() {
                ++count;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _ItemLabel extends StatelessWidget {
  static const textStyle = TextStyle(
    color: Color(0xFF000000),
    fontSize: 26.0,
  );

  final String _label;
  _ItemLabel(this._label);

  @override
  Widget build(BuildContext context) {
    return Text(
      _label,
      style: _ItemLabel.textStyle,
    );
  }
}

class _ItemValue extends StatelessWidget {
  static const textStyle = TextStyle(
    color: Color(0xFF000000),
    fontSize: 26.0,
  );

  final int _value;
  _ItemValue(this._value);

  @override
  Widget build(BuildContext context) {
    return Text(
      _value.toString()+' Lei',
      style: _ItemLabel.textStyle,
    );
  }
}

class _ItemButton extends StatelessWidget {
  final count;
  final onPressed;
  _ItemButton(this.count, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            '$count',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}