import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'search_state.dart';
import '../../../core/graphql/schemas/tvserie_search.dart';
import '../../../core/graphql/schemas/game_search.dart';
import '../../../core/graphql/schemas/vn_search.dart';
import 'search_event.dart';

EventTransformer<T> debounceSwitch<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GraphQLClient client;
  SearchBloc({required this.client}) : super(const SearchState()) {
    on<QueryChanged>(
      (event, emit) async {
        final value = event.query;
        emit(state.copyWith(query: value));
        await _search(emit);
      },
      transformer: debounceSwitch(const Duration(milliseconds: 500)),
    );

    on<TypeChanged>((event, emit) async {
      emit(state.copyWith(type: event.type));
      await _search(emit);
    });
  }

  Future<void> _search(Emitter<SearchState> emit) async {
    final name = state.query.trim();
    final int? id = RegExp(r'^\d+$').hasMatch(name) ? int.tryParse(name) : null;
    if (name.isEmpty && id == null) {
      emit(state.copyWith(results: const [], status: SearchStatus.idle));
      return;
    }
    emit(state.copyWith(status: SearchStatus.loading));
    try {
      final docs = {
        MediaType.tvserie: tvSerieSearchQuery,
        MediaType.game: gameSearchQuery,
        MediaType.vn: vnSearchQuery,
      };
      final result = await client.query(
        QueryOptions(
          document: docs[state.type]!,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: {'id': id, 'name': name.isEmpty ? null : name},
        ),
      );
      if (result.hasException) {
        throw result.exception!;
      }
      final data = result.data?[state.type.name];
      final List content = (data?['content'] as List?) ?? [];
      emit(state.copyWith(results: content, status: SearchStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.failure, error: e.toString()));
    }
  }
}
