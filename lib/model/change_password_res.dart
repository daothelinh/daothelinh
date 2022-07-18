import 'dart:convert';

ChangePasswordRes changePasswordResFromJson(String str) =>
    ChangePasswordRes.fromJson(json.decode(str));

String changePasswordResToJson(ChangePasswordRes data) =>
    json.encode(data.toJson());

class ChangePasswordRes {
  ChangePasswordRes({
    required this.msg,
  });

  String msg;

  factory ChangePasswordRes.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRes(
        msg: json["msg"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
