import '../../constants.dart';

class UrlBuilder {
  static String moviePage({int? page}) {
    final baseUrl = AppConstants.movieApiUrl;
    if (page == null) return baseUrl;
    return "$baseUrl?page=$page";
  }
}
