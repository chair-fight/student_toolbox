class RepeatPasswordValidator {
  static String validate(String password, String repeated_password) {
    if (password.compareTo(repeated_password) != 0)
      return "The passwords don't match";
    return null;
  }
}
