import 'Common.dart';

/// This code made by Adham khaled 1/2021

class Trip extends Common{
  static int _id = 0;
  int passengers = 0;
  String location;
  int passengerLimit;
  DateTime date;
  num price;

  Trip(this.location, this.passengerLimit, this.date, this.price) : super(++_id);

  void addPassenger() {
    passengers++;
  }

  void removePassenger() {
    passengers--;
  }
}