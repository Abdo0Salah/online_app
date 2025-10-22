class ValidatorsUtils {
  ValidatorsUtils._();
  static String? validateEmail(String? text) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (text == null || text.trim().isEmpty ) {
      return 'This Field is Required';
    } else if (emailRegex.hasMatch(text) == false) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? text) {
    if (text == null) {
      return 'This Field is Required';
    } else if (int.tryParse(text.trim()) == null) {
      return 'Enter Numbers Only';
    } else if (text.trim().length != 11) {
      return 'Enter Value Must Equal 11 Digit';
    } else {
      return null;
    }
  }
  static String? validatePassword(String? text) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (text == null || text.isEmpty) {
      return 'This Field is Required';
    } else if (text.length < 8 || !passwordRegex.hasMatch(text) ) {
      return 'Strong Password Please';
    } else {
      return null;
    }
  }
  static String? validateConfirmPassword(String? text, {required String? password}) {
    if (text == null || text.isEmpty) {
      return 'This Field is Required';
    } else if (text != password) {
      return 'Not Same Password';
    } else {
      return null;
    }
  }
  static String? validateUserName(String? text) {
    RegExp userNameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (text == null || text.isEmpty) {
      return 'This Field is Required';
    } else if (!userNameRegex.hasMatch(text)) {
      return 'Enter Valid UserName';
    } else {
      return null;
    }
  }
  static String? validateFullName(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'This Field is Required';
    } else {
      return null;
    }
  }
  static String? validateLoginPassword(String? text) {
    if (text == null || text.isEmpty) {
      return 'This Field is Required';
    }  else {
      return null;
    }
  }

}
