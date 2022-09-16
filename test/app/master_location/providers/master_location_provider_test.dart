import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Initial data maps by GPS location", () async {
    // TODO: Implement test
  });

  test("State is unauthenticated when token not found", () async {
    // when(() => tokenRepository.fetchToken()).thenAnswer((_) => Future.value(null));
    // // when(() => mockRepository.checkToken()).thenAnswer((_) => Future.value(false));
    // final container = ProviderContainer(overrides: [
    //   tokenRepositoryProvider.overrideWithValue(tokenRepository),
    //   appStartProvider.overrideWithProvider(StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
    //     return AppStartNotifier(AppStartState.initial(), ref.read);
    //   }))
    // ]);

    // expect(container.read(appStartProvider), AppStartState.initial());
    // await container.read(appStartProvider.notifier).authCheck();
    // expect(container.read(appStartProvider), AppStartState.unauthenticated());
  });
}
