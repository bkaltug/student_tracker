import 'package:flutter/material.dart';
import 'package:temel_widget2/models/students.dart';
import 'package:temel_widget2/screens/student_edit.dart';
import 'student_add.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State {
  String title = "Student Tracker";
  String resultMessage = "";
  Students selectedStudent = Students.withId(
      0, "", "", 0, Image.asset('assets/images/student_avatar.jpg'));

  List<Students> students = [
    Students.withKey("example", "Name", "Surname", "Grade",
        Image.asset('assets/images/student_avatar.jpg')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.cyan[700],
      ),
      body: buildBody(context),
    );
  }

  /*String showMessage(int grade) {
    if (grade >= 55) {
      resultMessage = "Passed!";
    } else if (grade >= 45 && grade < 55) {
      resultMessage = "Büte kaldı!";
    } else {
      resultMessage = "Failed!";
    }
    return resultMessage;
  }*/

  void showAlert(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text("Deleted"),
      content: Text(message),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        "lib/assets/images/student_avatar.jpg",
                      ),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("The grade: " +
                        students[index].grade.toString() +
                        " " +
                        "[" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      /* resultMessage = showMessage(students[index].grade);
                      showAlert(context, resultMessage);*/
                    },
                  );
                })),
        Text("Selected Student: " +
            selectedStudent.firstName +
            " " +
            selectedStudent.lastName),
        Row(children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: ElevatedButton(
              child: Row(
                children: [
                  SizedBox(width: 10.0),
                  Text("Add"),
                  SizedBox(width: 0.25),
                  Icon(Icons.add_outlined),
                ],
              ),
              onPressed: () {
                selectedStudent.firstName = "";
                selectedStudent.lastName = "";
                if (students.length > 0) {
                  if (students[0].key == "example") {
                    students.remove(students[0]);
                  }
                }

                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)))
                    .then((value) => setState(() {}));
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 4,
            child: ElevatedButton(
              child: Row(
                children: [
                  SizedBox(width: 20.0),
                  Text("Update"),
                  SizedBox(width: 5.0),
                  Icon(Icons.loop),
                ],
              ),
              onPressed: () {
                if (selectedStudent.firstName != "") {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StudentEdit(selectedStudent)))
                      .then((value) => setState(() {}));
                }
              },
              style: ElevatedButton.styleFrom(primary: Colors.yellow[700]),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 4,
            child: ElevatedButton(
              child: Row(
                children: [
                  SizedBox(width: 20.0),
                  Text("Delete"),
                  SizedBox(width: 5.0),
                  Icon(Icons.delete),
                ],
              ),
              onPressed: () {
                setState(() {
                  if (selectedStudent.firstName != "") {
                    showAlert(
                        context,
                        selectedStudent.firstName +
                            " " +
                            selectedStudent.lastName +
                            " is deleted from the list.");
                  }
                  students.remove(selectedStudent);
                  selectedStudent.firstName = "";
                  selectedStudent.lastName = "";
                });
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ),
        ]),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 55) {
      return Icon(Icons.done);
    } else if (grade >= 45 && grade < 55) {
      return Icon(Icons.loop);
    } else {
      return Icon(Icons.clear);
    }
  }
}
