import 'package:flutter/material.dart';
import 'package:flutter_cycle/bloc/chat.dart';
import 'package:flutter_cycle/data/models/response/chat_entity.dart';
import 'message_model.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    chatBloc..getChatList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GroupChannelsEntity>(
      stream: chatBloc.subject.stream,
      builder: (context, AsyncSnapshot<GroupChannelsEntity> snapshot) {
        if (snapshot.hasData && snapshot.data.channels.length > 0) {
          return _hasData(snapshot.data);
        }

        if (snapshot.hasData && snapshot.data.channels.length == 0) {
          // return _noData();
          print(123);
          return Container();
        }

        if (snapshot.hasError) {
          // return _hasError(snapshot.error);
          return Container();
        }
        // return _Loading();
        return Container();
      },
    );
  }

  Widget _hasData(GroupChannelsEntity data) {
    return ListView.builder(
      itemCount: data.channels.length,
      itemBuilder: (BuildContext context, int index) {
        final Message chat = chats[index];
        return GestureDetector(
          onTap: () => {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: chat.unread
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                          // shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        )
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(chat.sender.imageUrl),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                chat.sender.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              chat.sender.isOnline
                                  ? Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Container(
                                      child: null,
                                    ),
                            ],
                          ),
                          Text(
                            chat.time,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          chat.text,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
