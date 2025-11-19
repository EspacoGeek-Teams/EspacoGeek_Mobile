import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:english_words/english_words.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(word: WordPair.random()));

  void next() => emit(state.copyWith(word: WordPair.random()));
}
