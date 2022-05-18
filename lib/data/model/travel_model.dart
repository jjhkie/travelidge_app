class travel {
  List<MyTravel>? myTravelList;
  PageInfo? pageInfo;

  travel({this.myTravelList, this.pageInfo});

  travel.fromJson(Map<String, dynamic> json) {
    if (json['myTravelList'] != null) {
      myTravelList = <MyTravel>[];
      json['myTravelList'].forEach((v) {
        myTravelList!.add(new MyTravel.fromJson(v));
      });
    }
    pageInfo = json['pageInfo'] != null
        ? new PageInfo.fromJson(json['pageInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myTravelList != null) {
      data['myTravelList'] = this.myTravelList!.map((v) => v.toJson()).toList();
    }
    if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo!.toJson();
    }
    return data;
  }
}

class MyTravel {
  int? travelNo;
  int? userNo;
  String? title;
  Null? content;
  Null? thumbnailUrl;
  String? titleImage;
  Null? images;
  Null? tag;
  int? travelType;
  Null? type;
  int? category;
  Null? region;
  String? promisePlace;
  String? startDate;
  Null? endDate;
  int? price;
  int? minPrice;
  int? maxPrice;
  int? recruitPeople;
  Null? createTime;
  Null? updateTime;
  Null? updateUser;
  int? partyCount;
  int? partyMaxCount;

  MyTravel(
      {this.travelNo,
        this.userNo,
        this.title,
        this.content,
        this.thumbnailUrl,
        this.titleImage,
        this.images,
        this.tag,
        this.travelType,
        this.type,
        this.category,
        this.region,
        this.promisePlace,
        this.startDate,
        this.endDate,
        this.price,
        this.minPrice,
        this.maxPrice,
        this.recruitPeople,
        this.createTime,
        this.updateTime,
        this.updateUser,
        this.partyCount,
        this.partyMaxCount});

  MyTravel.fromJson(Map<String, dynamic> json) {
    travelNo = json['travelNo'];
    userNo = json['userNo'];
    title = json['title'];
    content = json['content'];
    thumbnailUrl = json['thumbnailUrl'];
    titleImage = json['titleImage'];
    images = json['images'];
    tag = json['tag'];
    travelType = json['travel_type'];
    type = json['type'];
    category = json['category'];
    region = json['region'];
    promisePlace = json['promisePlace'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    price = json['price'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    recruitPeople = json['recruitPeople'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    updateUser = json['updateUser'];
    partyCount = json['partyCount'];
    partyMaxCount = json['partyMaxCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travelNo'] = this.travelNo;
    data['userNo'] = this.userNo;
    data['title'] = this.title;
    data['content'] = this.content;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['titleImage'] = this.titleImage;
    data['images'] = this.images;
    data['tag'] = this.tag;
    data['travel_type'] = this.travelType;
    data['type'] = this.type;
    data['category'] = this.category;
    data['region'] = this.region;
    data['promisePlace'] = this.promisePlace;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['price'] = this.price;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    data['recruitPeople'] = this.recruitPeople;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    data['partyCount'] = this.partyCount;
    data['partyMaxCount'] = this.partyMaxCount;
    return data;
  }
}

class PageInfo {
  int? nextNo;
  bool? hasNext;
  int? totalCount;

  PageInfo({this.nextNo, this.hasNext, this.totalCount});

  PageInfo.fromJson(Map<String, dynamic> json) {
    nextNo = json['nextNo'];
    hasNext = json['hasNext'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextNo'] = this.nextNo;
    data['hasNext'] = this.hasNext;
    data['totalCount'] = this.totalCount;
    return data;
  }
}