import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/add_opportunity.dart';
import 'package:shop_app/screens/home/components/job_list_tile.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';

import '../../../size_config.dart';

import 'home_banner.dart';
import 'home_header.dart';

List<Opportunities> opporValues = [
  Opportunities(
      equipment: "Table Tennis Racket(Click to see image)",
      url: "https://k9f7a9j9.rocketcdn.me/wp-content/uploads/2021/08/lisa-keffer-i0kB5B9J8Ds-unsplash.jpg",
      equipment_availability:
          "11am to 6pm, 11th March",
      Owner: "Aviral Nagpal"),
  Opportunities(
      equipment: "Cricket Bat (Click to see image)",
      url: "https://cdn.shopify.com/s/files/1/1390/1485/products/image_aacb3d0a-bed1-4265-99c5-5ec95dbf441b_large.jpg?v=1643292001",
      equipment_availability:
      "A full-time student in an accredited university degree at the time of the celebration sept 22,2022",
      Owner: "Rohan Mittal"),
  Opportunities(
      equipment: "Badminton Racket (Click to see image)",
      url: "https://cdn.shopify.com/s/files/1/1390/1485/products/image_aacb3d0a-bed1-4265-99c5-5ec95dbf441b_large.jpg?v=1643292001",
      equipment_availability:
      "A full-time student in an accredited university degree at the time of the celebration sept 22,2022",
      Owner: "abc"),
  Opportunities(
      equipment: "Cricket Bat",
      url: "https://cdn.shopify.com/s/files/1/1390/1485/products/image_aacb3d0a-bed1-4265-99c5-5ec95dbf441b_large.jpg?v=1643292001",
      equipment_availability:
      "A full-time student in an accredited university degree at the time of the celebration sept 22,2022",
      Owner: "abc2"),


];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            HomeBanner(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      height: 450,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Stack(children: [
        StreamBuilder<List<Opportunities>>(
          stream: opporStream(),
          builder: (context, snapshot) {
            return ListItemBuilder<Opportunities>(
              snapshot: snapshot,
              itemBuilder: (context, oppor) => JobListTile(
                oppor: oppor,
                // onTap: () => _showReport(context,report),
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          // add your floating action button
          child: Opacity(
            opacity: 0.6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: kPrimaryColor,
                onPressed: () =>
                    Navigator.pushNamed(context, AddOpportunity.routeName),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Stream<List<Opportunities>> opporStream() {
    return Stream.value(opporValues);
  }
}
