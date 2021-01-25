import 'Passenger.dart';
import 'Trip.dart';

/// This code made by Adham khaled 1/2021

class TripAgency{
  List<Trip> myList = [];
  final int _password = 55555;

  int get password => _password;

  TripAgency(this.myList);

  Trip addTrip(Trip trip){
    var N = trip;
    myList.add(N);
    return N;
  }

  Trip editTrip(int position, [String location, int passengerLimit, DateTime date, int price]){
    if(position-1 >= 0 || position-1 < myList.length) {
      if(myList[position - 1].location != location && location.isNotEmpty) {
        myList[position - 1].location = location;
      }
      if(myList[position - 1].price != price && price != 0 && price != null) {
        myList[position - 1].price = price;
      }
      if(myList[position - 1].date != date && date != null) {
        myList[position - 1].date = date;
      }
      if(myList[position - 1].passengerLimit != passengerLimit &&
          passengerLimit != 0 && passengerLimit != null) {
        myList[position - 1].passengerLimit = passengerLimit;
      }
      return myList[position - 1];
    }
    return null;
  }

  Trip deleteTrip(int position){
    Trip N;
    if(position >= 0 || position < myList.length){
      N = myList[position-1];
      myList.removeAt(position-1);
      return N;
    }
    return null;
  }

  void viewTrips(){
    int position;
    print('Travel Agency incoming trips (ordered by date): ');
    var data = [];
    data.addAll(myList);
    data.sort((a,b) => a.date.compareTo(b.date));
    for(var i = 0; i < data.length; i++){
      position = myList.indexOf(data[i])+1;
      print('$position: To '+ data[i].location +
          ' with passengers limit ' + data[i].passengerLimit.toString() +
          ', price ' + data[i].price.toString() + ' and currently ' +
          data[i].passengers.toString() + ' passenger' + ' at ' + data[i].date.toString());
    }
  }

  void viewTrip(Trip input){
    print(myList.indexOf(input).toString() + ': To '+ input.location +
        ' with passengers limit ' + input.passengerLimit.toString() +
        ', price ' + input.price.toString() + ' and currently ' +
        input.passengers.toString() + ' passenger' + ' at ' + input.date.toString());
  }

  List<Trip> searchTrip(int price){
    var p = <Trip>[];
    if(price != null){
      myList.forEach((element) {
        if(element.price == price){
          p.add(element);
        }
      });
    }
    return p;
  }

  void latestTrips(){
    int position;
    print('Travel Agency latest 10 incoming trips: ');
    for(var i = 0; i < myList.length; i++){
      position = i+1;
      print('$position: To '+ myList[i].location +
          ' with passengers limit ' + myList[i].passengerLimit.toString() +
          ' and price ' + myList[i].price.toString() + ' with currently ' +
          myList[i].passengers.toString() + ' passenger' + ' at ' + myList[i].date.toString());
      if(i == 9) {
        break;
      }
    }
  }

  void viewPassengers(){
    var passengersAll = 0;
    myList.forEach((element) {
      passengersAll += element.passengers;
    });
    print('Travel Agency all trips passengers: $passengersAll');
    myList.forEach((element) {
      print('To ' + element.location + ' : ' + element.passengers.toString() + ' passengers');
    });
  }

  bool Reserve(Passenger p, int position){
    if(position != null && position - 1 >= 0 && position - 1 < myList.length
    && myList[position - 1].passengers < myList[position - 1].passengerLimit
    && !p.trips.contains(myList[position-1])){
      myList[position - 1].addPassenger();
      p.trips.add(myList[position - 1]);
      if(myList[position - 1].price > 10000){
        Discount(p, position);
      }
      return true;
    }
    return false;
  }

  void Discount(Passenger p, int position){
    num r = 10000 - ((20/100)*10000);
    print('Congratulation out Travel Agency provide you 20% discount on this trip'
        ' because its price is greater than 10000 L.E so the new price is '
        '$r L.E');
  }
}