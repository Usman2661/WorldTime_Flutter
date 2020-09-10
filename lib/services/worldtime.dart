import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {

  String location; 
  String time;
  String flag; //Url to the flag img
  String url; //Location url
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});


  Future <void> getTime() async {
    
    try {
    //Make the request 
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
     

     //Get Properties from the data
     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(1,3);

     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset)));

     //Set the time
     isDayTime = now.hour > 6 && now.hour < 20  ? true : false;
     time = DateFormat.jm().format(now);
    }
    catch (e){
      print('Caught Error: $e');
      time = 'Could not get the time data';
    }
  
  }
}

