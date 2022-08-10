import 'package:flutter/material.dart';

class CarListWidget extends StatelessWidget {
  const CarListWidget({Key? key}) : super(key: key);

  onClick() {
    print('Click');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      child: ListTile(
        // ignore: prefer_const_constructors
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: const NetworkImage(
              'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
        ),
        title: const Text('ApiDev'),
        trailing: new MaterialButton(
          // ignore: avoid_print
          onPressed: () {},
          elevation: 5.0,
          color: Color(0xFF4CAF50),
          child: const Text(
            'Click',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
