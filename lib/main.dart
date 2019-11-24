import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returning Data',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(child: SelectionButton())
    );
  }
}

class SelectionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        _navigationAndDisplaySection(context);
      },
      child: Text("hoge"),
    );
  }

  _navigationAndDisplaySection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen())
    );
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick up'),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: (){
              Navigator.pop(context, "yep");
            },
            child: Text('yep')
          ,)
          ,),
          Padding(padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: (){
              Navigator.pop(context, "nope");
            },
              child: Text('Nope')
            ,)
          ,)
        ],
      ),),
    );
  }
}