import 'package:flutter/material.dart';
var total = 0;

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);
  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  var cost = [0,0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        Item('Pull',329,'img/pull_1.jpg',0,cost[0]),
        Item('T-shirt',425,'img/t-shirt_1.jpg',0,cost[1]),
        Total(cost.reduce((value, element) => value+element).toString()),
      ],
    );
  }
}

class Total extends StatefulWidget {
  String _cost;
  Total(this._cost);

  @override
  State<Total> createState() => _TotalState();
}

class _TotalState extends State<Total> {
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
          ElevatedButton(onPressed: () {setState(() {
            widget._cost=_ShopState().cost.reduce((value, element) => value+element).toString();
          });}, child: Text("Total")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(4.0),
            ),

            child: Center(
              child :
              Text(widget._cost,
                style: TextStyle(fontSize: 20.0,color: Colors.black,),
              ),
            ),
          ),
          ],
      ),
    );
  }
}

class Item extends StatefulWidget {
  final String _name;
  final String _picture;
  final int _value;
  int count;
  int cost;
  Item(this._name,this._value,this._picture,this.count,this.cost);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
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
          ElevatedButton(onPressed: () {setState(() {++widget.count;widget.cost=widget.count*widget._value;});},
            child: Text("+")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(4.0),
            ),

            child: Center(
              child :
              Text(widget.count.toString(),
                style: TextStyle(fontSize: 20.0,color: Colors.black,),
              ),
            ),
          ),
          ElevatedButton(onPressed: () {setState(() {--widget.count;widget.cost=widget.count*widget._value;});},
              child: Text("-"),),
        ],
      ),
    );
  }
}

class _ItemLabel extends StatelessWidget {
  static const textStyle = TextStyle(
    color: Colors.black,
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
    color: Colors.black,
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
