class DepartmentDetails {
  int? memberDesignationEnrollId;
  MemberDetails? memberDetails;
  List<Officer>? officer;

  DepartmentDetails(
      {this.memberDesignationEnrollId, this.memberDetails, this.officer});

  DepartmentDetails.fromJson(Map<String, dynamic> json) {
    memberDesignationEnrollId = json['member_designation_enroll_id'];
    memberDetails = json['member_details'] != null
        ? new MemberDetails.fromJson(json['member_details'])
        : null;
    if (json['officer'] != null) {
      officer = <Officer>[];
      json['officer'].forEach((v) {
        officer!.add(new Officer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_designation_enroll_id'] = this.memberDesignationEnrollId;
    if (this.memberDetails != null) {
      data['member_details'] = this.memberDetails!.toJson();
    }
    if (this.officer != null) {
      data['officer'] = this.officer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberDetails {
  int? id;
  String? name;
  String? photo;

  MemberDetails({this.id, this.name, this.photo});

  MemberDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}

class Officer {
  String? title;

  Officer({this.title});

  Officer.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}
