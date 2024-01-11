import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String username,
    required String password,
  }) = _UserModel;
}
