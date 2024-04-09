class Kstrings {

  static const String userStorage = "user";
  static const String userTokenStorage = "user_token";
  static const String langStorage = "language";

 
  static String getChatChannel({required int toUserId, required int chatId}) =>
      "chat-$toUserId-$chatId";
  static String getOrderChannel({required int driverId}) => 'order-$driverId';
  static const String postId = 'postId';

  static const String countryCode = "+2";

  static String getUserChannel({required int driverId}) => 'user-app-$driverId';
}
