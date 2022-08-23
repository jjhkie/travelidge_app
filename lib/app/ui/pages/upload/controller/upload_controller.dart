

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:travelidge/app/data/model/review_model.dart';
import 'package:travelidge/app/data/repository/user_repository.dart';
import 'package:travelidge/app/routes/app_routes.dart';
import 'package:travelidge/app/ui/pages/upload/page/upload_description_page.dart';

class UploadController extends GetxController {
  UploadController(this._repository);
  final UserRepository _repository;

  var albums= <AssetPathEntity>[];
  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  Rx<AssetEntity> selectedImage = AssetEntity(id: '0', typeInt: 0, width: 0, height: 0).obs;
  TextEditingController textEditingController = TextEditingController();
  File? file;

  @override
  void onInit() {
    super.onInit();
    loadPhoto();
  }


  loadPhoto() async {

    var result = await PhotoManager.requestPermissionExtend();

    if (result.isAuth) {
      //권한이 있다면 실행
      albums = await PhotoManager.getAssetPathList(type: RequestType.image,
          filterOption: FilterOptionGroup(
              imageOption: FilterOption(sizeConstraint: SizeConstraint(
                  minHeight: 100, minWidth: 100),
              ),orders: [OrderOption(type: OrderOptionType.createDate, asc: false)]));
      loadData();
    } else {
      //권한이 없다면 요청
      print('권한이 없네..');
      await PhotoManager.openSetting();
    }
  }

  loadData() async{
    await pagingPhotos();
  }

  Future<void> pagingPhotos() async{
    var photos = await albums.first.getAssetListPaged(page: 0, size: 30);
    imageList.addAll(photos);
    changeSelectedImage(imageList.first);
  }

  changeSelectedImage(AssetEntity image){
    selectedImage(image);
  }

  nextPage() async{
    file = await selectedImage.value.file;
    Get.to(() => uploadDescriptionPage(), transition: Transition.rightToLeftWithFade);
  }

  backPage() {
    Get.back();
  }

  unfocusKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }

  uploadPost() async{
    print('실행');
    unfocusKeyboard();
    Review data = Review(createUserNo: 1,reviewNo:100,imageThumbnailUrl: "abceeeeeeeee");
    await _repository.putUserReview(data);
    //Get.off(User());
    Get.toNamed(Routes.INITIAL);
    //Get.back(result: true);
    Get.delete<UploadController>();
  }
}