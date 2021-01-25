import 'Common.dart';
import 'Trip.dart';

/// This code made by Adham khaled 1/2021

class Passenger extends Common{
  static int _id = 0;
  String name;
  List<Trip> trips;
  Passenger(this.name, this.trips) : super(++_id);
}