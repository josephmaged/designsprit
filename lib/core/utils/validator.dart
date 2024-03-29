class Validator {
  static String? validateEmail(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 6 characters.';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a name.';
    } else {
      return null;
    }
  }

  static String? validateNumber(String value) {
    String pattern = r'^0\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a number.';
    } else {
      return null;
    }
  }

  static String? validateNineNumber(String value) {
    String pattern = r'^[0-9]{8}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter valid number.';
    } else {
      return null;
    }
  }

  // static String? validateOnlyNumber(String value) {
  //   String pattern = r'^([0-9]{1}|[0-9]{2})$';
  //   RegExp regex = new RegExp(pattern);
  //   if (!regex.hasMatch(value))
  //     return 'Please enter valid number.';
  //   else
  //     return null;
  // }

  static String? validateEmpty(String value) {
    if (value.isEmpty) {
      return 'Please enter data';
    } else {
      return null;
    }
  }
}
