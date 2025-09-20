class Api {
  /// base url
  static const baseUrl = "http://206.162.244.133:5006/api/v1";
  static const socketUrl = "https://socket.gasdash.io";

  ///auth api
  static const register = "$baseUrl/users/signup"; //done
  static const login = "$baseUrl/auth/login"; //
  static const forgotPassword = "$baseUrl/auth/send-otp"; //done
  static const otpVerify = "$baseUrl/auth/verify-otp"; //done
  static const reSendOtp = "$baseUrl/auth/send-otp"; //
  static const resetPassword = "$baseUrl/auth/reset-forgotten-password"; //
  static const changePassword = "$baseUrl/auth/change-password"; //


}
