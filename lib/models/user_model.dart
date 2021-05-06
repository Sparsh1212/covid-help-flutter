class UserAcademicData {
  final int id;
  final String name;
  final String degree;
  final String currentYear;

  UserAcademicData({this.id, this.name, this.degree, this.currentYear});

  static String toStringYear(int year) {
    return year.toString() + ' Year';
  }

  factory UserAcademicData.fromJSON(dynamic json) {
    return UserAcademicData(
        id: json['id'],
        name: json['fullName'],
        degree: json['roles'][0]['data']['branch']['degree']['name'],
        currentYear: toStringYear(json['roles'][0]['data']['currentYear']));
  }
}

class UserLocalData {
  final String contactNumber;
  final String address;
  final String pincode;

  UserLocalData({this.contactNumber, this.address, this.pincode});

  factory UserLocalData.fromJSON(dynamic json) {
    return UserLocalData(
        contactNumber: json['contactInformation']['phone'],
        address: json['locationInformation']['address'],
        pincode: json['locationInformation']['postalCode'].toString());
  }
}

class UserFullData {
  final int id;
  final String name;
  final String degree;
  final String currentYear;
  final String contactNumber;
  final String address;
  final String pincode;

  UserFullData(
      {this.id,
      this.name,
      this.degree,
      this.currentYear,
      this.contactNumber,
      this.address,
      this.pincode});

  factory UserFullData.fromJSON(
      UserAcademicData userAcademicData, UserLocalData userLocalData) {
    return UserFullData(
      id: userAcademicData.id,
      name: userAcademicData.name,
      degree: userAcademicData.degree,
      currentYear: userAcademicData.currentYear,
      contactNumber: userLocalData.contactNumber,
      address: userLocalData.address,
      pincode: userLocalData.pincode
    );
  }
}
