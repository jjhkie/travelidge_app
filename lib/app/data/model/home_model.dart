class HomeListModel {
  Home? home;

  HomeListModel({this.home});

  HomeListModel.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    return data;
  }
}

class Home {
  List<PopularLocal>? popularLocal;
  List<Friend>? friend;
  List<RecentTravel>? recentTravel;
  List<Category>? category;
  //List<Travel>? travel;

  Home(
      {this.popularLocal,
        this.friend,
        this.recentTravel,
        this.category});

  Home.fromJson(Map<String, dynamic> json) {
    if (json['popularLocal'] != null) {
      popularLocal = <PopularLocal>[];
      json['popularLocal'].forEach((v) {
        popularLocal!.add(new PopularLocal.fromJson(v));
      });
    }
    if (json['friend'] != null) {
      friend = <Friend>[];
      json['friend'].forEach((v) {
        friend!.add(new Friend.fromJson(v));
      });
    }
    if (json['recentTravel'] != null) {
      recentTravel = <RecentTravel>[];
      json['recentTravel'].forEach((v) {
        recentTravel!.add(new RecentTravel.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    // if (json['travel'] != null) {
    //   travel = <Travel>[];
    //   json['travel'].forEach((v) {
    //     travel!.add(new Travel.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.popularLocal != null) {
      data['popularLocal'] = this.popularLocal!.map((v) => v.toJson()).toList();
    }
    if (this.friend != null) {
      data['friend'] = this.friend!.map((v) => v.toJson()).toList();
    }
    if (this.recentTravel != null) {
      data['recentTravel'] = this.recentTravel!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    // if (this.travel != null) {
    //   data['travel'] = this.travel!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class PopularLocal {
  int? localNo;
  String? preTitle;
  String? postTitle;
  String? thumbnailUrl;

  PopularLocal(
      {this.localNo, this.preTitle, this.postTitle, this.thumbnailUrl});

  PopularLocal.fromJson(Map<String, dynamic> json) {
    localNo = json['localNo'];
    preTitle = json['preTitle'];
    postTitle = json['postTitle'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localNo'] = this.localNo;
    data['preTitle'] = this.preTitle;
    data['postTitle'] = this.postTitle;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

class Friend {
  int? userNo;
  String? thumbnailUrl;
  int? travelNo;
  TravelList? travelList;

  Friend({this.userNo, this.thumbnailUrl, this.travelNo, this.travelList});

  Friend.fromJson(Map<String, dynamic> json) {
    userNo = json['userNo'];
    thumbnailUrl = json['thumbnailUrl'];
    travelNo = json['travelNo'];
    travelList = json['travelList'] != null
        ? new TravelList.fromJson(json['travelList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userNo'] = this.userNo;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['travelNo'] = this.travelNo;
    if (this.travelList != null) {
      data['travelList'] = this.travelList!.toJson();
    }
    return data;
  }
}

class TravelList {
  int? travelNo;
  int? userNo;
  String? title;
  Null? content;
  String? thumbnailUrl;
  Null? titleImage;
  Null? images;
  Null? tag;
  int? travelType;
  String? type;
  int? category;
  Null? region;
  Null? promisePlace;
  Null? startDate;
  Null? endDate;
  int? price;
  int? minPrice;
  int? maxPrice;
  int? recruitPeople;
  Null? createTime;
  Null? updateTime;
  int? updateUser;
  int? partyCount;
  int? partyMaxCount;

  TravelList(
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

  TravelList.fromJson(Map<String, dynamic> json) {
    travelNo = json['travelNo'];
    userNo = json['userNo'];
    title = json['title'];
    content = json['content'];
    thumbnailUrl = json['thumbnailUrl'];
    titleImage = json['titleImage'];
    images = json['images'];
    tag = json['tag'];
    travelType = json['travelType'];
    type = json['type'];
    category = json['category'];
    region = json['region'];
    promisePlace = json['promisePlace'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    price = json['price'];
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
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
    data['travelType'] = this.travelType;
    data['type'] = this.type;
    data['category'] = this.category;
    data['region'] = this.region;
    data['promisePlace'] = this.promisePlace;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['price'] = this.price;
    data['minPrice'] = this.minPrice;
    data['maxPrice'] = this.maxPrice;
    data['recruitPeople'] = this.recruitPeople;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    data['partyCount'] = this.partyCount;
    data['partyMaxCount'] = this.partyMaxCount;
    return data;
  }
}

class RecentTravel {
  int? travelNo;
  String? thumbnailUrl;
  String? title;
  String? type;
  int? partyCount;
  int? partyMaxCount;

  RecentTravel(
      {this.travelNo,
        this.thumbnailUrl,
        this.title,
        this.type,
        this.partyCount,
        this.partyMaxCount});

  RecentTravel.fromJson(Map<String, dynamic> json) {
    travelNo = json['travelNo'];
    thumbnailUrl = json['thumbnailUrl'];
    title = json['title'];
    type = json['type'];
    partyCount = json['partyCount'];
    partyMaxCount = json['partyMaxCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travelNo'] = this.travelNo;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['title'] = this.title;
    data['type'] = this.type;
    data['partyCount'] = this.partyCount;
    data['partyMaxCount'] = this.partyMaxCount;
    return data;
  }
}

class Category {
  int? categoryNo;
  String? title;
  String? thumbnailUrl;

  Category({this.categoryNo, this.title, this.thumbnailUrl});

  Category.fromJson(Map<String, dynamic> json) {
    categoryNo = json['categoryNo'];
    title = json['title'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryNo'] = this.categoryNo;
    data['title'] = this.title;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}