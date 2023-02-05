import 'package:flutter/material.dart';

class ParsingClass{

  bool contactInfoFilled= false;
  bool itemsInfoFilled = false;

  List<Map> itemsInfo = [];
  List<Map> contactInfo = [];

  updateContactInfo(String input){
    List temp = input.split(' ');
    List markupWords = ['party','broker','transport'];
    int current = 0;
    String tempValue = '';
    contactInfo = [];
    for(int i=0;i<temp.length;i++){
      if(markupWords[current]==temp[i].toString().toLowerCase() || 'dalal'==temp[i].toString().toLowerCase()){
        contactInfo.add({markupWords[current]:tempValue});
        tempValue = '';
        current = current + 1;
      }
      else{
        tempValue = tempValue+' '+temp[i];
      }
    }
    toggleContactInfo();
    print(contactInfo);
  }

  updateItemInfo(String input){}

  toggleItemsInfo(){itemsInfoFilled = true;}

  toggleContactInfo(){contactInfoFilled = true;}

  ParsingClass({required this.contactInfoFilled,
    required this.itemsInfoFilled});
}