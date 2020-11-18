// class RemoteModel {
//   dynamic slug;
//   dynamic id;
//   dynamic epoch;
//   dynamic date;
//   dynamic company;
//   dynamic companyLogo;
//   dynamic position;
//   List<dynamic> tags;
//   dynamic description;
//   dynamic location;
//   dynamic url;

//   RemoteModel(
//       {this.slug,
//       this.id,
//       this.epoch,
//       this.date,
//       this.company,
//       this.companyLogo,
//       this.position,
//       this.tags,
//       this.description,
//       this.location,
//       this.url});

//   RemoteModel.fromJson(List<dynamic> json) {
//     slug = json[slug];
//     id = json[id];
//     epoch = json[epoch];
//     date = json[date];
//     company = json[company];
//     companyLogo = json[companyLogo];
//     position = json[position];
//     tags = json[tags].cast<dynamic>();
//     description = json[description];
//     location = json[location];
//     url = json[url];
//   }

//   List<dynamic> toJson() {
//     final List<dynamic> data = new List<dynamic>();
//     data[slug] = this.slug;
//     data[id] = this.id;
//     data[epoch] = this.epoch;
//     data[date] = this.date;
//     data[company] = this.company;
//     data[companyLogo] = this.companyLogo;
//     data[position] = this.position;
//     data[tags] = this.tags;
//     data[description] = this.description;
//     data[location] = this.location;
//     data[url] = this.url;
//     return data;
//   }
// }



 class  RemoteModel {
  String slug;
  String id;
  String epoch;
  String date;
  String company;
  String companyLogo;
  String position;
  List<String> tags;
  String logo;
  String description;
  String location;
  bool original;
  String url;

  RemoteModel(
      {this.slug,
      this.id,
      this.epoch,
      this.date,
      this.company,
      this.companyLogo,
      this.position,
      this.tags,
      this.logo,
      this.description,
      this.location,
      this.original,
      this.url});

  RemoteModel.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    id = json['id'];
    epoch = json['epoch'];
    date = json['date'];
    company = json['company'];
    companyLogo = json['company_logo'];
    position = json['position'];
    tags = json['tags'].cast<String>();
    logo = json['logo'];
    description = json['description'];
    location = json['location'];
    original = json['original'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['id'] = this.id;
    data['epoch'] = this.epoch;
    data['date'] = this.date;
    data['company'] = this.company;
    data['company_logo'] = this.companyLogo;
    data['position'] = this.position;
    data['tags'] = this.tags;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['location'] = this.location;
    data['original'] = this.original;
    data['url'] = this.url;
    return data;
  }
}
