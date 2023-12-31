import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suitmedia_test/modules/thirdscreens.dart';
import 'package:suitmedia_test/style/style.dart';

class SecondScreen extends StatefulWidget {
  static const routeName = '/secondscreens';
  final String name;
  SecondScreen({required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool choosen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:
            Text('Second Screen', style: Theme.of(context).textTheme.headline5),
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 79, 79, 214),
            size: 20,
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 29, right: 37, bottom: 32),
        child: MaterialButton(
          child: Text('Choose a user',
              style: Theme.of(context).textTheme.headline6),
          color: secondaryColor,
          height: 53,
          minWidth: MediaQuery.of(context).size.width,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: () {
            Navigator.pushNamed(context, ThirdScreen.routeName);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              choosen ? 'Selected User Name' : 'Selected User Name',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
