import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:scouts_system/common%20UI/CustomContainerBody.dart';
import 'package:scouts_system/common%20UI/showTheTextMessage.dart';
import 'package:scouts_system/view%20model/seasonsGetDataFirestore.dart';
import 'package:scouts_system/view%20model/studentsGetDataFirestore.dart';
import 'package:scouts_system/common%20UI/CustomWidgetMethods.dart';

class StudentListInSeasonsPage extends StatelessWidget {
  StudentListInSeasonsPage();

  Widget build(BuildContext context) {
    List<dynamic> listOfStudentsInSeason =
        context
            .watch<SeasonsGetDataFirestore>()
            .seasonsListOfDataStudent;

    List<dynamic> listOfAllStudents =
        context
            .watch<StudentsGetDataFirestore>()
            .StudentsListOfData;

    List<int> IndexesOfStudentsData = [];

    for (int i = 0; i < listOfAllStudents.length; i++) {
      if (listOfStudentsInSeason.contains(listOfAllStudents[i]["docId"]))
        IndexesOfStudentsData.add(i);
    }
    return Scaffold(
        appBar: AppBar(backgroundColor: customColor()),
        body: listOfStudentsInSeason.length == 0
            ? buildShowMessage("student"):
        ListView.separated(
          itemCount: IndexesOfStudentsData.length,
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: buildTheItemOfTheList(
                  listOfAllStudents[IndexesOfStudentsData[index]],
                  index),
            );
          },
        ));
  }

  SafeArea buildTheItemOfTheList(var model, int index) {
    return SafeArea(
      child: InkWell(
        onTap: () async {},
        child: CustomContainerBody(model: model, index: index, text: "student"),
      ),
    );
  }
}