// https://api.lionsclubsdistrict325jnepal.org.np/api/donor

class donor {
  int? id;
  String? title;

  donor({this.id, this.title});

  donor.fromJson(Map<String, dynamic> json) {
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
