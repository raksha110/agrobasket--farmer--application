import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class CropStatusCard extends StatefulWidget {
  final String cropURL;
  final String companyName;
  final String cropName;
  final int units;
  final int price;
  final int duration;
  final String createdDate;
  final String startMonth;
  final Function addProgress;
  final Function viewProgress;

  CropStatusCard(
      this.cropURL,
      this.companyName,
      this.cropName,
      this.price,
      this.units,
      this.duration,
      this.createdDate,
      this.startMonth,
      this.addProgress,
      this.viewProgress);

  @override
  _CropStatusCardState createState() => _CropStatusCardState();
}

class _CropStatusCardState extends State<CropStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: grey, width: 0.75),
        borderRadius: BorderRadius.circular(10),
        color: white,
        boxShadow: [
          BoxShadow(offset: Offset(0, 5), blurRadius: 10, color: grey)
        ],
      ),
      margin: EdgeInsets.fromLTRB(1, 10, 1, 10),
      child: Padding(
        padding: EdgeInsets.fromLTRB(2.5, 5, 2.5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  widget.cropURL,
                  height: 85,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2.5, 10, 2.5, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.companyName,
                          softWrap: true,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                height: 1),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.cropName,
                          softWrap: true,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 1),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Units : " + widget.units.toString(),
                          softWrap: true,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 1),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Price : " + widget.price.toString() + " Rs.",
                          softWrap: true,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 1),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Total Amount : " +
                              (widget.units * widget.price).toString() +
                              " Rs.",
                          softWrap: true,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            //Actions
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: black,
                boxShadow: [
                  BoxShadow(offset: Offset(0, 5), blurRadius: 10, color: grey)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    padding: EdgeInsets.all(2.5),
                    onPressed: widget.addProgress,
                    child: Column(
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: white,
                          size: 22,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Upload Progress',
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(2.5),
                    onPressed: widget.viewProgress,
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: white,
                          size: 22,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'View Progress',
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
