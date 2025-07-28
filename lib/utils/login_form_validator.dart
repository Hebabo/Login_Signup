class LogInValidator {
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  static Map<String, String> validateLogInFields({
    required String password,
  }) {
    final errors = <String, String>{};
    if (password.isEmpty) {
      errors['password'] = 'Password is required';
    }
    return errors;
  }
}