import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../helper/firebase_store.dart';
import '../../modals/notes.dart';
import '../../utils/routes.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool black = false;
    TextEditingController subtitlecontroller = TextEditingController();
    TextEditingController titelcontroller = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color(0xfffdcd45),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
        title: Text(
          "Note App",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
        ),
        backgroundColor: Color(0xfffdcd45),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: FireStoreHelper.fireStoreHelper.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              QuerySnapshot<Map<String, dynamic>>? snaps = snapshot.data;
              List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                  snaps?.docs ?? [];
              List<NotesModal> allNotes = data
                  .map(
                    (e) => NotesModal.fromMap(data: e.data()),
                  )
                  .toList();
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: allNotes.length,
                  itemBuilder: (context, index) {
                    NotesModal nots = allNotes[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (contex) {
                                    return AlertDialog(
                                        content: Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            FireStoreHelper.fireStoreHelper
                                                .delete(notesModal: nots);
                                          },
                                          icon: Icon(Icons.delete),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            FireStoreHelper.fireStoreHelper
                                                .edit(notesModal: nots);
                                          },
                                          icon: Icon(Icons.edit),
                                        )
                                      ],
                                    ));
                                  });
                            },
                            onTap: () {
                              Navigator.of(context).pushNamed(MyRoutes.detail);
                            },
                            child: Column(
                              children: [
                                // Container(
                                //     height: 40,
                                //     width: double.infinity,
                                //     color: Colors.black,
                                //     child: Text(
                                //       nots.id.toString(),
                                //       style: TextStyle(color: Colors.white),
                                //     )),
                                Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: Center(
                                      child: Text(
                                        nots.title,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                                Text(nots.subtitle),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
              // return ListView.builder(
              //     itemCount: allNotes.length,
              //     itemBuilder: (context, index) {
              //       NotesModal nots = allNotes[index];
              //       return
              //     });
            } else if (snapshot.hasError) {
              return Center(
                child: Text("ERROR: ${snapshot.error}"),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
              context: (context),
              builder: (context) {
                return AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () async {
                        String id =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        NotesModal notesModal = NotesModal(
                          int.parse(id),
                          subtitlecontroller.text,
                          titelcontroller.text,
                        );
                        await FireStoreHelper.fireStoreHelper
                            .addNotes(notesModal: notesModal);
                        Navigator.of(context).pop();
                      },
                      child: Text("Submit"),
                    ),
                  ],
                  content: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("data"),
                        TextFormField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 20),
                              hintText: 'Title'),
                          controller: subtitlecontroller,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 20),
                              hintText: 'Subtitle'),
                          controller: titelcontroller,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                DateTime? datePicker = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2026),
                                );
                                if (datePicker != null) {
                                  print(
                                      'Date Selected : ${datePicker.day} - ${datePicker.month} - ${datePicker.year}');
                                }
                              },
                              icon: Icon(Icons.date_range),
                            ),
                            IconButton(
                              onPressed: () async {
                                TimeOfDay? timedate = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  initialEntryMode: TimePickerEntryMode.input,
                                );
                                if (timedate != null) {
                                  print(
                                      'Date Selected : ${timedate.hour} - ${timedate.minute} ');
                                }
                              },
                              icon: Icon(Icons.timer),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
