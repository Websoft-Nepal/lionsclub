// https://api.lionsclubsdistrict325jnepal.org.np/api/department/region
class region_department {
  String? photo;
  String? memberName;
  String? designation;
  String? departmentName;
  int? zoneCount;
  String? lionYear;
  List<Zones>? zones;

  region_department(
      {this.photo,
      this.memberName,
      this.designation,
      this.departmentName,
      this.zoneCount,
      this.lionYear,
      this.zones});

  region_department.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    memberName = json['member_name'];
    designation = json['designation'];
    departmentName = json['department_name'];
    zoneCount = json['zone_count'];
    lionYear = json['lion_year'];
    if (json['zones'] != null) {
      zones = <Zones>[];
      json['zones'].forEach((v) {
        zones!.add(new Zones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['member_name'] = this.memberName;
    data['designation'] = this.designation;
    data['department_name'] = this.departmentName;
    data['zone_count'] = this.zoneCount;
    data['lion_year'] = this.lionYear;
    if (this.zones != null) {
      data['zones'] = this.zones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Zones {
  int? id;
  String? title;
  String? lionYear;
  String? slug;
  Null region;
  String? zone;
  Null position;
  String? deleted;
  String? createdAt;
  String? updatedAt;

  Zones(
      {this.id,
      this.title,
      this.lionYear,
      this.slug,
      this.region,
      this.zone,
      this.position,
      this.deleted,
      this.createdAt,
      this.updatedAt});

  Zones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    lionYear = json['lion_year'];
    slug = json['slug'];
    region = json['region'];
    zone = json['zone'];
    position = json['position'];
    deleted = json['deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['lion_year'] = this.lionYear;
    data['slug'] = this.slug;
    data['region'] = this.region;
    data['zone'] = this.zone;
    data['position'] = this.position;
    data['deleted'] = this.deleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
