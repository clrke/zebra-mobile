import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/appButton.dart';
import 'package:zero_mobile/components/appButtonOutline.dart';
import 'package:zero_mobile/components/appCaptionField.dart';
import 'package:zero_mobile/components/profileIcon.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/providers/PollProvider.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';
import 'package:zero_mobile/utils/dialog.dart';
import 'package:path/path.dart' as path;
import 'package:zero_mobile/utils/utils.dart';

class CreatePostForm extends StatefulWidget {

  final ValueChanged onSubmit;

  CreatePostForm({this.onSubmit});

  @override
  _CreatePostFormState createState() => _CreatePostFormState(onSubmit: onSubmit);
}

class _CreatePostFormState extends State<CreatePostForm> {
  final _formKey = GlobalKey<FormState>();
  final _captionController = TextEditingController();
  final Function(String) onSubmit;

  String _anteriorError;
  String _posteriorError;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _captionController.dispose();
    _posteriorError = null;
    _anteriorError = null;
  }

  _CreatePostFormState({@required this.onSubmit});

  final ImagePicker _picker = ImagePicker();

  postAction() {
    onSubmit(_captionController.value.text);
  }

  yesAction({@required String type}) async{
    if (type == 'anterior') {
      Provider.of<PollProvider>(context,listen: false).anteriorRemovePhoto();
      await PollRepository.savePhoto(photos: null,type: 'anterior_photo');
    }

    if (type == 'posterior') {
      Provider.of<PollProvider>(context,listen: false).posteriorRemovePhoto();
      await PollRepository.savePhoto(photos: null,type: 'posterior_photo');
    }
  }

  noAction(){

  }

  uploadPhoto({@required type}) async{
    final imageFormats = ['.jpeg','.jpg','.png'];

    final pickedFile = await _picker.getImage(source: ImageSource.gallery,);
    final bool isFileSize = (File(pickedFile.path).lengthSync() > 10000000);
    final isImage = imageFormats.contains(path.extension(pickedFile.path));
    final compressedImage = await Utils.imageCompression(file: pickedFile);

    if (type == 'anterior') {
      if(!isImage){
        setState(() {
          _anteriorError = 'File extension must be (.jpeg,jpg or .png) only';
        });
        return;
      }
      if(isFileSize) {
        setState(() {
          _anteriorError = 'File must be not greater than 10mb';
        });
        return;
      }
      Provider.of<PollProvider>(context,listen: false).anteriorAddPhoto(imageFile: compressedImage);
      Provider.of<PollProvider>(context,listen: false).anteriorUploadType(uploadType:'gallery');
      Provider.of<PollProvider>(context,listen: false).setPhotoSelected(photo:'anterior');
      await PollRepository.savePhoto(photos: compressedImage,type: 'anterior_photo');
    }

    if (type == 'posterior') {
      if(!isImage){
        setState(() {
          _posteriorError = 'File extension must be (.jpeg,jpg or .png) only';
        });
        return;
      }
      if(isFileSize) {
        setState(() {
          _posteriorError = 'File must be not greater than 10mb';
        });
        return;
      }
      Provider.of<PollProvider>(context,listen: false).posteriorAddPhoto(imageFile: compressedImage);
      Provider.of<PollProvider>(context,listen: false).posteriorUploadType(uploadType:'gallery');
      Provider.of<PollProvider>(context,listen: false).setPhotoSelected(photo:'posterior');
      await PollRepository.savePhoto(photos: compressedImage,type: 'posterior_photo');
    }
  }

  takePhoto({@required type})async{
    final imageFormats = ['.jpeg','.jpg','.png'];

    final pickedFile = await _picker.getImage(source: ImageSource.camera,);
    final bool isFileSize = (File(pickedFile.path).lengthSync() > 10000000);
    final isImage = imageFormats.contains(path.extension(pickedFile.path));
    final compressedImage = await Utils.imageCompression(file: pickedFile);

    if (type == 'anterior') {
      Navigator.pushReplacementNamed(context, '/camera-viewer');
      if(!isImage){
        setState(() {
          _anteriorError = 'File extension must be (.jpeg,jpg or .png) only';
        });
        return;
      }
      if(isFileSize) {
        setState(() {
          _anteriorError = 'File must be not greater than 10mb';
        });
        return;
      }
      Provider.of<PollProvider>(context,listen: false).anteriorAddPhoto(imageFile: compressedImage);
      Provider.of<PollProvider>(context,listen: false).anteriorUploadType(uploadType:'camera');
      Provider.of<PollProvider>(context,listen: false).setPhotoSelected(photo:'anterior');
      await PollRepository.savePhoto(photos: compressedImage,type: 'anterior_photo');
    }

    if (type == 'posterior') {
      Navigator.pushReplacementNamed(context, '/camera-viewer');
      if(!isImage){
        setState(() {
          _posteriorError = 'File extension must be (.jpeg,jpg or .png) only';
        });
        return;
      }
      if(isFileSize) {
        setState(() {
          _posteriorError = 'File must be not greater than 10mb';
        });
        return;
      }
      Provider.of<PollProvider>(context,listen: false).posteriorAddPhoto(imageFile: compressedImage);
      Provider.of<PollProvider>(context,listen: false).posteriorUploadType(uploadType:'camera');
      Provider.of<PollProvider>(context,listen: false).setPhotoSelected(photo:'posterior');
      await PollRepository.savePhoto(photos: compressedImage,type: 'posterior_photo');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final fontSize = height * 0.025;
    final anteriorPhoto = Provider.of<PollProvider>(context,listen: true).anteriorPhoto;
    final posteriorPhoto = Provider.of<PollProvider>(context,listen: true).posteriorPhoto;
    final photos = (anteriorPhoto != null && posteriorPhoto != null);

    return Form(
      key: _formKey,
      child: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.55,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            ProfileIcon(size: width * 0.10,),
                            SizedBox(width: 12.0,),
                            Text(
                              'ID 1234567890',
                              style: TextStyle(
                                color: theme['secondary'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    photos ? Container(
                      child: ElevatedButton(
                          onPressed: postAction,
                          child: Text('Post'),
                          style: ElevatedButton.styleFrom(
                            primary: theme['secondary'],
                            padding: EdgeInsets.symmetric(horizontal:27.0,vertical: 12.0),
                            elevation: 20,
                            shadowColor: Colors.black,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize,
                            ),
                          )
                      ),
                    ) : Container()
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                AppCaptionField(
                  controller: _captionController,
                  hintText: 'Ask your co-surgeons...',
                  fillColor: Colors.grey[400],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Container(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                             child: Row(
                                children: [
                                  Text('Anterior View',style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),),
                                  SizedBox(width: 20.0,),
                                  _anteriorError !=null ? (
                                      Text('$_anteriorError',style: TextStyle(fontSize: height * 0.02,color: Colors.red,fontWeight: FontWeight.bold),)
                                  ) : Container()
                                ],
                              ),
                            ),
                            anteriorPhoto !=null ? Container(
                              width: width,
                              height: height * 0.40,
                              color: Colors.redAccent.withOpacity(0.3),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Positioned(
                                    child: Image.file(
                                      File(anteriorPhoto.path.toString()),
                                      width: width,
                                      height: height * 0.40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    width: 70,
                                    height:650,
                                    bottom: 0,
                                    child: IconButton(
                                      icon: Icon(Icons.minimize),
                                      iconSize: 50,
                                      onPressed: (){
                                        Dialogs.confirmationDialog(
                                            context: context,
                                            content: '',
                                            title: 'Are you sure you want to delete?',
                                            noAction:noAction,
                                            yesAction: ()=>yesAction(type: 'anterior')
                                        );
                                      },
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Positioned(
                                    width: 70,
                                    height: 50,
                                    bottom: 0,
                                    child: IconButton(
                                      icon: Icon(Icons.edit),
                                      iconSize: 30,
                                      onPressed: (){
                                        final String uploadType = Provider.of<PollProvider>(context,listen: false).anteriorPhotoUploadType;
                                        if(uploadType == 'gallery') {
                                          uploadPhoto(type: 'anterior');
                                        } else {
                                          takePhoto(type: 'anterior');
                                        }
                                      },
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ) : Container(
                              width: width,
                              color: Colors.redAccent.withOpacity(0.3),
                              padding: EdgeInsets.all(27.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: <Widget>[
                                    AppButton(
                                        onPressed: (){
                                          takePhoto(type: 'anterior');
                                        },
                                        text: 'Take a Photo',
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.06,
                                            vertical: height * 0.015
                                        )
                                    ),
                                    SizedBox(width: 20.0,),
                                    AppButtonOutline(
                                        onPressed: (){
                                          uploadPhoto(type: 'anterior');
                                        },
                                        text: 'Upload a Photo',
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.06,
                                            vertical: height * 0.015
                                        )
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 32.0,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Row(
                                children: [
                                  Text('Posterior View',style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),),
                                  SizedBox(width: 20.0,),
                                  _posteriorError !=null ? (
                                      Text('$_posteriorError',style: TextStyle(fontSize: height * 0.02,color: Colors.red,fontWeight: FontWeight.bold),)
                                  ) : Container()
                                ],
                              ),
                            ),
                            posteriorPhoto !=null ? Container(
                              width: width,
                              height: height * 0.40,
                              color: Colors.redAccent.withOpacity(0.3),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Positioned(
                                    child: Image.file(
                                      File(posteriorPhoto.path.toString()),
                                      width: width,
                                      height: height * 0.40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    width: 70,
                                    height:650,
                                    bottom: 0,
                                    child: IconButton(
                                      icon: Icon(Icons.minimize),
                                      iconSize: 50,
                                      onPressed: (){
                                        Dialogs.confirmationDialog(
                                            context: context,
                                            content: '',
                                            title: 'Are you sure you want to delete?',
                                            noAction:noAction,
                                            yesAction: ()=>yesAction(type: 'posterior')
                                        );
                                      },
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Positioned(
                                    width: 70,
                                    height: 50,
                                    bottom: 0,
                                    child: IconButton(
                                      icon: Icon(Icons.edit),
                                      iconSize: 30,
                                      onPressed: (){
                                        final String uploadType = Provider.of<PollProvider>(context,listen: false).posteriorPhotoUploadType;
                                        if(uploadType == 'gallery') {
                                          uploadPhoto(type: 'posterior');
                                        } else {
                                          takePhoto(type: 'posterior');
                                        }
                                      },
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ) : Container(
                              width: width,
                              color: Colors.redAccent.withOpacity(0.3),
                              padding: EdgeInsets.all(27.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: <Widget>[
                                    AppButton(
                                        onPressed: (){
                                          takePhoto(type: 'posterior');
                                        },
                                        text: 'Take a Photo',
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.06,
                                            vertical: height * 0.015
                                        )
                                    ),
                                    SizedBox(width: 20.0,),
                                    AppButtonOutline(
                                        onPressed: (){
                                          uploadPhoto(type: 'posterior');
                                        },
                                        text: 'Upload a Photo',
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.06,
                                            vertical: height * 0.015
                                        )
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
