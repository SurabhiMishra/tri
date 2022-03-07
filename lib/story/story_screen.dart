import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/story/components/add_story.dart';
import 'package:shop_app/story/components/story_list_tile.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/story/components/stories.dart';

List<Stories> storyValues = [
  Stories(
      name: "Slim to fit",
      company: "Rahul",
      by: " Rahul  ",
      story:
          "I was always a very slim guy and I used to think that Gymming and fitness is only needed to reduce weight, Until one day I had to rush to Hospital for my detoriatig health...\n(click to read more)",
      upvotes: 8,
      downvotes: 3,
      tags: "#Health "),
  Stories(
      name: "Bullied by classmates",
      company: "Lavish",
      by: "Lavish  ",
      story:
          "I used to a very fat during my college days.My friends used to call me by names and talk very rudely to me.I really wanted to prove myself....(click to read more)",
      upvotes: 12,
      downvotes: 1,
      tags: "#workculture  "),
  Stories(
      name: "My gymming journey",
      company: "Priya",
      by: "Priya",
      story:
          "I never realized gymming was my passion until very recently. I still remember, the first day I went to the gym I was super nervous....\n(click to read more)",
      upvotes: 14,
      downvotes: 1,
      tags: "#Gymming "),
];

class StoryScreen extends StatefulWidget {
  static String routeName = "/story";

  const StoryScreen({Key? key}) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContents(context),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.story),
    );
  }
}

Widget _buildContents(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(40)),
        HomeHeader(),
        Container(
          // height: 90,
          width: double.infinity,
          margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF009E60),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "Fitness Journeys",
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 490,
          margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),0,getProportionateScreenWidth(20),0),
          child: Stack(children: [
            StreamBuilder<List<Stories>>(
              stream: storyStream(),
              builder: (context, snapshot) {
                return ListItemBuilder<Stories>(
                  snapshot: snapshot,
                  itemBuilder: (context, oppor) => StoryListTile(
                    story: oppor,
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
                        Navigator.pushNamed(context, AddStory.routeName),
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

Stream<List<Stories>> storyStream() {
  return Stream.value(storyValues);
}
