import 'package:graphql_flutter/graphql_flutter.dart';

final tvSerieSearchQuery = gql(
    r'''query MediaPage($id: ID, $name: String) { tvserie(id: $id, name: $name){ content { id name cover } } }''');
