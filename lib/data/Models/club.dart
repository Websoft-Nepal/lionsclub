// https://api.lionsclubsdistrict325jnepal.org.np/api/club

class club {
  int? id;
  String? name;
  Null? logo;
  String? charterDate;
  int? memberCount;
  String? lionsYear;

  club(
      {this.id,
        this.name,
        this.logo,
        this.charterDate,
        this.memberCount,
        this.lionsYear});

  club.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    charterDate = json['charter_date'];
    memberCount = json['member_count'];
    lionsYear = json['lions_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['charter_date'] = this.charterDate;
    data['member_count'] = this.memberCount;
    data['lions_year'] = this.lionsYear;
    return data;
  }
}
