class CollectionModel {
  late String name;
  late int year;
  late int code;
  late int bottleNumber;
  late int totalBottles;
  late String distillery;
  late String region;
  late String country;
  late String type;
  late String ageStatement;
  late String filled;
  late String bottled;
  late String caskNumber;
  late String abv;
  late String size;
  late String finish;
  late List<TestingNotes> tastingNotes;
  late List<History> history;

  CollectionModel({
    required this.name,
    required this.year,
    required this.code,
    required this.bottleNumber,
    required this.totalBottles,
    required this.distillery,
    required this.region,
    required this.country,
    required this.type,
    required this.ageStatement,
    required this.filled,
    required this.bottled,
    required this.caskNumber,
    required this.abv,
    required this.size,
    required this.finish,
    required this.tastingNotes,
    required this.history,
  });

  CollectionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    year = json['year'];
    code = json['code'];
    bottleNumber = json['bottlenumber'];
    totalBottles = json['totalbottles'];
    distillery = json['distillory'];
    region = json['region'];
    country = json['country'];
    type = json['type'];
    ageStatement = json['age statement'];
    filled = json['filled'];
    bottled = json['bottled'];
    caskNumber = json['casknumber'];
    abv = json['abv'];
    size = json['size'];
    finish = json['finish'];
    if (json['testingnotes'] != null) {
      tastingNotes = <TestingNotes>[];
      json['testingnotes'].forEach((v) {
        tastingNotes!.add(new TestingNotes.fromJson(v));
      });
    }
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['year'] = this.year;
    data['code'] = this.code;
    data['bottlenumber'] = this.bottleNumber;
    data['totalbottles'] = this.totalBottles;
    data['distillory'] = this.distillery;
    data['region'] = this.region;
    data['country'] = this.country;
    data['type'] = this.type;
    data['age statement'] = this.ageStatement;
    data['filled'] = this.filled;
    data['bottled'] = this.bottled;
    data['casknumber'] = this.caskNumber;
    data['abv'] = this.abv;
    data['size'] = this.size;
    data['finish'] = this.finish;
    if (this.tastingNotes != null) {
      data['testingnotes'] = this.tastingNotes!.map((v) => v.toJson()).toList();
    }
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TestingNotes {
  late String title;
  late String description;

  TestingNotes({required this.title,required  this.description});

  TestingNotes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

class History {
  late String title;
  late String description;

  History({required this.title,required this.description});

  History.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
