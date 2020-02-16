class LoggedUser {
  final String userName;
  final String name;
  final String eyes;
  final String nose;
  final String mouth;

  LoggedUser(this.userName, this.name, this.eyes, this.nose, this.mouth);

  factory LoggedUser.fromMap(map) {
    return LoggedUser(map['userName'],map['name'],map['eyes'],map['nose'],map['mouth']);
  }

  Map toMap() {
    Map<String, dynamic> map = Map();
    map['userName'] = this.userName;
    map['name'] = this.name;
    map['eyes'] = this.eyes;
    map['nose'] = this.nose;
    map['mouth'] = this.mouth;
    return map;
  }
}
