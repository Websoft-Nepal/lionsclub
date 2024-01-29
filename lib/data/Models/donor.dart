// https://api.lionsclubsdistrict325jnepal.org.np/api/donor

class Donor {
  int? id;
  String? title;

  Donor({this.id, this.title});

  Donor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
