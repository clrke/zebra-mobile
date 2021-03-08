import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/appButton.dart';
import 'package:zero_mobile/components/appButtonOutline.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import 'package:zero_mobile/providers/PollProvider.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';
import 'package:zero_mobile/utils/utils.dart';

class CameraViewer extends StatefulWidget {
  @override
  _CameraViewerState createState() => _CameraViewerState();
}

class _CameraViewerState extends State<CameraViewer> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<HomeProvider>(context,listen: false).changeTitle(title:'Take a Photo');
    });
  }

  changePhoto({@required String type}) async{
    final PickedFile pickedFile = await _picker.getImage(source: ImageSource.camera);
    final compressedImage = await Utils.imageCompression(file: pickedFile);

    if (type == 'anterior') {
      Provider.of<PollProvider>(context,listen: false).anteriorAddPhoto(imageFile: compressedImage);
      await PollRepository.savePhoto(photos: compressedImage,type: 'anterior_photo');
    }

    if (type == 'posterior') {
      Provider.of<PollProvider>(context,listen: false).posteriorAddPhoto(imageFile: compressedImage);
      await PollRepository.savePhoto(photos: compressedImage,type: 'posterior_photo');
    }
  }

  confirmedPhoto({@required String type}) async{
    Navigator.pushReplacementNamed(context, '/post');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final anteriorPhoto = Provider.of<PollProvider>(context,listen: true).anteriorPhoto;
    final posteriorPhoto  = Provider.of<PollProvider>(context,listen: true).posteriorPhoto;
    var photo;
    final currentPhotoSelected = Provider.of<PollProvider>(context,listen: true).currentPhotoSelected;

    if(currentPhotoSelected == 'anterior') {
      photo = anteriorPhoto;
    }

    if(currentPhotoSelected == 'posterior') {
      photo = posteriorPhoto;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: width * 0.90,
            height: height * 0.50,
            color: Colors.redAccent.withOpacity(0.3),
            child: Center(
              child: Image.file(
                File(photo.path.toString()),
                width: width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AppButton(
                    onPressed: (){
                      changePhoto(type: currentPhotoSelected);
                    },
                    text: 'Change',
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.06,
                        vertical: height * 0.015
                    )
                ),
                SizedBox(width: 20.0,),
                AppButtonOutline(
                    onPressed: (){
                      if(anteriorPhoto!=null) {
                        confirmedPhoto(type: currentPhotoSelected);
                      } else {
                        confirmedPhoto(type: currentPhotoSelected);
                      }
                    },
                    text: 'Confirm',
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.06,
                        vertical: height * 0.015
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

