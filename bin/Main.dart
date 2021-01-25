
import 'dart:io';
import 'Common.dart';
import 'Passenger.dart';
import 'TripAgency.dart';

/// Admin password is 55555
/// This code made by Adham khaled 1/2021

void main(List<String> arguments) {

  var actions = TripAgency(setStartupData());
  var P = Passenger('Adham', []);
  
  print('*********************************************************');
  print('Hello visitor, please select on of the following choices number...');
  print('1.Passenger');
  print('2.Admin');
  print('0.Leave Agency');
  print('*********************************************************');
  stdout.write('Your choice: ');
  String state;
  int stateNum;
  state = 'none';
  stateNum = int.tryParse(stdin.readLineSync());
  while(true){
    if (stateNum == null) {
      print('Invalid input, please enter one of the listed integers!');
      stdout.write('Your choice: ');
      stateNum = int.tryParse(stdin.readLineSync());
    } else {
      if (stateNum == 1) {
        state = 'Passenger';
        PassengerView();
        break;
      } else if (stateNum == 2) {
        stdout.write('pass: ');
        var id = int.tryParse(stdin.readLineSync());
        if(id != null && id == actions.password) {
          state = 'Admin';
          AdminView();
        }else{
          print('There is no admin with such id!!!');
        }
        break;
      } else if (stateNum == 0) {
        state = 'none';
        break;
      } else {
        print("The number you have chosen doesn't exist please try again with a valid integer! ");
        stdout.write('Your choice: ');
        stateNum = int.tryParse(stdin.readLineSync());
      }
    }
  }
  //***************************************************************************
  if(state != 'none'){
    stdout.write('Your choice: ');
    int num;
    String answer;
    num = int.tryParse(stdin.readLineSync());
    while (true) {
      if (num == null) {
        print('Invalid input, please try again with correct choice!');
        stdout.write('Your choice: ');
        num = int.tryParse(stdin.readLineSync());
      } else {
        switch (num) {
          case 1:
            if (state == 'Admin') {
              actions.addTrip(askForTrip());
            } else if (state == 'Passenger') {
              print('Our apologize, This option is only available for admins');
            }
            break;
          case 2:
            if (state == 'Admin') {
              actions.viewTrips();
              stdout.write('Please choose trip number that you want to edit: ');
              var pos = int.tryParse(stdin.readLineSync());
              print('Now, please add the new values for the desired field,\n'
                  'in the form of (location, passenger Limit, Date(year-month-day), Price).');
              print('Note: field that is no desired keep it empty');
              stdout.write('Data: ');
              var data = stdin.readLineSync().
              replaceAll('(', '').
              replaceAll(')', '').
              split(',');
              if(data.length == 4) {
                var result = actions.editTrip(pos,
                    data[0],
                    int.tryParse(data[1]),
                    DateTime.tryParse(data[2]),
                    int.tryParse(data[3]));
                if(result != null){
                  stdout.write('The edited trip: ');
                  actions.viewTrip(result);
                }else{
                  print('Oops some this went wrong, please try again with valid data');
                }
              }else{
                print('invalid edit data, please try again');
              }
            } else if (state == 'Passenger') {
              print('Our apologize, This option is only available for admins');
            }
            break;
          case 3:
            if (state == 'Admin') {
              actions.viewTrips();
              stdout.write('Please choose trip number that you want to delete: ');
              var pos = int.tryParse(stdin.readLineSync());
              stdout.write('Deleted Trip: ');
              actions.viewTrip(actions.deleteTrip(pos));
            } else if (state == 'Passenger') {
              print('Our apologize, This option is only available for admins');
            }
            break;
          case 4:
              actions.viewTrips();
              break;
          case 5:
            print('Please enter price of the desired trip.');
            stdout.write('Search: ');
            var data = int.tryParse(stdin.readLineSync());
            var l = actions.searchTrip(data);
            if(l.isEmpty){
              print('There is no trip with the given price!');
            }else {
              print('Resulted Date: ');
              l.forEach((element) {
                actions.viewTrip(element);
              });
            }
            break;
          case 6:
            if (state == 'Admin') {
              print('Our apologize, This option is only available for passengers');
            } else if (state == 'Passenger') {
              actions.viewTrips();
              stdout.write('Please select the desired trip number: ');
              var pos = int.tryParse(stdin.readLineSync());
              if(pos != null && pos >= 1 && pos < actions.myList.length){
                actions.Reserve(P, pos) ? print(
                    'Congratulations you have successfully reserved in this trip.') : print(
                    "Our apologize you didn't reserved, either you are already reserved before"
                        ' or trip has already reached its passenger limit');
              }else{
                print('Invalid trip position, please try again with a valid number');
              }
            }
            break;
          case 7:
            actions.latestTrips();
            break;
          case 8:
            if (state == 'Admin') {
              actions.viewPassengers();
            } else if (state == 'Passenger') {
              print('Our apologize, This option is only available for admins');
            }
            break;
          case 0:
            print(
                'Thanks you for using our Travel Agency, we hope that you are satisfied...');
            print('*********************************************************');
            break;
          default:
            print('The number you have chosen is not correct or not listed!');
            stdout.write('Your choice: ');
            num = int.tryParse(stdin.readLineSync());
            continue;
        }
        if (num == 0) {
          break;
        }
        print('*********************************************************');
        stdout.write(
            "If you want to have another choice enter Y or any other letter if you don't: ");
        answer = stdin.readLineSync();
        if (answer == 'y' || answer == 'Y') {
          if(state == 'Passenger'){
            PassengerView();
          }else{
            AdminView();
          }
          stdout.write('Your choice: ');
          num = int.tryParse(stdin.readLineSync());
        } else {
          print(
              'Thanks you for using our Travel Agency, we hope that you are satisfied...');
          print('*********************************************************');
          break;
        }
      }
    }
  }
  else{
    print('Thanks you for using our Travel Agency, we hope that you are satisfied...');
    print('*********************************************************');
  }
}
