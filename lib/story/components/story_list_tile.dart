import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/story/components/stories.dart';

class StoryListTile extends StatelessWidget {
  // const StoryListTile({Key? key}) : super(key: key);

  const StoryListTile({required this.story});

  final Stories story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        onTap: (){},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: kSecondaryColor.withOpacity(0.1),
        title: Center(
            child: Text(
          "${story.name}",
          textAlign: TextAlign.center,
        )),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Author: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${story.company}",
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Organization: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${story.company}",
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("${story.story}"),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Tags - ',style: TextStyle(fontWeight: FontWeight.bold)),
                Flexible(child: Text(story.tags)),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${story.upvotes}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                SizedBox(width: 5),
                Icon(Icons.thumb_up_alt),
                SizedBox(width: 15),
                Text('${story.downvotes}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                SizedBox(width: 5),
                Icon(Icons.thumb_down_alt),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
