import 'dart:convert';
import 'dart:math';

import 'package:contactlist/Model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddContactDetailController extends GetxController{


  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController dob = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  var selectedDate  = DateTime.now().obs;

  var id = Random();
  var contacts = <ContactModel>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void setSelectedDate(DateTime? date) {
    selectedDate.value = date ?? DateTime.now();
  }
  addContact(){
    contacts.add(ContactModel(id: id.nextInt(1000),number: number.text,name: name.text,email: email.text, dob: dob.text));
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name.clear();
    email.clear();
    number.clear();
    dob.clear();
  }



}