class DonorDetail {
  String? photo;
  String? memberName;
  String? donatedAt;
  String? club;
  String? lionYear;

  DonorDetail(
      {this.photo, this.memberName, this.donatedAt, this.club, this.lionYear});

  DonorDetail.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    memberName = json['member_name'];
    donatedAt = json['donated_at'];
    club = json['club'];
    lionYear = json['lion_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['member_name'] = this.memberName;
    data['donated_at'] = this.donatedAt;
    data['club'] = this.club;
    data['lion_year'] = this.lionYear;
    return data;
  }
}
