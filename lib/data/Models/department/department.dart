// https://api.lionsclubsdistrict325jnepal.org.np/api/department
class department {
  int? id;
  String? title;
  String? lionYear;

  department({this.id, this.title, this.lionYear});

  department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    lionYear = json['lion_year'];
  }

  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['lion_year'] = this.lionYear;
    return data;
  }
}
