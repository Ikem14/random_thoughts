import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'search_bar.dart';

class SearchTab extends StatefulWidget {

  @override
  _SearchTabState createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      // do something
    });
  }

  Widget _constructSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('🔍 Search your 💬'),
        ),
        SliverSafeArea(  // BEGINNING OF NEW CONTENT
          top: true,
          minimum: const EdgeInsets.only(top: 8),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate( (context, index) {
              if (index < 1) {
                return DecoratedBox(
                  decoration: const BoxDecoration(),
                  child: SafeArea(
                    child: Column(
                      children: [
                        _constructSearchBox(),
                      ],
                    ),
                  ),
                );
              }
              return null;
            })
          )
        )
      ],
    );
  }
}