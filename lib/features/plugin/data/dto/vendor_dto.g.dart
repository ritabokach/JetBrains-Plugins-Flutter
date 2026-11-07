// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorDto _$VendorDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VendorDto', json, ($checkedConvert) {
      final val = VendorDto(
        name: $checkedConvert('name', (v) => v as String),
        publicName: $checkedConvert('publicName', (v) => v as String?),
        url: $checkedConvert('url', (v) => v as String?),
        country: $checkedConvert('country', (v) => v as String?),
        isVerified: $checkedConvert('isVerified', (v) => v as bool? ?? false),
      );
      return val;
    });
