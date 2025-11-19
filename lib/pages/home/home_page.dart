import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:espacogeekmobile/l10n/app_localizations.dart';
import '../search/search_route.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text(l10n.homeTitle)),
            body: Center(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.helloWorld),
                      const SizedBox(height: 20),
                      Text(l10n.randomIdea),
                      Text(state.word.asLowerCase),
                      ElevatedButton(
                        onPressed: () => context.read<HomeCubit>().next(),
                        child: Text(l10n.generateNewIdea),
                      ),
                    ],
                  );
                },
              ),
            ),
            floatingActionButton: SpeedDial(
              icon: Icons.menu,
              activeIcon: Icons.close,
              overlayOpacity: 0.4,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.search),
                  label: l10n.search,
                  onTap: () =>
                      Navigator.pushNamed(context, SearchRoute.routeName),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
