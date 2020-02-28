import 'package:flutter/material.dart';

const double bottomContainerHeight = 80.0;
const Color defaultCardColor = Color(0xFF101427);
const Color bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Column(
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget> [
                Expanded(child:
                  ReusableCard(colorProp: defaultCardColor,),
                ),
                Expanded(child:
                  ReusableCard(colorProp: defaultCardColor,),
                ),
              ],
            )),
            Expanded(child:
              ReusableCard(colorProp: defaultCardColor,),
            ),
            Expanded(child: Row(
              children: <Widget> [
                Expanded(child:
                  ReusableCard(colorProp: defaultCardColor,),
                ),
                Expanded(child:
                  ReusableCard(colorProp: defaultCardColor,),
                ),
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colorProp});
  final Color colorProp;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(3.0, 10.0, 3.0, 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: colorProp,
      ),
    );
  }
}


