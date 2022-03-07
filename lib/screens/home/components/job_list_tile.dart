import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';
import 'package:url_launcher/url_launcher.dart';

class JobListTile extends StatelessWidget {
  // const JobListTile({Key? key}) : super(key: key);

  const JobListTile({required this.oppor});

  final Opportunities oppor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: kSecondaryColor.withOpacity(0.1),
        title: Center(
            child: Text(
          "${oppor.equipment}",
          textAlign: TextAlign.center,
        )),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Owner - ${oppor.Owner}'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Equipment Availability - '),

              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                ),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Owner notified successfully '),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('We have sent a notification to owner. They will contact you shortly'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Ok',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today_outlined),
                    SizedBox(width: 10),
                    Text(
                      "Notify owner",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        onTap: () => _launchURL(oppor.url),
      ),
    );
  }

  void _launchURL(String? url) async {
    if (url != null) {
      if (!await launch(url)) throw 'Could not launch $url';
    }
  }
}
