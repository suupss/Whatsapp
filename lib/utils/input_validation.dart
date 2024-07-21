mixin InputValidationMixin {
  String? validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please Enter your user name';
    }
    RegExp userNameRegEx =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (!userNameRegEx.hasMatch(value)) {
      return 'Please enter valid Username';
    }
    return null;
  }

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please Enter your email';
    }
    RegExp emailRegEX = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegEX.hasMatch(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Enter your password ';
    }
    RegExp passwordRegEX =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!passwordRegEX.hasMatch(value)) {
      return 'Enter valid password';
    }
    return null;
  }

  String? confirmPassword(value) {
    return null;
  }
}
