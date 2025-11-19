import 'package:graphql_flutter/graphql_flutter.dart';

final gameSearchQuery = gql(
    r'''query MediaPage($id: ID, $name: String) { game(id: $id, name: $name){ content { id name cover } } }''');
