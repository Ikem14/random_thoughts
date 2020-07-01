import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPrefilledText extends StatefulWidget {
  @override
  _MyPrefilledTextState createState() => _MyPrefilledTextState();

  
  String getThoughts() {
    String textToSend = _MyPrefilledTextState()._textController.text;
    return textToSend;
  }
}

class _MyPrefilledTextState extends State<MyPrefilledText> {
  TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    // _textController = TextEditingController(text: 'Start writing down your random thoughts');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _textController,
      placeholder: 'Start writing down your random thoughts',
      padding: EdgeInsets.all(16.0),
      expands: true,
      autofocus: true,
      maxLines: null,
    );
  }
}

class ThoughtsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Thoughts 💬'),
        ),
        SliverSafeArea(  // BEGINNING OF NEW CONTENT
          top: false,
          minimum: const EdgeInsets.only(top: 8),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate( (context, index) {
              if (index < 1) {
                return MyPrefilledText();
              }
              return null;
            })
          )
        )
      ],
    );
  }
}