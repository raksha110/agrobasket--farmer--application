import 'package:AgroBasket/services/posts.dart';
import 'package:AgroBasket/util/button.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:AgroBasket/util/textfield.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddProgress extends StatefulWidget {
  String transactionId;
  AddProgress(this.transactionId);
  @override
  _AddProgressState createState() => _AddProgressState();
}

class _AddProgressState extends State<AddProgress> {
  String _imageFile;
  String stageName;
  bool isLoading = false;

  Future uploadImage() async {
    try {
      final image = await ImagePicker().getImage(source: ImageSource.gallery);
      setState(() {
        if (image != null) {
          _imageFile = base64Encode(File(image.path).readAsBytesSync());
        } else {
          _imageFile = "";
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Add Status",
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 22, height: 1),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
            child: Text(
              "Choose Image",
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton.icon(
              icon: Icon(Icons.cloud_upload),
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () => uploadImage(),
              color: black,
              textColor: white,
              label: Text(
                "Upload",
                style: GoogleFonts.nunitoSans(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField("Stage Name", (value) {
            print(value);
            setState(() {
              stageName = value;
            });
          }, false, TextCapitalization.sentences, false, false),
          SizedBox(
            height: 50,
          ),
          CustomButton("Submit", () async {
            dynamic data = await Posts()
                .uploadStage(_imageFile, stageName, widget.transactionId);
            print(data);
            if (data['msg'] == "Progress added") {
              Navigator.pop(context);
            }
          }),
        ],
      ),
    );
  }
}
