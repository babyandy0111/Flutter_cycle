/*import 'package:json_annotation/json_annotation.dart';
// xxx.g.dart 将在我们运行生成命令后自动生成,xxx文件名要相同

part 'login_info.g.dart';  //login_info此名字需与文件名相同

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class LoginInfo {
  String result;
  String message;
  Data data;
  LoginInfo(
      {this.result,
        this.message,
        this.data});

  ///注意，此LoginInfo需是类名
  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}*/