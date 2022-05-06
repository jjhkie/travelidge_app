class home {
  HomeList? homeList;

  home({this.homeList});

  home.fromJson(Map<String, dynamic> json) {
    homeList = json['homeList'] != null
        ? new HomeList.fromJson(json['homeList'])
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

class HomeList {
  List<PopularLocalList>? popularLocalList;
  List<RecentTravelList>? recentTravelList;
  List<CategoryList>? categoryList;
  List<FriendList>? friendList;

  HomeList(
      {this.popularLocalList,
        this.recentTravelList,
        this.categoryList,
        this.friendList});

  HomeList.fromJson(Map<String, dynamic> json) {
    if (json['popularLocalList'] != null) {
      popularLocalList = <PopularLocalList>[];
      json['popularLocalList'].forEach((v) {
        popularLocalList!.add(new PopularLocalList.fromJson(v));
      });
    }
    if (json['recentTravelList'] != null) {
      recentTravelList = <RecentTravelList>[];
      json['recentTravelList'].forEach((v) {
        recentTravelList!.add(new RecentTravelList.fromJson(v));
      });
    }
    if (json['categoryList'] != null) {
      categoryList = <CategoryList>[];
      json['categoryList'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
    if (json['friendList'] != null) {
      friendList = <FriendList>[];
      json['friendList'].forEach((v) {
        friendList!.add(new FriendList.fromJson(v));
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

class PopularLocalList {
  int? localNo;
  String? preTitle;
  String? postTitle;
  String? thumbnailUrl;

  PopularLocalList(
      {this.localNo, this.preTitle, this.postTitle, this.thumbnailUrl});

  PopularLocalList.fromJson(Map<String, dynamic> json) {
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

class RecentTravelList {
  int? travelNo;
  String? thumbnailUrl;
  String? title;
  String? type;
  int? partyCount;
  int? partyMaxCount;

  RecentTravelList(
      {this.travelNo,
        this.thumbnailUrl,
        this.title,
        this.type,
        this.partyCount,
        this.partyMaxCount});

  RecentTravelList.fromJson(Map<String, dynamic> json) {
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

class CategoryList {
  int? categoryNo;
  String? title;
  String? thumbnailUrl;

  CategoryList({this.categoryNo, this.title, this.thumbnailUrl});

  CategoryList.fromJson(Map<String, dynamic> json) {
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

class FriendList {
  int? userNo;
  String? thumbnailUrl;
  RecentTravelList? travelDto;

  FriendList({this.userNo, this.thumbnailUrl, this.travelDto});

  FriendList.fromJson(Map<String, dynamic> json) {
    userNo = json['user_no'];
    thumbnailUrl = json['thumbnailUrl'];
    travelDto = json['travelDto'] != null
        ? new RecentTravelList.fromJson(json['travelDto'])
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