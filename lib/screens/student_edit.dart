import 'package:flutter/material.dart';
import 'package:temel_widget2/models/students.dart';
import 'package:temel_widget2/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Students selectedStudent;
  StudentEdit(Students selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  Students selectedStudent;

  var student = Students.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentEditState(Students selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Student"),
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
      decoration: InputDecoration(
          labelText: "Name", hintText: selectedStudent.firstName),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Surname", hintText: selectedStudent.lastName),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Grade", hintText: selectedStudent.grade.toString()),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text("Update"),
          style: ElevatedButton.styleFrom(
              primary: Colors.amber, minimumSize: Size(100.0, 30.0)),
          onPressed: () {
            if (formKey.currentState.validate()) {
              selectedStudent.image =
                  Image.asset('assets/images/student_avatar.jpg');
              formKey.currentState.save();
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
