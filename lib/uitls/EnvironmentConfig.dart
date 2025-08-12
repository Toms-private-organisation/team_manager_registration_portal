/// Environment configuration for the application
class EnvironmentConfig {
  static const String _defaultApiUrl = "https://api.olisport.app";
  
  /// Gets the API URL based on environment or defaults to production URL
  /// In a more complete implementation, this would read from environment variables
  /// or configuration files
  static String get apiUrl {
    // For Flutter web, you could read from environment variables like:
    // const String.fromEnvironment('API_URL', defaultValue: _defaultApiUrl)
    // For now, we'll use the secure default with potential for future configuration
    return _defaultApiUrl;
  }

  /// Validates that the API URL uses HTTPS
  static bool isSecureApiUrl(String url) {
    return url.startsWith('https://');
  }

  /// Gets the validated API URL, ensuring it uses HTTPS
  static String getSecureApiUrl() {
    String url = apiUrl;
    if (!isSecureApiUrl(url)) {
      throw Exception('API URL must use HTTPS for security. Current URL: $url');
    }
    return url;
  }
}