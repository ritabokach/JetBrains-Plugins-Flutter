import 'package:json_annotation/json_annotation.dart';

part 'rating_dto.g.dart';

/// Ответ `GET /plugins/{id}/rating`: сколько голосов за каждую оценку.
///
/// `{"votes": {"5": 80, "4": 13, "1": 15}}`. Поле meanRating в ответе
/// одинаковое у всех плагинов, это средняя по маркетплейсу, поэтому DTO его
/// не описывает.
@JsonSerializable()
class RatingDto {
  const RatingDto({required this.votes});

  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);

  @JsonKey(defaultValue: <String, int>{})
  final Map<String, int> votes;
}
