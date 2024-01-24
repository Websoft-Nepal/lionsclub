// https://api.lionsclubsdistrict325jnepal.org.np/api/program
class program {
  int? id;
  String? title;
  String? detail;
  String? photo;
  String? postDate;
  String? lionsYear;

  program(
      {this.id,
      this.title,
      this.detail,
      this.photo,
      this.postDate,
      this.lionsYear});

  program.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
    photo = json['photo'];
    postDate = json['post_date'];
    lionsYear = json['lions_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['photo'] = this.photo;
    data['post_date'] = this.postDate;
    data['lions_year'] = this.lionsYear;
    return data;
  }
}
