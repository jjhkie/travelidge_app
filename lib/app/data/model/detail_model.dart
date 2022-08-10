class DetailModel {
  BoardContents? boardContents;
  List<TravelMemberList>? travelMemberList;
  bool? recommendYn;
  List<ReplyList>? replyList;
  List<ReviewList>? reviewList;

  DetailModel(
      {this.boardContents,
        this.travelMemberList,
        this.recommendYn,
        this.replyList,
        this.reviewList});

  DetailModel.fromJson(Map<String, dynamic> json) {
    boardContents = json['boardContents'] != null
        ? new BoardContents.fromJson(json['boardContents'])
        : null;
    if (json['travelMemberList'] != null) {
      travelMemberList = <TravelMemberList>[];
      json['travelMemberList'].forEach((v) {
        travelMemberList!.add(new TravelMemberList.fromJson(v));
      });
    }
    recommendYn = json['recommendYn'];
    if (json['replyList'] != null) {
      replyList = <ReplyList>[];
      json['replyList'].forEach((v) {
        replyList!.add(new ReplyList.fromJson(v));
      });
    }
    if (json['reviewList'] != null) {
      reviewList = <ReviewList>[];
      json['reviewList'].forEach((v) {
        reviewList!.add(new ReviewList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.boardContents != null) {
      data['boardContents'] = this.boardContents!.toJson();
    }
    if (this.travelMemberList != null) {
      data['travelMemberList'] =
          this.travelMemberList!.map((v) => v.toJson()).toList();
    }
    data['recommendYn'] = this.recommendYn;
    if (this.replyList != null) {
      data['replyList'] = this.replyList!.map((v) => v.toJson()).toList();
    }
    if (this.reviewList != null) {
      data['reviewList'] = this.reviewList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BoardContents {
  int? docNo;
  int? userCode;
  String? userName;
  int? categoryNo;
  int? type;
  String? title;
  String? startTravelDate;
  String? endTravelDate;
  int? personnel;
  String? requirement;
  bool? isCost;
  int? cost;
  String? reasonCost;
  String? experience;
  int? estimatedTime;
  String? location;
  String? contents;
  String? thumbNailUrl;
  String? imageListUrl;
  String? createDate;
  String? countryCode;
  int? replyCount;
  int? recommendCount;
  int? hitCount;

  BoardContents(
      {this.docNo,
        this.userCode,
        this.userName,
        this.categoryNo,
        this.type,
        this.title,
        this.startTravelDate,
        this.endTravelDate,
        this.personnel,
        this.requirement,
        this.isCost,
        this.cost,
        this.reasonCost,
        this.experience,
        this.estimatedTime,
        this.location,
        this.contents,
        this.thumbNailUrl,
        this.imageListUrl,
        this.createDate,
        this.countryCode,
        this.replyCount,
        this.recommendCount,
        this.hitCount});

  BoardContents.fromJson(Map<String, dynamic> json) {
    docNo = json['docNo'];
    userCode = json['userCode'];
    userName = json['userName'];
    categoryNo = json['categoryNo'];
    type = json['type'];
    title = json['title'];
    startTravelDate = json['startTravelDate'];
    endTravelDate = json['endTravelDate'];
    personnel = json['personnel'];
    requirement = json['requirement'];
    isCost = json['isCost'];
    cost = json['cost'];
    reasonCost = json['reasonCost'];
    experience = json['experience'];
    estimatedTime = json['estimatedTime'];
    location = json['location'];
    contents = json['contents'];
    thumbNailUrl = json['thumbNailUrl'];
    imageListUrl = json['imageListUrl'];
    createDate = json['createDate'];
    countryCode = json['countryCode'];
    replyCount = json['replyCount'];
    recommendCount = json['recommendCount'];
    hitCount = json['hitCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docNo'] = this.docNo;
    data['userCode'] = this.userCode;
    data['userName'] = this.userName;
    data['categoryNo'] = this.categoryNo;
    data['type'] = this.type;
    data['title'] = this.title;
    data['startTravelDate'] = this.startTravelDate;
    data['endTravelDate'] = this.endTravelDate;
    data['personnel'] = this.personnel;
    data['requirement'] = this.requirement;
    data['isCost'] = this.isCost;
    data['cost'] = this.cost;
    data['reasonCost'] = this.reasonCost;
    data['experience'] = this.experience;
    data['estimatedTime'] = this.estimatedTime;
    data['location'] = this.location;
    data['contents'] = this.contents;
    data['thumbNailUrl'] = this.thumbNailUrl;
    data['imageListUrl'] = this.imageListUrl;
    data['createDate'] = this.createDate;
    data['countryCode'] = this.countryCode;
    data['replyCount'] = this.replyCount;
    data['recommendCount'] = this.recommendCount;
    data['hitCount'] = this.hitCount;
    return data;
  }
}

class TravelMemberList {
  int? travelNo;
  int? userNo;
  UserDto? userDto;
  int? userType;
  Null? promiseYn;
  String? acceptYn;
  String? acceptTime;
  String? createTime;
  String? userTypeEnum;

  TravelMemberList(
      {this.travelNo,
        this.userNo,
        this.userDto,
        this.userType,
        this.promiseYn,
        this.acceptYn,
        this.acceptTime,
        this.createTime,
        this.userTypeEnum});

  TravelMemberList.fromJson(Map<String, dynamic> json) {
    travelNo = json['travelNo'];
    userNo = json['userNo'];
    userDto =
    json['userDto'] != null ? new UserDto.fromJson(json['userDto']) : null;
    userType = json['userType'];
    promiseYn = json['promiseYn'];
    acceptYn = json['acceptYn'];
    acceptTime = json['acceptTime'];
    createTime = json['createTime'];
    userTypeEnum = json['userTypeEnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travelNo'] = this.travelNo;
    data['userNo'] = this.userNo;
    if (this.userDto != null) {
      data['userDto'] = this.userDto!.toJson();
    }
    data['userType'] = this.userType;
    data['promiseYn'] = this.promiseYn;
    data['acceptYn'] = this.acceptYn;
    data['acceptTime'] = this.acceptTime;
    data['createTime'] = this.createTime;
    data['userTypeEnum'] = this.userTypeEnum;
    return data;
  }
}

class UserDto {
  int? userCode;
  String? userId;
  String? userPassword;
  String? userName;
  String? createTime;

  UserDto(
      {this.userCode,
        this.userId,
        this.userPassword,
        this.userName,
        this.createTime});

  UserDto.fromJson(Map<String, dynamic> json) {
    userCode = json['userCode'];
    userId = json['userId'];
    userPassword = json['userPassword'];
    userName = json['userName'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userCode'] = this.userCode;
    data['userId'] = this.userId;
    data['userPassword'] = this.userPassword;
    data['userName'] = this.userName;
    data['createTime'] = this.createTime;
    return data;
  }
}

class ReplyList {
  int? replyNo;
  int? parentReplyNo;
  int? boardNo;
  int? boardType;
  int? userNo;
  String? content;
  String? createTime;
  String? isDelete;
  int? cntReReply;

  ReplyList(
      {this.replyNo,
        this.parentReplyNo,
        this.boardNo,
        this.boardType,
        this.userNo,
        this.content,
        this.createTime,
        this.isDelete,
        this.cntReReply});

  ReplyList.fromJson(Map<String, dynamic> json) {
    replyNo = json['replyNo'];
    parentReplyNo = json['parentReplyNo'];
    boardNo = json['boardNo'];
    boardType = json['boardType'];
    userNo = json['userNo'];
    content = json['content'];
    createTime = json['createTime'];
    isDelete = json['isDelete'];
    cntReReply = json['cntReReply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['replyNo'] = this.replyNo;
    data['parentReplyNo'] = this.parentReplyNo;
    data['boardNo'] = this.boardNo;
    data['boardType'] = this.boardType;
    data['userNo'] = this.userNo;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    data['isDelete'] = this.isDelete;
    data['cntReReply'] = this.cntReReply;
    return data;
  }
}

class ReviewList {
  int? reviewNo;
  Null? createUserNo;
  Null? createUserName;
  Null? publicScope;
  Null? title;
  Null? contents;
  Null? travelNo;
  Null? createDate;
  Null? heartCount;
  Null? replyCount;
  Null? location;
  String? imageThumbnailUrl;
  Null? imageListUrl;

  ReviewList(
      {this.reviewNo,
        this.createUserNo,
        this.createUserName,
        this.publicScope,
        this.title,
        this.contents,
        this.travelNo,
        this.createDate,
        this.heartCount,
        this.replyCount,
        this.location,
        this.imageThumbnailUrl,
        this.imageListUrl});

  ReviewList.fromJson(Map<String, dynamic> json) {
    reviewNo = json['reviewNo'];
    createUserNo = json['createUserNo'];
    createUserName = json['createUserName'];
    publicScope = json['publicScope'];
    title = json['title'];
    contents = json['contents'];
    travelNo = json['travelNo'];
    createDate = json['createDate'];
    heartCount = json['heartCount'];
    replyCount = json['replyCount'];
    location = json['location'];
    imageThumbnailUrl = json['imageThumbnailUrl'];
    imageListUrl = json['imageListUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewNo'] = this.reviewNo;
    data['createUserNo'] = this.createUserNo;
    data['createUserName'] = this.createUserName;
    data['publicScope'] = this.publicScope;
    data['title'] = this.title;
    data['contents'] = this.contents;
    data['travelNo'] = this.travelNo;
    data['createDate'] = this.createDate;
    data['heartCount'] = this.heartCount;
    data['replyCount'] = this.replyCount;
    data['location'] = this.location;
    data['imageThumbnailUrl'] = this.imageThumbnailUrl;
    data['imageListUrl'] = this.imageListUrl;
    return data;
  }
}