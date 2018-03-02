import 'package:flutter/material.dart';

void main(){
  runApp(new MainApp());
}

const String _name = "MasbOssun";

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
  final List<MessageWidget> _pesan = <MessageWidget>[];
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
      MessageWidget pesan = new MessageWidget(
        text: text,
      );
      setState(() {
        _pesan.insert(0, pesan);
      });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat"),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _pesan[index],
                itemCount: _pesan.length,
              ),
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor),
            child: _KolomPesan(),
          )
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  MessageWidget({this.text});
  final String text;
  @override
  Widget build(BuildContext context){
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead,),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}
