class appUser {
  final String uid;
  var image;
  String username;
  String email;
  String password;
  var bestscore;
  appUser({required this.uid, this.email = "", this.password="", this.username="anonymous", this.image="", this.bestscore = 0 });
}