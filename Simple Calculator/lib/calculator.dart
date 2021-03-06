import 'package:expression_language/expression_language.dart';
import 'package:flutter/material.dart';
class simpleCalculator extends StatefulWidget {
  @override
  _simpleCalculatorState createState() => _simpleCalculatorState();
}

// ignore: camel_case_types
class _simpleCalculatorState extends State<simpleCalculator> {
  String _displayText=" ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String signChange(String buttonText){
    if(_displayText[0]!="-"){
    _displayText="-"+_displayText;
    return(_displayText);}
    else{
       _displayText = _displayText.substring(1,);
    return(_displayText);
    }
  }

  String result(String buttonText){
    String expression=_displayText;
    expression=expression.replaceAll('÷', '/');
    expression=expression.replaceAll('x', '*');
    try{
      var expressionGrammarDefinition = ExpressionGrammarParser({});
      var parser = expressionGrammarDefinition.build();
      var result = parser.parse(expression);
      var expression1 = result.value as Expression;
      var value = expression1.evaluate();
      _displayText="$value";

      if(_displayText.endsWith('.0')){
        _displayText=_displayText.replaceAll(".0","");
      }
      if(_displayText.contains("e-")){
        _displayText=_displayText.replaceAll("e", " x 10^");
      }
    }
    catch(e){
      _displayText="Error";
    }
    return(_displayText);
  }

  String operator(String buttonText){
    _displayText=_displayText+buttonText;
    return(_displayText);
  }

  String operand(String buttonText){
    _displayText=_displayText+buttonText;
    return(_displayText);
  }

  String clearDisplay(String buttonText){
    _displayText="";
    return(_displayText);
  }

  String clearLastDigit(String buttonText){
    print("clearLastDigit is called");
    _displayText=_displayText.substring(0,_displayText.length-1);
    return(_displayText);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;


    Widget calcButton([String buttonText,Color color,Function fn,Function longPressFn]){
      return Container(
        color: color,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.0),
            side: BorderSide(color : Colors.black12)
          ),
          onPressed: (){_displayText = fn(buttonText);
          print("$_displayText");
          setState(() {});},
          onLongPress: (){_displayText=longPressFn(buttonText);
          setState(() {});},
          child: Text(buttonText,style: TextStyle(color: Colors.white,fontSize: 24),),
          // padding: EdgeInsets.all(30),
        ),
      );
    }
    List buttons =[
      [calcButton("C",Colors.black54,clearLastDigit,clearDisplay),calcButton("+/-",Colors.black54,signChange),calcButton("%",Colors.black54,operator),calcButton("÷",Colors.orangeAccent,operator)],
      [calcButton("7",Colors.black45,operand),calcButton("8",Colors.black45,operand),calcButton("9",Colors.black45,operand),calcButton("x",Colors.orangeAccent,operator)],
      [calcButton("4",Colors.black45,operand),calcButton("5",Colors.black45,operand),calcButton("6",Colors.black45,operand),calcButton("-",Colors.orangeAccent,operator)],
      [calcButton("1",Colors.black45,operand),calcButton("2",Colors.black45,operand),calcButton("3",Colors.black45,operand),calcButton("+",Colors.orangeAccent,operator)],
      [calcButton("0",Colors.black45,operand),calcButton(".",Colors.black45,operand),calcButton("=",Colors.orangeAccent,result)]];
    // ignore: non_constant_identifier_names

    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator by AHSAN"),),
      body: SafeArea(
        child:Container(
            height: deviceSize.height,
        width: deviceSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Expanded(
              // flex: 2,
            child: Container(
              width: deviceSize.width,
              height:deviceSize.height/6.9,
              color: Colors.black54,
              alignment: Alignment.bottomRight,
              child:  SingleChildScrollView(child: Text(_displayText,style: TextStyle(fontSize: 48,) )),
            ),
          ),

                        Expanded(
                           child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                  Expanded(child: buttons[0][0]),
                                  Expanded(child: buttons[0][1]),
                                  Expanded(child: buttons[0][2]),
                                  Expanded(child: buttons[0][3]),
          ],
        ),
                   ),
                        Expanded(
                          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                            Expanded(child: buttons[1][0]),
                            Expanded(child: buttons[1][1]),
                            Expanded(child: buttons[1][2]),
                            Expanded(child: buttons[1][3]),
                  ],
                )
                        ),
                        Expanded(
                          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                            Expanded(child: buttons[2][0]),
                            Expanded(child: buttons[2][1]),
                            Expanded(child: buttons[2][2]),
                            Expanded(child: buttons[2][3]),
              ],
              )
                        ),
                        Expanded(
                          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            Expanded(child: buttons[3][0]),
                            Expanded(child: buttons[3][1]),
                            Expanded(child: buttons[3][2]),
                            Expanded(child: buttons[3][3]),
              ],
              )
                        ),
                        Expanded(
                            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                              Expanded(flex:2,child: buttons[4][0]),
                              Expanded(child: buttons[4][1]),
                              Expanded(child: buttons[4][2]),
                                ]
                            ),
                        ),
            ]
          )
        )
      )
    );
  }
}
