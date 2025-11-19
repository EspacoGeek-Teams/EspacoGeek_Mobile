import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_state.freezed.dart';

enum MediaStatus { loading, success, failure }

@freezed
class MediaState with _$MediaState {
  const factory MediaState({
    @Default(MediaStatus.loading) MediaStatus status,
    Map<String, dynamic>? data,
    String? error,
  }) = _MediaState;
}
