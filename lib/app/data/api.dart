class Api {
  /// base url
  static const baseUrl = "http://206.162.244.133:5006/api/v1";
  //static const baseUrl = "http://10.10.10.17:5004/api/v1";
  static const socketUrl = "https://socket.gasdash.io";

  ///auth api
  static const register = "$baseUrl/users/signup"; //done
  static const login = "$baseUrl/auth/login"; //
  static const forgotPassword = "$baseUrl/auth/send-otp"; //done
  static const otpVerify = "$baseUrl/auth/verify-otp"; //done
  static const reSendOtp = "$baseUrl/auth/send-otp"; //done
  static const resetPassword = "$baseUrl/auth/reset-forgotten-password"; //done
  static const changePassword = "$baseUrl/auth/change-password"; //done

  ///Social login
  static const googleLogin = "$baseUrl/auth/google-login"; //

  ///Profile
  static const userProfile = "$baseUrl/users/profile"; //done
  static const editProfile = "$baseUrl/users"; //done
  static const addOrRemoveFavourite = "$baseUrl/favorites"; //done
  static const favourite = "$baseUrl/favorites"; //done
  static const conditionsPage = "$baseUrl/legal"; //done
  static const contactUs = "$baseUrl/feedbacks"; //done
  static const activityLog = "$baseUrl/activities"; //done

  ///Banners
  static const allBanners = "$baseUrl/banners"; //done
  static singleBanners(String id) => "$baseUrl/banners/$id"; //done

  ///home
  static const trendingCoupons = "$baseUrl/coupons/trending"; //done
  static const featuredCoupons = "$baseUrl/coupons/featured"; //done
  static const thumbnails = "$baseUrl/thumbnails"; //done

  ///Coupons
  static const allCoupons = "$baseUrl/coupons"; //done
  static singleCoupons(String id) => "$baseUrl/coupons/single/$id"; //done
  static couponsByStoreId(String id) => "$baseUrl/coupons?store=$id"; //done

  ///Categories
  static const allCategory = "$baseUrl/categories"; //done
  //static singleCategory(String id) => "$baseUrl/categories/$id"; //

  ///Categories
  static allStores(String categoryId) => "$baseUrl/stores?categories=$categoryId"; //done
  static singleStore(String id) => "$baseUrl/stores/$id"; //

  ///Notifications
  static const notification = "$baseUrl/notifications"; //done
}
