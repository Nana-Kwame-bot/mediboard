import "package:flutter_test/flutter_test.dart";
import "package:mediboard/app/app.dart";
import "package:mediboard/blocs/medi_blocs.dart";

void main() {
  group("App", () {
    testWidgets("renders MediBlocs", (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MediBlocs), findsOneWidget);
    });
  });
}
