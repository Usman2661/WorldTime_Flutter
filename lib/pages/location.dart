import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  void getData() async {
    //Simulate a network request for a username
    String username = await Future.delayed(Duration(seconds: 3), (){
        return 'Usman';
    });

    String bio = await Future.delayed(Duration(seconds: 2), (){
        return 'footballer and Programmer';
    });
    print('$username - $bio');
  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
    print('Hey There');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
        setState(() {
          counter +=1;
        });
      },
      child: Text('Counter is $counter'),)
    );
  }
}