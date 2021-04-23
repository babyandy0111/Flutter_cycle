import 'package:flutter/material.dart';
import 'package:flutter_cycle/bloc/lifestyle.dart';
import 'package:flutter_cycle/data/models/response/lifestyle_posts_entity.dart';
import 'package:flutter_cycle/widegets/bloc_common_widget.dart';
import 'package:flutter_cycle/pages/lifestyle/components/post_list.dart';

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
              child: StreamBuilder<LifestylePostsEntity>(
                stream: lifestylePostsBloc.subject.stream,
                builder: (context, AsyncSnapshot<LifestylePostsEntity> snapshot) {
                  if (snapshot.hasData && snapshot.data.posts.length > 0) {
                    return PostList(context, data: snapshot.data);
                  }
                  if (snapshot.hasData && snapshot.data.posts.length == 0) {
                    return noData();
                  }

                  if (snapshot.hasError) {
                    return hasError(snapshot.error);
                  }

                  return Loading();
                })
            ),
          ],
        ),
      ),
    );
  }

}