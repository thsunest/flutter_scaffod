// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
  army1: json['army1'] as String,
  army1Logo: json['army1Logo'] as String,
  army2: json['army2'] as String,
  army2Logo: json['army2Logo'] as String,
  score: json['score'] as String,
  time: json['time'] as String,
  flag: json['flag'] as String,
  stadium: json['stadium'] as String,
  session: (json['session'] as num?)?.toInt(),
);

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
  'army1': instance.army1,
  'army1Logo': instance.army1Logo,
  'army2': instance.army2,
  'army2Logo': instance.army2Logo,
  'score': instance.score,
  'time': instance.time,
  'flag': instance.flag,
  'stadium': instance.stadium,
  'session': instance.session,
};
