import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:espacogeekmobile/l10n/app_localizations.dart';
import 'cubit/media_cubit.dart';
import 'cubit/media_state.dart';

class MediaDetailPage extends StatelessWidget {
  final String id;
  final String slug;
  const MediaDetailPage({super.key, required this.id, required this.slug});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) =>
          MediaCubit(client: GraphQLProvider.of(context).value)..fetch(id),
      child: Scaffold(
        appBar: AppBar(title: Text(slug.replaceAll('-', ' '))),
        body: BlocBuilder<MediaCubit, MediaState>(
          builder: (context, state) {
            switch (state.status) {
              case MediaStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case MediaStatus.failure:
                return Center(child: Text(state.error ?? l10n.failedToLoad));
              case MediaStatus.success:
                final media = state.data;
                if (media == null) {
                  return Center(child: Text(l10n.notFound));
                }
                final List seasons = (media['season'] as List?) ?? const [];
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (media['banner'] != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              Image.network(media['banner'], fit: BoxFit.cover),
                        ),
                      const SizedBox(height: 12),
                      Text(
                        media['name'] ?? slug.replaceAll('-', ' '),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      if (media['about'] != null) Text(media['about']),
                      const SizedBox(height: 12),
                      ...seasons.map<Widget>((s) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(s['name'] ?? l10n.season),
                            subtitle: Text(
                              l10n.episodes(
                                  (s['episodeCount'] ?? '-').toString()),
                            ),
                          )),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
