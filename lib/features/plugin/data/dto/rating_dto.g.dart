// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingDto _$RatingDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RatingDto', json, ($checkedConvert) {
      final val = RatingDto(
        votes: $checkedConvert(
          'votes',
          (v) =>
              (v as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toInt()),
              ) ??
              {},
        ),
      );
      return val;
    });
