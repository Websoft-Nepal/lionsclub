// https://api.lionsclubsdistrict325jnepal.org.np/api/club/100/member

class clubMember {
  String? name;
  Null? photo;
  String? post;
  String? memberMembershipNo;
  clubMember({this.name, this.photo, this.post, this.memberMembershipNo});

  clubMember.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    post = json['post'];
    memberMembershipNo = json['member_membership_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['post'] = this.post;
    data['member_membership_no'] = this.memberMembershipNo;
    return data;
  }
}
