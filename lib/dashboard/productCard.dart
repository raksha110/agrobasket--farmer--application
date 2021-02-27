import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final String imageURL;
  final String companyName;
  final String cropName;
  final int duration;
  final int price;
  final Function onTap;
  ProductCard(this.cropName, this.companyName, this.imageURL, this.duration,
      this.price, this.onTap);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
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
            padding: const EdgeInsets.fromLTRB(2.5, 5, 2.5, 5),
            child: Row(
              children: [
                Image.network(
                  widget.imageURL,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                        Text(
                          "${widget.duration} Months Contract",
                          softWrap: true,
                          style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 0.95)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Rs. ${widget.price}",
                              style: GoogleFonts.nunitoSans(
                                  color: primary_green,
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800))),
                          TextSpan(
                              text: " / unit",
                              style: GoogleFonts.nunitoSans(
                                  color: black,
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)))
                        ]))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
