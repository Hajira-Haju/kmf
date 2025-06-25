class ApiList {
  // static String baseUrl = 'https://portal.kmfkuwait.com';
  static String baseUrl = 'http://skaktech-005-site27.otempurl.com';
  static String loginUrl = '$baseUrl/api/KMF/VerifyMemberByCivilID';
  static String imageUploadUrl = '$baseUrl/api/KMF/UploadProfilePicture';
  static String civilId = '$baseUrl/api/KMF/GetMemberDataPostLogin';
  static String offerUrl = '$baseUrl/api/KMF/GetAllOfferData';
  static String contactUs = '$baseUrl/api/KMF/SaveClientEnquiery';
  static String newsAndEventsUrl({required int type}) {
    return '$baseUrl/api/KMF/GetAllNewsAndEventsData?Type=$type';
  }
}
