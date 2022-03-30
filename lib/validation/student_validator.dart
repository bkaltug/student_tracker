class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "Name can't be shorter than two letters!";
    }
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "Surame can't be shorter than two letters!";
    }
  }

  String validateGrade(String value) {
    if (int.parse(value) < 0 || int.parse(value) > 100) {
      return "Grade must be between 0 - 100!";
    }
  }
}
