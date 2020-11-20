class NonEmptyValidator {
  static String validate(String input) {
    if (input == null || input.isEmpty) return "Field should not be empty";
    return null;
  }
}
