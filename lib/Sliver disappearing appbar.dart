import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new HomePage(),
));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text("Sliver App Bar"),
            ),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index)=> new ListTile(
              title: new Text("List item $index"),
            ),
            ),
          )
        ],
      ),
    );
  }
}