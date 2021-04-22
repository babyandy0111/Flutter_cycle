import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/lifestyle/components/post.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_cycle/data/models/response/lifestyle_posts_entity.dart';

List<Post> posts = [
  Post(
      username: "Brianne",
      userImage:
      "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
      postImage:
      "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      caption: "Consequatur nihil aliquid omnis consequatur."),
  Post(
      username: "Henri",
      userImage:
      "https://s3.amazonaws.com/uifaces/faces/twitter/kevka/128.jpg",
      postImage:
      "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      caption: "Consequatur nihil aliquid omnis consequatur."),
  Post(
      username: "Mariano",
      userImage:
      "https://s3.amazonaws.com/uifaces/faces/twitter/ionuss/128.jpg",
      postImage:
      "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      caption: "Consequatur nihil aliquid omnis consequatur."),
  Post(
      username: "Johan",
      userImage:
      "https://s3.amazonaws.com/uifaces/faces/twitter/vinciarts/128.jpg",
      postImage:
      "https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      caption: "Consequatur nihil aliquid omnis consequatur."),
  Post(
      username: "London",
      userImage:
      "https://s3.amazonaws.com/uifaces/faces/twitter/ssiskind/128.jpg",
      postImage:
      "https://images.pexels.com/photos/247298/pexels-photo-247298.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      caption: "Consequatur nihil aliquid omnis consequatur."),
  Post(
      username: "Jada",
      userImage:
      "https://s3.amazonaws.com/uifaces/faces/twitter/areus/128.jpg",
      postImage:
      "https://images.pexels.com/photos/169191/pexels-photo-169191.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      caption: "Consequatur nihil aliquid omnis consequatur."),
  Post(
      username: "Crawford",
      userImage:
      "https://s3.amazonaws.com/uifaces/faces/twitter/oskarlevinson/128.jpg",
      postImage:
      "https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      caption: "Consequatur nihil aliquid omnis consequatur."),
];

Widget PostList(BuildContext context, { LifestylePostsEntity data }) {

  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: data != null && data.posts != null ? data.posts.length : posts.length,
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
                          image: data != null && data.posts != null ? NetworkImage("${data.posts[i].avatarUrl}") : AssetImage("assets/images/nick-fury.jpg"),
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Text(posts[i].username),
                    ],
                  ),
                  IconButton(
                    icon: Icon(SimpleLineIcons.options),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            FadeInImage(
              image: NetworkImage(data != null && data.posts != null ? data.posts[i].thumbnail[0] : posts[i].postImage),
              placeholder: AssetImage("assets/images/placeholder.png"),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),

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

            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
                    // TextSpan(
                    //   text: "Sigmund,",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.black),
                    // ),
                    // TextSpan(
                    //   text: " Yessenia,",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.black),
                    // ),
                    // TextSpan(
                    //   text: " Dayana",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.black),
                    // ),
                    // TextSpan(
                    //   text: " and",
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //   ),
                    // ),
                    TextSpan(
                      text: data != null && data.posts != null && data.posts[i].likeCount > 0 ? " ${data.posts[i].likeCount} others" : '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // caption
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
                      text: data != null && data.posts != null ? data.posts[i].nickname : posts[i].username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: " ${data != null && data.posts != null ? data.posts[i].abstract : posts[i].caption}",
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
                '${data != null && data.posts != null ? data.posts[i].createdAt : "Feb 20"}',
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