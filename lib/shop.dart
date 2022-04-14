import 'package:flutter/material.dart';

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