import 'dart:math';

import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  
  List<int> drawnNumbers = [];
  List<int> listNumbers = List.generate(60, (index) => index + 1);
  List<int> listDrawnNumbers = List.generate(20, (index) => index + 1);
  int selectDrawnNumbers = 15;
  int selectListNumbers = 25;
  int numbers = 15;

  HomeController() {
    raffle();
  }  
  
  setDrawnNumbers(int value) {
    selectDrawnNumbers = value;
    notifyListeners();
  }

  setListNumbers(int value) {
    selectListNumbers = value;
    notifyListeners();
  }

  raffle() {   
    drawnNumbers = [];
    int evenNumber = 0;
    int oddNumber = 0;
    int minNumber = 1;
    int maxNumber = selectListNumbers;  

    while(drawnNumbers.length < selectDrawnNumbers || evenNumber <= oddNumber + 2) {
      int drawnNumber = Random().nextInt(maxNumber - minNumber + 1) + minNumber; 
      
      if (!drawnNumbers.contains(drawnNumber)) {
        if(drawnNumbers.length == selectDrawnNumbers) {
          break;
        } else {
          drawnNumbers.add(drawnNumber);
        }

        if (drawnNumber % 2 == 0) {
          evenNumber++;
        } else {
          oddNumber++;
        }  
      }
    } 
    
    drawnNumbers.sort((a, b) => a.compareTo(b));
    notifyListeners();
  } 
   
} 