import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add new Task',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Enter your task',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffA9A9A9),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter Task Description',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffA9A9A9),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select time',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: InkWell(
              onTap: () {
                selectTime();
              },
              child: Text(
                selectedTime.toString().substring(0, 10),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffA9A9A9),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add Task',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }

  selectTime() async {
    DateTime? chosenTime = await showDatePicker(
        context: context,
        initialDate: selectedTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if(chosenTime==null){
      return;
    }
    selectedTime = chosenTime;
    setState(() {});
  }
}
