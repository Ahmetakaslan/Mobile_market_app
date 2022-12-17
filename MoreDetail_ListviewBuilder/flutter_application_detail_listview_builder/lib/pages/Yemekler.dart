import 'dart:math';

import 'package:flutter/material.dart';

class Yemekler {
  Yemekler(int id ,String name,String image,double price,[String? explain]){
    this.id=id;
    this.name=name;
    this.image=image;
    this.price=price;
   if(explain==null){
    explain="";
   }else{
    this.explain=explain;
   }
    }
  late int id;
  late String name;
  late double price;
  late String image;
  String? explain="";
  
}

