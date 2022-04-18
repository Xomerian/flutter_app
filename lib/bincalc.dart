import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BinaryCalc extends StatefulWidget {
  const BinaryCalc({Key? key}) : super(key: key);

  @override
  State<BinaryCalc> createState() => _BinaryCalcState();
}

class _BinaryCalcState extends State<BinaryCalc> {
  // operational variables
  String prevIn = '';
  String currIn = '';
  String ans = '';
  bool shouldClear = false;

  //history
  List<HistoryElem> historyList = [];

  //calculator logic
  insertDigit(dig){
    if(shouldClear){
      clearDisplay();
      shouldClear = false;
    }

    if(currIn.length<8) {
      currIn+=dig;
    }
  }
  clearDisplay(){
    if(currIn==''){
      prevIn = '';
    }
    currIn = '';
  }
  onPlus(){
    if(prevIn!=''){
      onEquals();
    }
    prevIn = currIn;
    shouldClear = true;
  }
  onEquals(){
    ans = binarySumStr(prevIn, currIn);
    historyList.insert(0, HistoryElem(prevIn, currIn, ans));
    prevIn = '';
    currIn = ans;
    shouldClear = true;
  }
  String binarySumStr(String first,String second){
    String res = '';
    print(first + 'a' + second);
    if(first == '') return second;
    String pad1 = first.padLeft(8,'0');
    String pad2 = second.padLeft(8,'0');
    bool carry = false;
    for (var i = 7;i >= 0; i--){
      var dig1 = pad1[i];
      var dig2 = pad2[i];
      int digSum = binStr(dig1) + binStr(dig2) + (carry?1:0);
      bool digit = digSum%2==1;
      carry = digSum > 1;
      //print(dig1 + ' ' + dig2 + ' ' + );

      res = (digit?'1':'0') + res;
    }
    if(carry){
      showDialog(context: context, builder: (_)=>AlertDialog(
        title: Text('Overflow!'),
        content: Text('The carried bit will be ignored.'),
      ));
      //print("overflow!");
    }
    return res;
  }
  int binStr(String inS){
    bool val = inS[0] == '1';
    return val?1:0;
  }
  String trimZeros(String binStr){
    if(binStr == '') return '';
    var i = 0;
    while(binStr[i]=='0'&&i<binStr.length-1){
      i++;
    }
    return binStr.substring(i,binStr.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Binary Calculator'),
          backgroundColor: Colors.amber,
        ),
        body: Container(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.amberAccent,
                    margin: EdgeInsets.only(top:20,bottom:5,left: 10,right:10),
                    padding: EdgeInsets.only(top:20,bottom:5,left: 10,right:10),
                    width:350,
                    child:Text('+' + prevIn + '\n ' + currIn,textScaleFactor: 2,textDirection: TextDirection.rtl,
                      style: GoogleFonts.shareTechMono(
                        textStyle: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
                      )
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      ElevatedButton(onPressed: (){ setState(() {
                        insertDigit('1');
                      });}, child: Text('1')),
                      ElevatedButton(onPressed: (){ setState(() {
                        insertDigit('0');
                      });}, child: Text('0')),

                    ],),

                    Column(
                      children: [
                        ElevatedButton(onPressed: (){ setState(() {
                          onPlus();
                          shouldClear = true;
                        });}, child: Text('+'))
                        ,
                        ElevatedButton(onPressed: (){ setState(() {
                          onEquals();
                        });}, child: Text('='))
                      ],
                    ),

                    Column(
                      children: [
                        ElevatedButton(onPressed: (){ setState(() {
                          if (currIn.length>0)
                            currIn = currIn.substring(0,currIn.length-1);
                        });}, child: Text('C'),),
                        ElevatedButton(onPressed: (){ setState(() {
                          clearDisplay();
                        });}, child: Text('CA'))
                      ],
                    ),
                  ],
                ),
                Row()
              ],
            ),
            Column(children: [
              Container(
                  width:150,
                  height:400,
                  child: ListView.builder(
                    itemCount: historyList.length,
                    itemBuilder: (context,index){
                      return Card(
                          elevation: index==0?8:2,
                          color: index==0?Colors.white:Colors.white70,
                          child: ListTile(

                              title: Text(historyList[index].toString(),textAlign: TextAlign.right,textScaleFactor: 0.8,)
                          )
                      );
                    },
                  )
              )
            ],)

          ],
        )
    )
    );
  }
}

class HistoryElem{
  String op1;
  String op2;
  String res;
  HistoryElem(this.op1,this.op2,this.res);
  @override
  String toString(){
    return op1.padLeft(8,'0') + '\n+ ' + op2.padLeft(8,'0') + '\n' + '--------------------\n' + res.padLeft(8,'0');
  }
}