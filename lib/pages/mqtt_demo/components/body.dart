import 'package:flutter/material.dart';
import 'package:flutter_cycle/core/emqx/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  MqttClient client;
  var topic = "topic/test";

  void _publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString('Hello from flutter_client');
    client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Connect'),
              onPressed: () => {
                connect().then((value) {
                  client = value;
                })
              },
            ),
            RaisedButton(
              child: Text('Subscribe'),
              onPressed: () {
                return {client?.subscribe(topic, MqttQos.atLeastOnce)};
              },
            ),
            RaisedButton(
              child: Text('Publish'),
              onPressed: () => {this._publish('Hello')},
            ),
            RaisedButton(
              child: Text('Unsubscribe'),
              onPressed: () => {client?.unsubscribe(topic)},
            ),
            RaisedButton(
              child: Text('Disconnect'),
              onPressed: () => {client?.disconnect()},
            ),
          ],
        ),
      ),
    );
  }
}