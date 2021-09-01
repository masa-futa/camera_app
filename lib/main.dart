

import 'package:camera_app/map_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        home: MainAppStateFul()
    );
  }
}

class MainAppStateFul extends StatefulWidget {
  MainAppState createState() => MainAppState();

}

class MainAppState extends State<MainAppStateFul> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カメラ"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("カメラ起動"),
                onPressed: () {
                  getImage();
                },
              ),
              RaisedButton(
                child: Text("ライブラリ起動"),
                onPressed: () {
                  // _getPhoto();
                  loadAssets();
                },
              ),
              RaisedButton(
                  child: Text("マップ表示"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return MapView();
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
  }
  /// 1枚のみ取得時
  Future _getPhoto() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
  }

  List<Asset> images = <Asset>[];

  /// 複数取得時
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
  }
}