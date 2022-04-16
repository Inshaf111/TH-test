class TextFieldValidator {
  validatePassword(password) {
    if (password.isEmpty) {
      return "Please enter your password.";
    } else {
      return null;
    }
  }

  validateEmail(email) {
    if (email.isEmpty) {
      return "Please enter a valid email-id";
    }
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
    if (emailValid) {
      return null;
    } else {
      return "Please enter a valid email-id";
    }
  }
}
