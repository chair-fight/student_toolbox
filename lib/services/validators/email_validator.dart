class EmailValidator {
  static String validate(String email) {
    if (email.isEmpty) return "Email address cannot be empty";
    var acceptedFormat = RegExp(r".+@.+\..+");
    var matches = acceptedFormat.allMatches(email);
    if (matches.isEmpty || matches.length > 1) return "Email address is invalid";
    return null;
  }
}
