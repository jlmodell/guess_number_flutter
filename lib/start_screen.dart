import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterState());
  }
}

class CounterState extends StatefulWidget {
  @override
  Counter createState() => Counter();
}

class Counter extends State<CounterState> {
  int _count = 0;

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter Example"),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("# of Clicks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            Text("$_count", style: TextStyle(fontSize: 36)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text("Add"),
                  color: Colors.teal,
                  onPressed: () => setState(() => _count += 1),
                ),
                RaisedButton(
                  child: Text("Minus"),
                  color: Colors.pink,
                  onPressed: () => setState(() => _count -= 1),
                ),
              ],
            ),
          ],
        ));
  }
}
