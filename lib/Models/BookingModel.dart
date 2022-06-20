class BookingModel {
  int? id;
  String? title;
  String? interest;
  int? price;
  String? date;
  String? address;
  String? trainerName;
  String? trainerInfo;
  String? occasionDetail;
  int? specialForm;
  List<ReservTypes>? reservTypes;

  BookingModel({
    this.id,
    this.title,
    this.interest,
    this.price,
    this.date,
    this.address,
    this.trainerName,
    this.trainerInfo,
    this.occasionDetail,
    this.specialForm,
    this.reservTypes,
  });

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    interest = json['interest'];
    price = json['price'];
    date = json['date'];
    address = json['address'];
    trainerName = json['trainerName'];
    trainerInfo = json['trainerInfo'];
    occasionDetail = json['occasionDetail'];
    specialForm = json['specialForm'];
    if (json['reservTypes'] != null) {
      reservTypes = <ReservTypes>[];
      json['reservTypes'].forEach((v) {
        reservTypes!.add(ReservTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['interest'] = interest;
    data['price'] = price;
    data['date'] = date;
    data['address'] = address;
    data['trainerName'] = trainerName;
    data['trainerInfo'] = trainerInfo;
    data['occasionDetail'] = occasionDetail;
    data['specialForm'] = specialForm;
    if (reservTypes != null) {
      data['reservTypes'] = reservTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReservTypes {
  int? id;
  String? name;
  int? count;
  int? price;

  ReservTypes({this.id, this.name, this.count, this.price});

  ReservTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['count'] = count;
    data['price'] = price;
    return data;
  }
}
