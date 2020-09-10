import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; 
  String time;
  String flag; //Url to the flag img
  String url; //Location url

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
     time = now.toString();
    }
    catch (e){
      print('Caught Error: $e');
      time = 'Could not get the time data';
    }
  
  }
}

