import 'package:flutter/material.dart';

void main(){
  runApp(new MainApp());
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Friendly Chat App",
      home: new MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  @override
  State createState() => new ChatWidget();
}

class ChatWidget extends State<MainWidget>{
  final TextEditingController _isiPesan = new TextEditingController();

  Widget _KolomPesan(){
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _isiPesan,
                onSubmitted: _submitKlik,
                decoration: new InputDecoration.collapsed(
                    hintText: "Input pesan disini"
                ),
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _submitKlik(_isiPesan.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _submitKlik(String text){
    _isiPesan.clear();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat"),
      ),
      body: _KolomPesan(),
    );
  }
}