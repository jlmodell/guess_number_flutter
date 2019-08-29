import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Start());
  }
}

class Start extends StatefulWidget {
  StartScreen createState() => StartScreen();
}

class StartScreen extends State<Start> {
  int number;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess My Number v0.0.1",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let's Get Started",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                )),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60.0),
              child: TextFormField(
                  maxLength: 2,
                  maxLengthEnforced: true,
                  autovalidate: true,
                  decoration: InputDecoration(labelText: "Number (1-99)"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  validator: (input) {
                    final numOnly = int.tryParse(input);
                    return (numOnly == null) || (numOnly > 99) || (numOnly <= 0)
                        ? "Choose a NUMBER from 1-99"
                        : null;
                  },
                  onSaved: (input) =>
                      setState(() => number = int.parse(input))),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              RaisedButton(
                  child: Text("Confirm"),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(number);
                    }
                    return null;
                  },
                  color: Colors.teal),
              RaisedButton(
                  child: Text("Reset"), onPressed: () {}, color: Colors.pink),
            ]),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            displayNumber(),
          ],
        ),
      ),
    );
  }

  Widget displayNumber() {
    return number != null ? Text("$number") : Text("");
  }
}
