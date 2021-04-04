class ValidatorHelper {
  static String emptyControl(String val) {
    if (val.length < 3) {
      return 'Boş bırakılamaz.';
    } else
      return null;
  }
}
