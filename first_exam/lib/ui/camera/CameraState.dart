
import 'dart:async';
import 'dart:io';
import 'package:first_exam/data/ResDimen.dart';
import 'package:first_exam/ui/camera/CameraFragment.dart';
import 'package:first_exam/ui/gallery/GalleryFragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';

/// plugins:
/// Camera: https://pub.dartlang.org/packages/camera
/// Path provider: https://pub.dartlang.org/packages/path_provider
/// simple permission: https://pub.dartlang.org/packages/simple_permissions
class CameraState extends State<CameraFragment> {
  final GlobalKey<ScaffoldState> mScaffoldKey = new GlobalKey<ScaffoldState>();
  bool isReady = false;
  CameraController mController;
  List<CameraDescription> mCameras;
  String newestImage;
  @override
  Widget build(BuildContext context) {
    if (mController == null || !mController.value.isInitialized) {
      return new Container();
    }

    Widget cameraPreview = new AspectRatio(
        aspectRatio: mController.value.aspectRatio,
        child: new CameraPreview(mController));

    return new Scaffold(
      key: mScaffoldKey,
      backgroundColor: Colors.black,
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[cameraPreview, new Expanded(child: getCameraActions())],
      )
    );
  }

  Widget getCameraActions() {
    Widget actOpenGallery = newestImage == null ?
    new IconButton(icon: new Icon(Icons.picture_in_picture, color: Colors.white,),
        iconSize: SIZE_ICON_ACTION *2/3,
        onPressed: onTabOpenGallery) :
    new GestureDetector(
      onTap: onTabOpenGallery,
      child: new Container(
        width: SIZE_ICON_ACTION,
        height: SIZE_ICON_ACTION,
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            image: new AssetImage(newestImage),
            fit: BoxFit.cover,
          ),
          borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          border: new Border.all(
            color: Colors.white,
            width: 1.0,
          ),
        ),
      ),
    );

    Widget actTakePicture = new IconButton(
      icon: new Icon(Icons.camera_alt, color: Colors.white,),
      iconSize: SIZE_ICON_ACTION,
      onPressed: onClickTakingPicture,);

    Widget actVideo = new IconButton(
      icon: new Icon(Icons.video_call, color: Colors.white,),
      iconSize: SIZE_ICON_ACTION*2/3,
      onPressed: null
    );

    return new Container(
      child: new Center(child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[actOpenGallery, actTakePicture, actVideo],
      ),),
    );
  }

  void onTabOpenGallery() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryFragment()));
  }

  void onClickTakingPicture() {
    takePicture().then((imgPath){
      if(mounted) {
        setState(() {
          newestImage = imgPath;
        });
      }
    });
  }

  Future<bool> checkAndRequestPermission(Permission permission) async {
    if(await SimplePermissions.checkPermission(permission)) {
      return true;
    }else {
      return await SimplePermissions.requestPermission(permission);
    }
  }

  Future<bool> checkPermissions(Permission permission) async {
    return SimplePermissions.checkPermission(permission);
  }

  Future<bool> requestPermissions(Permission permission) async {
    return SimplePermissions.requestPermission(permission);
  }

  @override
  void initState() {
    super.initState();
    checkAndRequestPermission(Permission.WriteExternalStorage).then((isGranted) {
      if(isGranted) {
        setupCameras();
      }else {

      }
    });
  }

  @override
  void dispose() {
    mController.dispose();
    super.dispose();
  }

  Future<void> setupCameras() async {
    try {
      // initialize cameras.
      mCameras = await availableCameras();
      // initialize camera controllers.
      mController = new CameraController(mCameras[0], ResolutionPreset.high);
      await mController.initialize();
    } on CameraException catch (_) {
      print("camera ex");
    }
    if (!mounted) return;
    setState(() {
      isReady = true;
    });
  }

  Future<String> takePicture() async {
    if (!mController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getExternalStorageDirectory();
    final String dirPath = '${extDir.path}/Pictures';
    await new Directory(dirPath).create(recursive: true);
    String filePath = '$dirPath/img_flutter_${timestamp()}.jpg';

    if (mController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      showInSnackBar(" A capture is already pending, do nothing.");
      return null;
    }

    try {
      await mController.takePicture(filePath);
    } on CameraException catch (e) {
      showInSnackBar(e.description);
      return null;
    }
    return filePath;
  }

  String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    mScaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(message)));
  }
}