import 'package:flutter/material.dart';
import 'package:temel_widget2/models/students.dart';
import 'package:temel_widget2/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Students> students;
  StudentAdd(List<Students> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Students> students;

  var student = Students.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Students> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildGradeField(),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Name", hintText: "Elon"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Surname", hintText: "Musk"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Grade", hintText: "45"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.amber),
        onPressed: () {
          if (formKey.currentState.validate()) {
            student.image = Image.asset('assets/images/student_avatar.jpg');
            formKey.currentState.save();
            students.add(student);
            Navigator.pop(context);
          }
        },
        child: Row(
          children: [
            Text("Save"),
          ],
        ));
  }
}
