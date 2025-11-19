import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:espacogeekmobile/l10n/app_localizations.dart';
import 'bloc/search_bloc.dart';
import 'bloc/search_event.dart';
import 'bloc/search_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(client: GraphQLProvider.of(context).value),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();
  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () => context.read<SearchBloc>().add(QueryChanged(_controller.text)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.searchTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: BlocBuilder<SearchBloc, SearchState>(
                        buildWhen: (p, c) => p.query != c.query,
                        builder: (context, state) {
                          if (state.query.isNotEmpty) {
                            return IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => _controller.clear(),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      hintText: l10n.searchHint,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (p, c) => p.type != c.type,
                  builder: (context, state) {
                    return DropdownButton<MediaType>(
                      value: state.type,
                      onChanged: (v) {
                        if (v != null) {
                          context.read<SearchBloc>().add(TypeChanged(v));
                        }
                      },
                      items: MediaType.values
                          .map((m) => DropdownMenuItem(
                                value: m,
                                child: Text(m.name),
                              ))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                switch (state.status) {
                  case SearchStatus.idle:
                    return Center(child: Text(l10n.typeToSearch));
                  case SearchStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case SearchStatus.failure:
                    return Center(
                        child: Text(state.error ?? l10n.unknownError));
                  case SearchStatus.success:
                    if (state.results.isEmpty) {
                      return Center(child: Text(l10n.noResults));
                    }
                    return ListView.separated(
                      itemCount: state.results.length,
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (_, i) {
                        final item = state.results[i] as Map<String, dynamic>;
                        return ListTile(
                          leading: item['cover'] != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    item['cover'],
                                    width: 56,
                                    height: 56,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.image_not_supported),
                                  ),
                                )
                              : const Icon(Icons.tv),
                          title: Text(item['name'] ?? l10n.unknown),
                          onTap: () {
                            final slug = (item['name'] ?? '')
                                .toString()
                                .toLowerCase()
                                .replaceAll(RegExp(r'\s+'), '-')
                                .trim();
                            Navigator.pushNamed(
                                context, '/media/${item['id']}/$slug');
                          },
                        );
                      },
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
