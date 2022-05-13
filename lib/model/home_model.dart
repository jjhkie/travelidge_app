class HomeListModel {
  HomeData? homeList;

  HomeListModel({this.homeList});

  HomeListModel.fromJson(Map<String, dynamic> json) {
    homeList = json['homeList'] != null
        ? new HomeData.fromJson(json['homeList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeList != null) {
      data['homeList'] = this.homeList!.toJson();
    }
    return data;
  }
}

class HomeData {
  List<PopularLocal>? popularLocalList;
  List<RecentTravel>? recentTravelList;
  List<Category>? categoryList;
  List<Friend>? friendList;

  HomeData(
      {this.popularLocalList,
        this.recentTravelList,
        this.categoryList,
        this.friendList});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['popularLocalList'] != null) {
      popularLocalList = <PopularLocal>[];
      json['popularLocalList'].forEach((v) {
        popularLocalList!.add(new PopularLocal.fromJson(v));
      });
    }
    if (json['recentTravelList'] != null) {
      recentTravelList = <RecentTravel>[];
      json['recentTravelList'].forEach((v) {
        recentTravelList!.add(new RecentTravel.fromJson(v));
      });
    }
    if (json['categoryList'] != null) {
      categoryList = <Category>[];
      json['categoryList'].forEach((v) {
        categoryList!.add(new Category.fromJson(v));
      });
    }
    if (json['friendList'] != null) {
      friendList = <Friend>[];
      json['friendList'].forEach((v) {
        friendList!.add(new Friend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.popularLocalList != null) {
      data['popularLocalList'] =
          this.popularLocalList!.map((v) => v.toJson()).toList();
    }
    if (this.recentTravelList != null) {
      data['recentTravelList'] =
          this.recentTravelList!.map((v) => v.toJson()).toList();
    }
    if (this.categoryList != null) {
      data['categoryList'] = this.categoryList!.map((v) => v.toJson()).toList();
    }
    if (this.friendList != null) {
      data['friendList'] = this.friendList!.map((v) => v.toJson()).toList();
    }
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

class Friend {
  int? userNo;
  String? thumbnailUrl;
  RecentTravel? travelDto;

  Friend({this.userNo, this.thumbnailUrl, this.travelDto});

  Friend.fromJson(Map<String, dynamic> json) {
    userNo = json['user_no'];
    thumbnailUrl = json['thumbnailUrl'];
    travelDto = json['travelDto'] != null
        ? new RecentTravel.fromJson(json['travelDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_no'] = this.userNo;
    data['thumbnailUrl'] = this.thumbnailUrl;
    if (this.travelDto != null) {
      data['travelDto'] = this.travelDto!.toJson();
    }
    return data;
  }
}