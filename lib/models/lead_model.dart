class NonPlasmaDescription {
  final String cost;
  final String capacity;
  final String description;

  NonPlasmaDescription({this.cost, this.capacity, this.description});

  factory NonPlasmaDescription.fromJSON(dynamic json) {
    return NonPlasmaDescription(
        cost: json['cost'] != null ? json['cost'].toString() : "N.A",
        capacity: json['capacity'] != null ? json['capacity'] : "N.A",
        description: json['description'] != null ? json['description'] : "N.A");
  }
}

class PlasmaDescription {
  final String bloodGroup;
  final bool testedPositive;
  final bool vaccinated;
  final String positiveWhen;

  PlasmaDescription(
      {this.bloodGroup,
      this.testedPositive,
      this.vaccinated,
      this.positiveWhen});

  factory PlasmaDescription.fromJSON(dynamic json) {
    return PlasmaDescription(
        bloodGroup: json['bloodGroup'],
        testedPositive: json['testedPositive'],
        vaccinated: json['vaccinated'],
        positiveWhen:
            json['positiveWhen'] != null ? json['positiveWhen'] : "N.A");
  }
}

class Lead {
  final int id;
  final int upvoteCount;
  final int downvoteCount;
  final String title;
  final String address;
  final String contact;
  final String otherContact;
  final String shareLink;
  final String resourceType;
  final String verifiedBy;
  NonPlasmaDescription nonPlasmaDescription;
  PlasmaDescription plasmaDescription;
  Lead(
      {this.id,
      this.title,
      this.address,
      this.contact,
      this.otherContact,
      this.shareLink,
      this.resourceType,
      this.verifiedBy,
      this.nonPlasmaDescription,
      this.plasmaDescription,
      this.upvoteCount,
      this.downvoteCount});

  static String getShareLink(String id) {
    return "https://stage.channeli.in/api/covid_care/lead/" + id + "/";
  }

  factory Lead.fromJSON(dynamic json) {
    if (json['resource'][0]['resourceType'] != "plasma") {
      return Lead(
          id: json['pk'],
          title: json['title'],
          upvoteCount: json['upvoteCount'],
          downvoteCount: json['downvoteCount'],
          address: json['address'],
          contact: json['contact'],
          verifiedBy: json['verificationDisplay'],
          otherContact: json['otherContact'],
          shareLink: getShareLink(json['pk'].toString()),
          resourceType: json['resource'][0]['resourceType'],
          nonPlasmaDescription:
              NonPlasmaDescription.fromJSON(json['resource'][0]));
    } else {
      return Lead(
          id: json['pk'],
          title: json['title'],
          upvoteCount: json['upvoteCount'],
          downvoteCount: json['downvoteCount'],
          address: json['address'],
          contact: json['contact'],
          verifiedBy: json['verificationDisplay'],
          otherContact: json['otherContact'],
          shareLink: getShareLink(json['pk'].toString()),
          resourceType: json['resource'][0]['resourceType'],
          plasmaDescription:
              PlasmaDescription.fromJSON(json['plasmaDonor'][0]));
    }
  }
}
