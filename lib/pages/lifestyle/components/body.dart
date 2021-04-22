import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/lifestyle/components/postlist.dart';

import 'package:flutter_cycle/pages/lifestyle/components/post.dart';
import 'package:flutter_cycle/pages/lifestyle/components/story.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_cycle/bloc/lifestyle.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override

  initState() {
    lifestylePostsBloc..getLifestylePosts();
  }

  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(),
            // posts
            Container(
              width: MediaQuery.of(context).size.width,
              child: PostList(context),
            ),
          ],
        ),
      ),
    );
  }

}