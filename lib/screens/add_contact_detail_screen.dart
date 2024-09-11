import 'package:contactlist/Model/contact_model.dart';
import 'package:contactlist/controller/add_contact_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactDetailScreen extends StatefulWidget {
  const AddContactDetailScreen({super.key});

  @override
  State<AddContactDetailScreen> createState() => _AddContactDetailScreenState();
}

class _AddContactDetailScreenState extends State<AddContactDetailScreen> {

  AddContactDetailController addContactDetailController = Get.put(AddContactDetailController());
  // GlobalKey formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addContactDetailController.name.clear();
    addContactDetailController.email.clear();
    addContactDetailController.number.clear();
    addContactDetailController.dob.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
      ),
      body: Form(
        key: addContactDetailController.formKey,
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: addContactDetailController.name,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "PLease Enter Name";
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("Name"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: addContactDetailController.email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("Email"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: addContactDetailController.number,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("Phone Number"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: true,
                  controller: addContactDetailController.dob,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("DOB")),
                onTap: () async{
                 final picked =  await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                  );
                 addContactDetailController.setSelectedDate(picked);

                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Center(
                            child: Text("Cancel"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // if(addContactDetailController.formKey.currentState!.validate()){
                        //
                        // }
                        addContactDetailController.contacts.add(ContactModel(name: addContactDetailController.name.text, email: addContactDetailController.email.text, number: addContactDetailController.number.text,dob: addContactDetailController.dob.text));
                        Navigator.pop(context);
                        // addContactDetailController.addContact();
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Center(
                            child: Text("Save",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
