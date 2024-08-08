import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
class EditProfilePicController extends GetxController{
  Future<File?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(source: source);
    if (imageFile != null) {
      return File(imageFile.path);
    }
    return null;
  }

  Future<void> cropimage(
      {required String? source, required BuildContext context}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: source.toString(),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        // CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        // CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    var finalImage = croppedFile!.path;
    Fluttertoast.showToast(msg: "${finalImage.toString()}");
    print("final img$finalImage");
    if (finalImage != null) {
      // await updateArtistProfilePic(imgPath: '$finalImage');
      // await fetchDashBoardDetails();
    }
  }


  // final profilePicModel = ProfilePicModel().obs;
  //
  // Future<void> updateArtistProfilePic({required String imgPath}) async {
  //   var artistId = GetStorage().read('artidtid');
  //   final uri = Uri.parse(API().baseURL1 + API().updateprofile);
  //   var request = http.MultipartRequest('POST', uri);
  //   request.headers.addAll(
  //     {
  //       "Content-Type": "application/x-www-form-urlencoded",
  //     },
  //   );
  //   request.fields["api_key"] = API().gapikey;
  //   request.fields["artist_id"] = artistId;
  //   if (imgPath != null) {
  //     var profileim = await http.MultipartFile.fromPath("profile", imgPath);
  //     request.files.add(profileim);
  //     print('object' + profileim.toString());
  //   }
  //
  //   var response = await request.send();
  //   var responseData = await response.stream.bytesToString();
  //   var decodedData = json.decode(responseData);
  //   profilePicModel(ProfilePicModel.fromJson(decodedData));
  //   if (response.statusCode == 200) {
  //     if (profilePicModel.value.status == true) {
  //       Fluttertoast.showToast(
  //           msg: artistEditProfileModel.value.message.toString());
  //     } else if (profilePicModel.value.status == false) {
  //       Fluttertoast.showToast(
  //           msg: artistEditProfileModel.value.message.toString());
  //     }
  //   }
  // }
}