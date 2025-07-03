class ApiList {
  static String baseUrl = 'https://portal.kmfkuwait.com';
  // static String baseUrl = 'http://skaktech-005-site27.otempurl.com';
  static String loginUrl = '$baseUrl/api/KMF/VerifyMemberByCivilID';
  static String imageUploadUrl = '$baseUrl/api/KMF/UploadProfilePicture';
  static String civilId = '$baseUrl/api/KMF/GetMemberDataPostLogin';
  static String offerUrl = '$baseUrl/api/KMF/GetAllOfferData';
  static String contactUs = '$baseUrl/api/KMF/SaveClientEnquiery';
  static String eventType = '$baseUrl/api/KMF/GetAllEventTypes';
  static String newsAndEventsUrl({required int type, required int pageNo}) {
    return '$baseUrl/api/KMF/GetAllNewsAndEventsData?Type=$type&PageNumber=$pageNo';
  }

  static String officials = '$baseUrl/api/KMF/GetCommitteDetailsByGroup';
  static String aboutUs = '$baseUrl/api/KMF/GetSectionDataByType?Type=39';
  static String referFriend = '$baseUrl/api/KMF/GetSectionDataByType?Type=40';
  static String quickContact = '$baseUrl/api/KMF/GetSectionDataByType?Type=41';
  static String loggedStatus(int type) {
    return '$baseUrl/api/KMF/UpdateLoginLogOutTime?Type=$type';
  }

  static String notificationUrl = '$baseUrl/api/KMF/GetNotificationByMember';
  static String deleteNotificationUrl(int id) {
    return '$baseUrl/api/KMF/UpdateMessageStatus?MessageID=$id';
  }

  static String logOut = '$baseUrl/api/KMF/LogOut';
}
