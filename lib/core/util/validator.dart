


class TValidator {
  static String mustWrite = 'is required';
  static const String tWrongEmail = 'Wrong Email';
  static const String tWrongConfirmedPassword = 'Wrong confirmed password';
  static const String tMustChoose = "Must Choose";
  static const String tPasswordTooShort = "Password must be at least 8 characters long";
  static const String tNationalIdTooShort = "National ID must be 10 characters long";
  static const String tPhoneTooShort = "Phone number must be at least 7 digits";

  static String? normalValidator(String? value, {String? hint, bool Function(String)? validate}) {
    bool showValidate = validate != null && value != null && validate(value);
    if (value == null || value.isEmpty) {
      return " $hint $mustWrite";
    } else if (showValidate) {
      return hint ?? 'Invalid value';
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidate({required String? value, required String comparePassword, required String? hint}) {
    if (value == null || value.isEmpty) {
      return "$hint $mustWrite";
    } else if (value != comparePassword) {
      return tWrongConfirmedPassword;
    }
    return null;
  }

  static String? email(String? value, String? hint) {
    if (value == null || value.isEmpty) {
      return "$hint $mustWrite";
    } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
      return tWrongEmail;
    }
    return null;
  }

  static String? dropDown(String? value, String? hint) {
    if (value == null || value.isEmpty) {
      return "$hint $tMustChoose";
    }
    return null;
  }

  static String? passwordValidate({required String? value, required String? hint}) {
    if (value == null || value.isEmpty) {
      return "$hint $mustWrite";
    } else if (value.length < 8) {
      return tPasswordTooShort;
    }
    return null;
  }

  static String? nationalId({required String? value, required String? hint}) {
    if (value == null || value.isEmpty) {
      return "$hint $mustWrite";
    } else if (value.length != 10) {
      return tNationalIdTooShort;
    }
    return null;
  }

  static String? phone({required String? value, required String? hint}) {
    if (value == null || value.isEmpty) {
      return "$hint $mustWrite";
    } else if (value.length < 7) {
      return tPhoneTooShort;
    }
    return null;
  }
}


