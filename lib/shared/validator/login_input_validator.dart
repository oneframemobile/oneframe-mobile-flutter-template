class ValidatorHelper {
  static String emptyControl(String val) {
    if (val.length < 3) {
      return 'a minimum of 3 characters is required';
    } else
      return null;
  }
}
