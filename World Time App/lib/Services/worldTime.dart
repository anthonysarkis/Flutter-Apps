import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  // This type of constructor let us contruct by giving in parameters, as well as assigning the giving parameter values to the properties
  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async {
    try{
      // Make the API request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      
      // Get wanted properties from the data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      print(dateTime);
      print(offset);

      // Create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20  ? true : false;
    }
    catch (e) {
      print('caught error: $e');
      time = 'Could not get time data';
    }
  }

}
