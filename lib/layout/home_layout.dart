import 'package:flutter/material.dart';
import 'package:to_do_app_route/screens/settings/settings_tab.dart';
import 'package:to_do_app_route/screens/tasks/add_task_bottom_sheet.dart';
import 'package:to_do_app_route/screens/tasks/tasks_tab.dart';
import 'package:to_do_app_route/shared/styles/colors.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> tabs = [TasksTap(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: mintGreen,
        appBar: AppBar(
          backgroundColor: primary,
          title: const Text(
            'ToDo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Colors.white, width: 4),
          ),
          onPressed: () {
            showAddTaskBottomSheet();
          },
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            iconSize: 40,
            elevation: 0,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
          ),
        ),
        body: tabs[index],
      ),
    );
  }

  showAddTaskBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskBottomSheet(),
        );
      },
    );
  }
}
