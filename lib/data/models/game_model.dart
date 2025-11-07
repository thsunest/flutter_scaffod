import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';
@JsonSerializable()
class GameModel {
  String army1;
  String army1Logo;
  String army2;
  String army2Logo;
  String score;
  String time;
  String flag;
  String stadium;
  int? session;
  GameModel({
    required this.army1,
    required this.army1Logo,
    required this.army2,
    required this.army2Logo,
    required this.score,
    required this.time,
    required this.flag,
    required this.stadium,
    this.session,
  });
}
