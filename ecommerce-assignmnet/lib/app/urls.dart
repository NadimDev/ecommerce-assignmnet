class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signInUrl = '$_baseUrl/auth/login';
  static const String signUpUrl = '$_baseUrl/auth/signup';

  static String verifyOtpUrl = '$_baseUrl/auth/verify-otp';

  static String homeSliderUrl = '$_baseUrl/slides';
  static String bannerListUrl = '$_baseUrl/ListProductSlider';
  static String categoryListUrl = '$_baseUrl/categories';
  static String productListUrl = '$_baseUrl/products';
  static String cartPostUrl = '$_baseUrl/cart';

  static String productListByIdUrl(String id) => '$_baseUrl/products/id/$id';

  static String productListByCategoryUrl(String categoryId) =>
      '$_baseUrl/products/id/$categoryId';

  static String productDetailsUrl(int productId) =>
      '$_baseUrl/products/id/$productId';

  static String productReviewsUrl(String productId) =>
      '$_baseUrl/reviews?product=$productId';
  static String createProductReviewUrl = '$_baseUrl/review';

}
