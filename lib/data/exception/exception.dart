class SignUpWithEmailAndPasswordFailure implements Exception {
  /// The associated error message.
  final String message;

  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure(
      [this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exists for that email.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

class LogInWithEmailAndPasswordFailure implements Exception {
  /// The associated error message.
  final String message;

  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure(
      [this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
            'Email is not found, please create an account.');
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
            'Incorrect password, please try again.');
      case 'invalid-credential':
        return const LogInWithEmailAndPasswordFailure('User not found!');
      default:
        return LogInWithEmailAndPasswordFailure(code);
    }
  }
}
