import 'package:contactlist/Model/contact_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllContactController extends GetxController{

  var contacts = <ContactModel>[].obs;
}