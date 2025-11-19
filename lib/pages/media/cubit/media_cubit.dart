import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../core/graphql/schemas/media_query.dart';
import 'media_state.dart';

class MediaCubit extends Cubit<MediaState> {
  final GraphQLClient client;
  MediaCubit({required this.client}) : super(const MediaState());

  Future<void> fetch(String id) async {
    emit(state.copyWith(status: MediaStatus.loading));
    try {
      final result = await client
          .query(QueryOptions(document: mediaQuery, variables: {'id': id}));
      if (result.hasException) throw result.exception!;
      emit(state.copyWith(
          status: MediaStatus.success,
          data: result.data?['media'] as Map<String, dynamic>?));
    } catch (e) {
      emit(state.copyWith(status: MediaStatus.failure, error: e.toString()));
    }
  }
}
