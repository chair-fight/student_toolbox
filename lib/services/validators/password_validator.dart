class PasswordValidator {
  static String validate(String password) {
    if (password.length == 0) return "Password cannot be empty";
    if (password.length < 6) return "Password must have at least 6 characters";
    return null;
  }
}
