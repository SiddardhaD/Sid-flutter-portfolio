// Walks every nav tab on desktop and mobile widths to catch layout
// overflow / render errors across the whole site.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app/bloc/navigation/navigation_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_event.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('Desktop: every nav tab renders without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final bloc = BlocProvider.of<NavigationBloc>(
      tester.element(find.byType(Scaffold).first),
    );

    for (int i = 0; i < navLabels.length; i++) {
      bloc.add(NavigationItemSelected(i));
      await tester.pumpAndSettle();
      expect(
        tester.takeException(),
        isNull,
        reason: "Desktop tab '${navLabels[i]}' threw an exception",
      );
    }
  });

  testWidgets(
    'Narrowest desktop breakpoint (768px): every nav tab renders without overflow',
    (tester) async {
      tester.view.physicalSize = const Size(768, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final bloc = BlocProvider.of<NavigationBloc>(
        tester.element(find.byType(Scaffold).first),
      );

      for (int i = 0; i < navLabels.length; i++) {
        bloc.add(NavigationItemSelected(i));
        await tester.pumpAndSettle();
        expect(
          tester.takeException(),
          isNull,
          reason: "768px-wide tab '${navLabels[i]}' threw an exception",
        );
      }
    },
  );

  testWidgets('Tablet: every nav tab renders without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(834, 1194);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final bloc = BlocProvider.of<NavigationBloc>(
      tester.element(find.byType(Scaffold).first),
    );

    for (int i = 0; i < navLabels.length; i++) {
      bloc.add(NavigationItemSelected(i));
      await tester.pumpAndSettle();
      expect(
        tester.takeException(),
        isNull,
        reason: "Tablet tab '${navLabels[i]}' threw an exception",
      );
    }
  });

  testWidgets('Mobile: every nav tab renders without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final bloc = BlocProvider.of<NavigationBloc>(
      tester.element(find.byType(Scaffold).first),
    );

    for (int i = 0; i < navLabels.length; i++) {
      bloc.add(NavigationItemSelected(i));
      await tester.pumpAndSettle();
      expect(
        tester.takeException(),
        isNull,
        reason: "Mobile tab '${navLabels[i]}' threw an exception",
      );
    }
  });
}
