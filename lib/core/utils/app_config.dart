/// Utility class for managing application-wide configuration settings
class AppConfig {
  // App general settings
  static const String appName = 'PW App';
  static const String appVersion = '1.0.0';

  // API config
  static const String apiBaseUrl = 'https://api.example.com';
  static const int apiTimeoutSeconds = 30;

  // Feature flags
  static const bool enableDarkMode = true;
  static const bool enableAnalytics = true;
  static const bool enablePushNotifications = true;

  // Default settings
  static const String defaultLanguage = 'en';
  static const String defaultCountry = 'US';

  // Cache configuration
  static const int cacheExpirationMinutes = 60;
  static const int maxCacheSize = 100 * 1024 * 1024; // 100 MB
}
