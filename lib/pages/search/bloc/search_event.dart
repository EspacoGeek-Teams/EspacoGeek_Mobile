import 'package:equatable/equatable.dart';
import 'search_state.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}

class QueryChanged extends SearchEvent {
  final String query;
  const QueryChanged(this.query);
  @override
  List<Object?> get props => [query];
}

class TypeChanged extends SearchEvent {
  final MediaType type;
  const TypeChanged(this.type);
  @override
  List<Object?> get props => [type];
}
