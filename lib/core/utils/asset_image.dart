/// Utility class for managing asset images in the application
class AssetImage {
  // Base paths
  static const String _imagePath = 'assets/images';
  static const String _iconPath = 'assets/icons';
  static const String _logoPath = 'assets/logos';

  // Logo assets
  static const String logoLight = '$_logoPath/logo_light.png';
  static const String logoDark = '$_logoPath/logo_dark.png';
  static const String logoIcon = '$_logoPath/logo_icon.png';

  // Status icons
  static const String iconOrdered = '$_iconPath/status_ordered.svg';
  static const String iconAccepted = '$_iconPath/status_accepted.svg';
  static const String iconReady = '$_iconPath/status_ready.svg';
  static const String iconServed = '$_iconPath/status_served.svg';

  // Common icons
  static const String iconAdd = '$_iconPath/add.svg';
  static const String iconDelete = '$_iconPath/delete.svg';
  static const String iconEdit = '$_iconPath/edit.svg';
  static const String iconSearch = '$_iconPath/search.svg';
  static const String iconSettings = '$_iconPath/settings.svg';
  static const String iconNotification = '$_iconPath/notification.svg';
  static const String iconBack = '$_iconPath/back.svg';
  static const String iconMenu = '$_iconPath/menu.svg';
  static const String iconClose = '$_iconPath/close.svg';

  // Common images
  static const String imagePlaceholder = '$_imagePath/placeholder.png';
  static const String imageError = '$_imagePath/error.png';
  static const String imageNoData = '$_imagePath/no_data.png';

  // Helper method to get status icon by status
  static String getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'ordered':
        return iconOrdered;
      case 'accepted':
        return iconAccepted;
      case 'ready':
        return iconReady;
      case 'served':
        return iconServed;
      default:
        return imagePlaceholder;
    }
  }
}
