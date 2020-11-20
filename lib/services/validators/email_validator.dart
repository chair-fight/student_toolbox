class EmailValidator {
  static String validate(String email) {
    if (email.isEmpty) return "Please enter an email address";
    var acceptedFormat = RegExp(r".+@.+\..+");
    var matches = acceptedFormat.allMatches(email);
    if (matches.isEmpty || matches.length > 1)
      return "Please enter a valid email address";
    return null;
  }
}
