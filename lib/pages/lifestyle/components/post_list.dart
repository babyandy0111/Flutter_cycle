import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_cycle/data/models/response/lifestyle_posts_entity.dart';
import 'post.dart';

Widget PostList(BuildContext context, {LifestylePostsEntity data}) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: data.posts.length,
    itemBuilder: (ctx, i) {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image(
                          image: data.posts[i].avatarUrl != null
                              ? NetworkImage("${data.posts[i].avatarUrl}")
                              : AssetImage("assets/images/nick-fury.jpg"),
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(data.posts[i].nickname),
                    ],
                  ),
                  IconButton(
                    icon: Icon(SimpleLineIcons.options),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Post(context, data.posts[i].thumbnail),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesome.heart_o),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesome.comment_o),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesome.send_o),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesome.bookmark_o),
                ),
              ],
            ),

            data.posts[i].likeCount > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    child: RichText(
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Liked By ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "${data.posts[i].likeCount} others",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),

            // caption
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 5,
              ),
              child: RichText(
                softWrap: true,
                overflow: TextOverflow.visible,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: data.posts[i].nickname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: " ${data.posts[i].abstract}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // post date
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 14,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                '${data.posts[i].createdAt}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
