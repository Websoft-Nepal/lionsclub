// https://api.lionsclubsdistrict325jnepal.org.np/api/news-events
class newsevents {
  int? id;
  String? title;
  String? slug;
  String? detail;
  String? photo;
  String? createdAt;
  String? updatedAt;

  newsevents(
      {this.id,
        this.title,
        this.slug,
        this.detail,
        this.photo,
        this.createdAt,
        this.updatedAt});

  newsevents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    detail = json['detail'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['detail'] = this.detail;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
