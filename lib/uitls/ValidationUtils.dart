class ValidationUtils {
  /// Validates email format using a more secure regex pattern
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;
    
    // Comprehensive email validation regex
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'
    );
    
    return emailRegex.hasMatch(email) && email.length <= 254;
  }

  /// Validates password strength
  static bool isValidPassword(String password) {
    if (password.isEmpty) return false;
    
    // Password must be at least 8 characters long
    // and contain at least one letter and one number
    if (password.length < 8) return false;
    
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    
    return hasLetter && hasNumber;
  }

  /// Gets password validation error message
  static String? getPasswordValidationError(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[a-zA-Z]').hasMatch(password)) {
      return 'Password must contain at least one letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  /// Gets email validation error message
  static String? getEmailValidationError(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Sanitizes input to prevent potential injection attacks
  static String sanitizeInput(String input) {
    return input.trim()
        .replaceAll(RegExp(r'[<>"\']'), '') // Remove potentially dangerous characters
        .replaceAll(RegExp(r'\s+'), ' '); // Normalize whitespace
  }
}