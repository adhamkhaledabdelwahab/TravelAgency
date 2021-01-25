import 'dart:io';
import 'Trip.dart';

/// This code made by Adham khaled 1/2021

class Common{
  int id;
  Common(this.id);
}

void AdminView(){
  print('*********************************************************');
  print('Travel Agency...');
  print('1.Add Trip');
  print('2.Edit Trip');
  print('3.Delete Trip');
  print('4.View Trips');
  print('5.Search Trip');
  print('6.Hidden');
  print('7.latest Trips');
  print('8.View Passengers');
  print('0.Leave Agency');
  print('*********************************************************');
}

void PassengerView(){
  print('*********************************************************');
  print('Hello to our Travel Agency...');
  print('Please, Enter one of the following choices number...');
  print('1.Hidden');
  print('2.Hidden');
  print('3.Hidden');
  print('4.View Trips');
  print('5.Search Trip');
  print('6.Reverse Trip');
  print('7.latest Trips');
  print('8.Hidden');
  print('0.Leave Agency');
  print('*********************************************************');
}

void tripData(){
  print('Select one of the following data set to edit.');
  print('1.Location');
  print('2.Date');
  print('3.Passenger Limit');
  print('4.Price');
  print('0.All');
}

Trip askForTrip(){
  Trip result;
  var done = 0;
  var location, passengerLimit, date, price;
  while(true){
    if(done == 0){
      stdout.write('Please add trip location: ');
      location = stdin.readLineSync();
      done++;
    }
    else if(done == 1){
      stdout.write('Please add trip passenger limit: ');
      passengerLimit = int.tryParse(stdin.readLineSync());
      if(passengerLimit == null){
        stdout.write('Please add trip passenger limit: ');
        passengerLimit = int.tryParse(stdin.readLineSync());
      }else{
        done++;
      }
    }
    else if(done == 2){
      stdout.write('Please add trip Date in (year-month-day) => (xxx-xx-xx)  format: ');
      date = DateTime.tryParse(stdin.readLineSync());
      if(date == null){
        stdout.write('Please add trip Date in (year-month-day) => (xxx-xx-xx) format: ');
        date = DateTime.tryParse(stdin.readLineSync());
      }else{
        done++;
      }
    }
    else if(done == 3){
      stdout.write('Please add trip price: ');
      price = num.tryParse(stdin.readLineSync());
      if(price == null){
        stdout.write('Please add trip price: ');
        price = num.tryParse(stdin.readLineSync());
      } else{
        done++;
      }
    }
    else if(done == 4){
      result = Trip(location, passengerLimit, date, price);
      break;
    }
  }
  return result;
}

List<Trip> setStartupData(){
  var a = Trip('Cairo/Egypt', 50, DateTime.parse('2021-03-27'), 2000);
  for(var i = 0; i < 50; i++) {
    a.addPassenger();
  }
  var b = Trip('Alex/Egypt', 100, DateTime.parse('2021-05-05'), 1000);
  for(var i = 0; i < 70; i++) {
    b.addPassenger();
  }
  var c = Trip('Rome/Italy', 200, DateTime.parse('2021-08-26'), 10000);
  for(var i = 0; i < 130; i++) {
    c.addPassenger();
  }
  var d = Trip('Paris/France', 250, DateTime.parse('2021-10-15'), 15000);
  for(var i = 0; i < 200; i++) {
    d.addPassenger();
  }
  var e = Trip('Tokyo/Japan', 280, DateTime.parse('2021-07-11'), 20000);
  for(var i = 0; i < 210; i++) {
    e.addPassenger();
  }
  return <Trip>[a,b,c,d,e];
}