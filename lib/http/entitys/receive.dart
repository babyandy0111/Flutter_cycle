class ReceiveMsg {
  final String alert;
  final int badge;

  ReceiveMsg(this.alert, this.badge);

  ReceiveMsg.fromJson(Map<String, dynamic> json)
      : alert = json['alert'],
        badge = json['badge'];

  Map<String, dynamic> toJson() =>
      {
        'alert': alert,
        'badge': badge,
      };
}