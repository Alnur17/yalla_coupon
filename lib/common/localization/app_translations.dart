import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // Previous translations
          'select_language': 'Select Language',
          'next': 'Next',
          'join_us': 'Join us & Make Use of The best Available Discounts',
          'phone': 'Phone',
          'email': 'Email',
          'password': 'Password',
          'confirm_password': 'Confirm Password',
          'sign_up': 'Sign Up',
          'or_sign_in': 'Or sign in with',
          'already_have_account': 'Already have an Account?',
          'sign_in_now': 'Sign In Now',
          'maybe_later': 'Maybe Later',
          'your_email': 'Your email',
          'login_to_account': 'Login to your Account',
          'quick_easy_login':
              'It is quick and easy to log in. Enter your email and password below.',
          'forgot_password': 'Forgot password?',
          'dont_have_account': 'Don’t have any account?',
          'login': 'Login',
          'or_login_with': 'Or Login With',

          // New translations for ForgotPasswordView
          'forgot_password_title': 'Forgot Password',
          'forgot_password_message':
              'We will send the OTP code to your email for security in forgetting your password',
          'enter_email': 'Enter your email',
          'send_code': 'Send Code',

          // New translations for ResetSuccessView
          'success': 'Success',
          'password_reset_success': 'Your password has been successfully reset',
          'back_to_login': 'Back to Log In',

          // New translations for SetNewPasswordView
          'set_new_password': 'Set new password',
          'new_password_instruction':
              'Enter your new password and make sure you remember it',
          'new_password': 'New password',
          'retype_new_password': 'Re-type New Password',
          'save_changes': 'Save changes',

          // New translations for VerifyOtpView
          'otp_verification': 'OTP Verification',
          'enter_otp_code': 'Enter 6-digit Code',
          'otp_sent_to_email': 'Your code was sent to your given email',
          'resend_code_in': 'Resend Code In {0} s',
          'resend_code': 'Resend Code',
          'verify': 'Verify',

          // New translations for ActivityLogView
          'activity_log': 'Activity Log',
          'your_activity_log': 'Your Activity Log',
          'no_activity_found': 'No activity found.',

          // New translations for CategoryView
          'all_category': 'All Category',
          'view_all_category': 'View All Category',
          'no_category_available': 'No category available',

          // New translations for CouponsDetailsFromBannerView
          'coupons_details': 'Coupons Details',
          'limited_time_offer': 'Limited Time Offer',
          'only': 'Only',
          'to_grab_this_deal': 'to grab this deal',
          'coupon_code': 'Coupon Code',
          'valid_till': 'Valid till',
          'continue_to_store': 'Continue To Store',
          'how_to_use': 'How to Use',
          'terms_conditions': 'Terms and Conditions',
          'user_rate': 'User Rate',
          'times_copied': 'Times copied',
          'no_coupon_available': 'No coupon available for this banner',
          'no_banner_details': 'No banner details found',

          // New translations for CouponsDetailsView
          'coupon_not_found': 'Coupon not found',
          'hurry': 'Hurry!',
          'grab_this_deal': 'Grab this deal',
          'no_expiry': 'No expiry',
          'copy_and_go_to_store': 'COPY & GO TO STORE',

          // New translations for CouponsView
          'all_coupons': 'All Coupons',
          'top_deals_just_for_you': 'Top Deals Just for You',
          'no_coupons_found': 'No coupons found',

          // New translations for SingleStoreCouponsView
          'coupons': 'Coupons',

          // New translations for DashboardView
          'home': 'Home',
          'category': 'Category',
          'profile': 'Profile',

          // Translations for HomeView
          'no_banners_available': 'No banners available',
          'get_offer': 'Get Offer',
          'get_code': 'Get Code',
          'copy_code': 'Copy Code',
          'code_copied': 'Code Copied',
          'categories': 'Categories',
          'no_sales_available': 'No Sales available',
          'no_featured_coupons': 'No Featured Coupons available',
          'top_trending_coupons': 'Top Trending Coupons',
          'no_trending_coupons': 'No trending coupons',
          'sales_currently': 'Sales Currently',
          'featured_deals': 'Feature Deals',
          'your_activity': 'Your Activity',
          'no_activity_yet': 'No activity yet',

          // New translations for NotificationsView
          'alerts': 'Alerts',
          'active_coupons': 'Active Coupons',
          'no_notification_yet': 'No Notification yet',
          'unknown': 'Unknown',

          // New translations for StoreView
          'stores': 'Stores',
          'view_category_stores': 'View Category wise Stores',

          // New translations for ProfileView
          'account': 'Account',
          'update_info_account': 'Update your info to your account',
          'account_information': 'Account Information',
          'language': 'Language',
          'favorite': 'Favorite',
          'privacy': 'Privacy',
          'view_privacy': 'View your privacy',
          'change_password': 'Change Password',
          'privacy_policies': 'Privacy and Policies',
          'contact_us': 'Contact Us',
          'faq': 'FAQ',
          'log_out': 'Log Out',
          'are_you_sure_log_out':
              'Are you sure you want to log out of your account?',
          'confirm_log_out': 'Confirm Log Out',
          'cancel': 'Cancel',
          'your_name': 'Your Name',
          // New translations for PrivacyAndPolicyView
          'privacy_and_policy': 'Privacy and Policy',
          // New translations for FavouriteView
          'no_favorites_yet': 'No favorites yet',
          // New translations for EditProfileView
          'edit_profile': 'Edit Profile',
          'full_name': 'Full Name',
          'enter_your_name': 'Enter your name',
          'enter_your_email': 'Enter your email',
          'contact': 'Contact',
          // New translations for ContactUsView
          'get_in_touch': 'Get in Touch',
          'we_love_to_hear_from_you': 'We\'d love to hear from you!',
          'name': 'Name',
          'email_address': 'Email Address',
          'subject': 'Subject',
          'whats_your_message_about': 'What\'s your message about?',
          'message': 'Message',
          'type_your_message_here': 'Type your message here...',
          'send_message': 'Send Message',
          'sending': 'Sending...',
          'we_typically_reply_within': 'We typically reply within 24 hours',
          // New translations for ChangePasswordView
          'current_password': 'Current password',
          'confirm_new_password': 'Confirm New Password',
          'save': 'Save',
          // New translations for LanguageView
          'languages': 'Languages',
          'choose_your_preferred_language':
              'Choose your preferred language to continue',
        },
        'ar_SA': {
          // Arabic translations for Saudi Arabia
          'select_language': 'اختار اللغة',
          'next': 'التالي',
          'join_us': 'انضم إلينا واستفد من أفضل العروض المتاحة',
          'phone': 'الهاتف',
          'email': 'البريد الإلكتروني',
          'password': 'كلمة المرور',
          'confirm_password': 'تأكيد كلمة المرور',
          'sign_up': 'التسجيل',
          'or_sign_in': 'أو تسجيل الدخول باستخدام',
          'already_have_account': 'هل لديك حساب؟',
          'sign_in_now': 'تسجيل الدخول الآن',
          'maybe_later': 'ربما لاحقاً',
          'your_email': 'بريدك الإلكتروني',
          'login_to_account': 'تسجيل الدخول إلى حسابك',
          'quick_easy_login':
              'من السهل والسريع تسجيل الدخول. أدخل بريدك الإلكتروني وكلمة المرور أدناه.',
          'forgot_password': 'هل نسيت كلمة المرور؟',
          'dont_have_account': 'لا أملك حسابًا',
          'login': 'تسجيل الدخول',
          'or_login_with': 'أو سجل الدخول باستخدام',

          // New translations for ForgotPasswordView
          'forgot_password_title': 'نسيت كلمة المرور',
          'forgot_password_message':
              'سوف نرسل رمز التحقق إلى بريدك الإلكتروني من أجل تأكيد عملية استعادة كلمة المرور.',
          'enter_email': 'أدخل بريدك الإلكتروني',
          'send_code': 'إرسال الرمز',

          // New translations for ResetSuccessView
          'success': 'تم بنجاح',
          'password_reset_success': 'تم إعادة تعيين كلمة المرور بنجاح',
          'back_to_login': 'العودة إلى تسجيل الدخول',

          // New translations for SetNewPasswordView
          'set_new_password': 'إعداد كلمة مرور جديدة',
          'new_password_instruction':
              'أدخل كلمة المرور الجديدة وتأكد من أنك تتذكرها',
          'new_password': 'كلمة المرور الجديدة',
          'retype_new_password': 'أعد كتابة كلمة المرور الجديدة',
          'save_changes': 'حفظ التغييرات',

          // New translations for VerifyOtpView
          'otp_verification': 'التحقق من الرمز',
          'enter_otp_code': 'أدخل الرمز المكون من 6 أرقام',
          'otp_sent_to_email': 'تم إرسال الرمز إلى بريدك الإلكتروني',
          'resend_code_in': 'إعادة إرسال الرمز في {0} ثواني',
          'resend_code': 'إعادة إرسال الرمز',
          'verify': 'التحقق',

          // New translations for ActivityLogView
          'activity_log': 'سجل الأنشطة',
          'your_activity_log': 'سجل أنشطتك',
          'no_activity_found': 'لم يتم العثور على أي نشاط.',

          // New translations for CategoryView
          'all_category': 'جميع الفئات',
          'view_all_category': 'عرض جميع الفئات',
          'no_category_available': 'لا توجد فئات متاحة',

          // New translations for CouponsDetailsFromBannerView
          'coupons_details': 'تفاصيل القسائم',
          'limited_time_offer': 'عرض لفترة محدودة',
          'only': 'فقط',
          'to_grab_this_deal': 'للحصول على هذا العرض',
          'coupon_code': 'رمز القسيمة',
          'valid_till': 'صالح حتى',
          'continue_to_store': 'استمرار إلى المتجر',
          'how_to_use': 'كيفية الاستخدام',
          'terms_conditions': 'الشروط والأحكام',
          'user_rate': 'تقييم المستخدم',
          'times_copied': 'عدد المرات التي تم نسخها',
          'no_coupon_available': 'لا توجد قسائم متاحة لهذا البانر',
          'no_banner_details': 'لا توجد تفاصيل للبانر',

          // New translations for CouponsDetailsView
          'coupon_not_found': 'القسيمة غير موجودة',
          'hurry': 'عجل!',
          'grab_this_deal': 'احصل على هذا العرض',
          'no_expiry': 'بدون تاريخ انتهاء',
          'copy_and_go_to_store': 'نسخ والانتقال إلى المتجر',

          // New translations for CouponsView
          'all_coupons': 'جميع القسائم',
          'top_deals_just_for_you': 'أفضل العروض فقط لك',
          'no_coupons_found': 'لم يتم العثور على قسائم',

          // New translations for SingleStoreCouponsView
          'coupons': 'قسائم',

          // New translations for DashboardView
          'home': 'الرئيسية',
          'category': 'الفئات',
          'profile': 'الملف الشخصي',

          // Translations for HomeView
          'no_banners_available': 'لا توجد بانرات متاحة',
          'get_offer': 'احصل على العرض',
          'get_code': 'احصل على الرمز',
          'copy_code': 'نسخ الرمز',
          'code_copied': 'تم نسخ الرمز',
          'categories': 'الفئات',
          'no_sales_available': 'لا توجد مبيعات متاحة',
          'no_featured_coupons': 'لا توجد قسائم مميزة',
          'top_trending_coupons': 'أشهر القسائم',
          'no_trending_coupons': 'لا توجد قسائم رائجة',
          'sales_currently': 'المبيعات الحالية',
          'featured_deals': 'عروض مميزة',
          'your_activity': 'أنشطتك',
          'no_activity_yet': 'لا يوجد نشاط بعد',

          // New translations for NotificationsView
          'alerts': 'تنبيهات',
          'active_coupons': 'القسائم النشطة',
          'no_notification_yet': 'لا توجد إشعارات بعد',
          'unknown': 'غير معروف',

          // New translations for StoreView
          'stores': 'المتاجر',
          'view_category_stores': 'عرض متاجر الفئة',

          // New translations for ProfileView
          'account': 'الحساب',
          'update_info_account': 'تحديث معلومات حسابك',
          'account_information': 'معلومات الحساب',
          'language': 'اللغة',
          'favorite': 'المفضلة',
          'privacy': 'الخصوصية',
          'view_privacy': 'عرض خصوصيتك',
          'change_password': 'تغيير كلمة المرور',
          'privacy_policies': 'سياسة الخصوصية',
          'contact_us': 'اتصل بنا',
          'faq': 'الأسئلة الشائعة',
          'log_out': 'تسجيل الخروج',
          'are_you_sure_log_out': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
          'confirm_log_out': 'تأكيد تسجيل الخروج',
          'cancel': 'إلغاء',
          'your_name': 'اسمك',
          // New translations for PrivacyAndPolicyView
          'privacy_and_policy': 'الخصوصية والسياسة',
          // New translations for FavouriteView
          'no_favorites_yet': 'لا توجد مفضلات بعد',
          // New translations for EditProfileView
          'edit_profile': 'تعديل الملف الشخصي',
          'full_name': 'الاسم الكامل',
          'enter_your_name': 'أدخل اسمك',
          'enter_your_email': 'أدخل بريدك الإلكتروني',
          'contact': 'التواصل',
          // New translations for ContactUsView
          'get_in_touch': 'ابق على اتصال',
          'we_love_to_hear_from_you': 'يسعدنا سماعك!',
          'name': 'الاسم',
          'email_address': 'البريد الإلكتروني',
          'subject': 'الموضوع',
          'whats_your_message_about': 'ما هو موضوع رسالتك؟',
          'message': 'الرسالة',
          'type_your_message_here': 'اكتب رسالتك هنا...',
          'send_message': 'إرسال الرسالة',
          'sending': 'جاري الإرسال...',
          'we_typically_reply_within': 'عادةً ما نرد في غضون 24 ساعة',
          // New translations for ChangePasswordView
          'current_password': 'كلمة المرور الحالية',
          'confirm_new_password': 'تأكيد كلمة المرور الجديدة',
          'save': 'حفظ',
          // New translations for LanguageView
          'languages': 'اللغات',
          'choose_your_preferred_language': 'اختر لغتك المفضلة للمتابعة',
        },
      };
}
