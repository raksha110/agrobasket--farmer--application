import 'package:AgroBasket/cropStatus/addProgress.dart';
import 'package:AgroBasket/cropStatus/cropStatusCard.dart';
import 'package:AgroBasket/cropStatus/viewProgress.dart';
import 'package:AgroBasket/services/posts.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CropStatus extends StatefulWidget {
  @override
  _CropStatusState createState() => _CropStatusState();
}

class _CropStatusState extends State<CropStatus> {
  Future<Object> _transactions;

  @override
  void initState() {
    _transactions = Posts().getCropStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
      child: FutureBuilder(
        future: _transactions,
        builder: (ctxt, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (listContext, index) {
                dynamic data = snapshot.data[index];
                print(data['post']['duration']);
                return CropStatusCard(
                  data['crop'][0]['cropImage'],
                  data['company'][0]['companyName'],
                  data['crop'][0]['cropName'],
                  data['price'],
                  data['unit'],
                  data['post']['duration'],
                  data['createdDate'],
                  data['post']['startMonth'],
                  () {
                    //Add
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return AddProgress(
                            data['progress'][0]['transactionId']);
                      },
                    );
                  },
                  () {
                    //View
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      context: context,
                      builder: (BuildContext buildContext) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          padding: EdgeInsets.fromLTRB(2.5, 20, 2.5, 5),
                          child: Column(
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    "View Progress",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 22,
                                          height: 1),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ViewProgress(data['progress']),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
