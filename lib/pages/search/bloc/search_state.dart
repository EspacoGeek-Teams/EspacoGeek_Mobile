import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

enum SearchStatus { idle, loading, success, failure }

enum MediaType { tvserie, game, vn }

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(MediaType.tvserie) MediaType type,
    @Default('') String query,
    @Default(SearchStatus.idle) SearchStatus status,
    @Default(<dynamic>[]) List results,
    String? error,
  }) = _SearchState;
}
