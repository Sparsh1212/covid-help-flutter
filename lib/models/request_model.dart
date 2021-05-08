class Resource {
  final String resourceType;
  final String resourceValue;
  Resource({this.resourceType, this.resourceValue});
}

class Request {
  final int id;
  final String title;
  final String address;
  final String contact;
  final String otherContact;
  final String shareLink;
  String status;
  final String patientName;
  final String patientAge;
  final String patientSpo2Value;
  final String patientCtValue;
  final List<Resource> resourcesRequired;

  Request(
      {this.id,
      this.title,
      this.address,
      this.contact,
      this.otherContact,
      this.shareLink,
      this.status,
      this.patientName,
      this.patientAge,
      this.patientSpo2Value,
      this.patientCtValue,
      this.resourcesRequired});

  static String getShareLink(String id) {
    return "https://stage.channeli.in/app/covid_care/request/" + id + "/";
  }

  static List<Resource> constructResourcesRequired(dynamic json) {
    return json.map<Resource>((resourceObj) {
      if (resourceObj['resourceType'] != "plasma") {
        return Resource(
            resourceType: resourceObj['resourceTypeDisplay'],
            resourceValue: resourceObj['requirement']);
      } else {
        return Resource(
            resourceType: resourceObj['resourceType'],
            resourceValue: resourceObj['patientBloodGroup']);
      }
    }).toList();
  }

  factory Request.fromJSON(dynamic json) {
    return Request(
      id: json['pk'],
      title: json['title'],
      address: json['address'],
      contact: json['contact'],
      otherContact: json['otherContact'],
      shareLink: getShareLink(json['pk'].toString()),
      status: json['statusDisplay'],
      patientName: json['patientName'],
      patientAge: json['age'].toString(),
      patientSpo2Value: json['patientSpo2'].toString(),
      patientCtValue: json['patientCtValue'].toString(),
      resourcesRequired: constructResourcesRequired(json['resource'])
    );
  }
}
