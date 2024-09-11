import 'package:contactlist/controller/add_contact_detail_controller.dart';
import 'package:contactlist/screens/add_contact_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllContactListsScreen extends StatefulWidget {
  const AllContactListsScreen({super.key});

  @override
  State<AllContactListsScreen> createState() => _AllContactListsScreenState();
}

class _AllContactListsScreenState extends State<AllContactListsScreen> {
  AddContactDetailController addContactDetailController =
      Get.put(AddContactDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact List")),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (addContactDetailController.contacts.isEmpty) {
                  return Center(child: Text("No Contacts"));
                }
                return ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: addContactDetailController.contacts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(addContactDetailController
                            .contacts[index].name
                            .toString()),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(addContactDetailController
                                .contacts[index].email
                                .toString()),
                            Text(addContactDetailController
                                .contacts[index].number
                                .toString()),
                            Text(addContactDetailController
                                .contacts[index].dob
                                .toString()),
                          ],
                        ),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(child: Text("Edit")),
                              PopupMenuItem(child: Text("delete"),onTap: () {
                                addContactDetailController
                                    .contacts.removeAt(index);
                              },)
                            ];
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(side: BorderSide.none),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddContactDetailScreen(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
