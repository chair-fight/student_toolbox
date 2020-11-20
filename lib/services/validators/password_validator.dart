class PasswordValidator {
  static String validate(String password) {
    if (password.length < 6)
      return "Please enter a password of at least 6 characters long";
    return null;
  }
}
