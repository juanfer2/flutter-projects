import 'package:flutter/material.dart';
import 'package:segment/src/widgets/card_widget.dart';
import 'package:segment/src/widgets/card_list_widget.dart';
import 'package:segment/src/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        elevation: 1,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Center(
              child: Text(
                'Segment list',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CarListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
