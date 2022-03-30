import 'package:flutter/material.dart';

class Students {
  int id;
  String key;
  String firstName;
  String lastName;
  String gradeText;
  int grade = 0;
  Image image;

  Students.withId(int id, String firstname, String lastName, int grade,
      [Image image]) {
    this.id = id;
    this.firstName = firstname;
    this.lastName = lastName;
    this.grade = grade;
    this.image = image;
  }

  Students.withKey(
      String key, String firstname, String lastName, String gradeText,
      [Image image]) {
    this.firstName = firstname;
    this.lastName = lastName;
    this.gradeText = gradeText;
    this.image = image;
    this.key = key;
  }

  Students(String firstname, String lastName, int grade, [Image image]) {
    this.firstName = firstname;
    this.lastName = lastName;
    this.grade = grade;
    this.image = image;
  }

  Students.withoutInfo();

  String get getStatus {
    String resultMessage = "";
    if (this.grade >= 55) {
      resultMessage = "Passed";
    } else if (this.grade >= 45 && this.grade < 55) {
      resultMessage = "Repeat";
    } else if (this.gradeText == "Grade") {
      resultMessage = "Status";
    } else {
      resultMessage = "Failed";
    }
    return resultMessage;
  }
}
