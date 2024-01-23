
// https://api.lionsclubsdistrict325jnepal.org.np/api/department/zone
class zone_department {
  String? photo;
  String? memberName;
  String? designation;
  String? departmentName;
  String? lionYear;
  List<Clubs>? clubs;

  zone_department(
      {this.photo,
        this.memberName,
        this.designation,
        this.departmentName,
        this.lionYear,
        this.clubs}
      );

  zone_department.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    memberName = json['member_name'];
    designation = json['designation'];
    departmentName = json['department_name'];
    lionYear = json['lion_year'];
    if (json['clubs'] != null) {
      clubs = <Clubs>[];
      json['clubs'].forEach((v) {
        clubs!.add(new Clubs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['member_name'] = this.memberName;
    data['designation'] = this.designation;
    data['department_name'] = this.departmentName;
    data['lion_year'] = this.lionYear;
    if (this.clubs != null) {
      data['clubs'] = this.clubs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clubs {
  String? name;

  Clubs({this.name});

  Clubs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
