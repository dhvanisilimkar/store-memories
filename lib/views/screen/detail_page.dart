import 'package:flutter/material.dart';

import '../../helper/firebase_store.dart';
import '../../modals/notes.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController subtitle = TextEditingController();
    TextEditingController subtitlecontroller = TextEditingController();
    TextEditingController titelcontroller = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Center(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                NotesModal notesModal = NotesModal(
                  int.parse(id),
                  subtitlecontroller.text,
                  titelcontroller.text,
                );
                await FireStoreHelper.fireStoreHelper
                    .addNotes(notesModal: notesModal);
                Navigator.of(context).pop();
              },
              child: Icon(Icons.add),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("data"),
                TextFormField(
                  controller: subtitlecontroller,
                ),
                TextFormField(
                  controller: titelcontroller,
                ),
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
    ));
  }
}
