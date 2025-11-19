import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:english_words/english_words.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({required WordPair word}) = _HomeState;
}
