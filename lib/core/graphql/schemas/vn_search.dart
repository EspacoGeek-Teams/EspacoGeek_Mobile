import 'package:graphql_flutter/graphql_flutter.dart';

final vnSearchQuery = gql(
    r'''query MediaPage($id: ID, $name: String) { vn(id: $id, name: $name){ content { id name cover } } }''');
