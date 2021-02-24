import 'package:flutter/material.dart';
import 'package:flutter_cycle/bloc/sticker.dart';
import 'package:flutter_cycle/data/models/response/home_sticker_packs_entity.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "我是貼圖資料",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 50.0),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<HomeStickerPacksEntity>(
          stream: homeStickerPacksBloc.subject.stream,
          builder: (context, AsyncSnapshot<HomeStickerPacksEntity> snapshot) {
            if (snapshot.hasData && snapshot.data.trending.length > 0) {
              return _hasData(snapshot.data);
            }

            if (snapshot.hasData && snapshot.data.trending.length == 0) {
              return _noData();
            }

            if (snapshot.hasError) {
              return _hasError(snapshot.error);
            }
            return _Loading();
          },
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    homeStickerPacksBloc..getHomeStickerPacks();
  }
}

Widget _Loading() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 25.0,
        width: 25.0,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 4.0,
        ),
      )
    ],
  ));
}

Widget _hasError(String error) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Error occured: $error"),
    ],
  ));
}

Widget _noData() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "No More",
              style: TextStyle(color: Colors.black45),
            )
          ],
        )
      ],
    ),
  );
}

Widget _hasData(HomeStickerPacksEntity data) {
  List<Trending> stickers = data.trending;
  return Container(
    height: 270.0,
    padding: EdgeInsets.only(left: 10.0),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: stickers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: stickers[index].id,
                  child: Container(
                      width: 120.0,
                      height: 180.0,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(stickers[index].iconUrl)),
                      )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 100,
                  child: Text(
                    stickers[index].name,
                    maxLines: 2,
                    style: TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.0),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
