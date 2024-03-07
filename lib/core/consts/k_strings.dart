class Kstrings {
  static const String googleMapApiKey =
      'AIzaSyAAOcn3r6DVavhuoPatQvNGg5kUuV1zAFo';
  static const String userStorage = "user";
  static const String userTokenStorage = "user_token";
  static const String langStorage = "language";

  static const String pusherAppId = "1604803";
  static const String pusherAppKey = "739aa40aa88637db9d38";
  static const String pusherCluster = "eu";
  static String getChatChannel({required int toUserId, required int chatId}) =>
      "chat-$toUserId-$chatId";
  static String getOrderChannel({required int driverId}) => 'order-$driverId';
  static const String postId = 'postId';

  static const String countryCode = "+2";

  static String getUserChannel({required int driverId}) => 'user-app-$driverId';
}
