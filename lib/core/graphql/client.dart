import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientFactory {
  GraphQLClientFactory._();

  static Future<ValueNotifier<GraphQLClient>> create(
      {required String endpoint}) async {
    await initHiveForFlutter();
    final link = HttpLink(endpoint);
    return ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
  }
}
