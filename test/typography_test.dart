import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final Widget childWidget = Container(
    width: 11,
    height: 22,
  );

  const icon = Icon(Icons.home);
  const text = 'Hello';

  const dividerRadius = BorderRadius.all(Radius.circular(2));
  const textcolor = GFColors.INFO;
  const dividerposition = Alignment.center;

  testWidgets('GFTypograpgy can be created', (WidgetTester tester) async {
    final GFTypography typography = GFTypography(
      icon: icon,
      dividerBorderRadius: dividerRadius,
      heading: text,
      headingColor: textcolor,
      dividerAlignment: dividerposition,
      type: GFTypographyType.typo2,
      child: childWidget,
    );

    final TestApp app = TestApp(typography);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);

    expect(app.typography.child, childWidget);
    expect(app.typography.icon, icon);
    expect(app.typography.dividerAlignment, Alignment.center);
    expect(app.typography.dividerBorderRadius, dividerRadius);
    expect(app.typography.headingColor, textcolor);
  });

  testWidgets('GF Typography with divider', (tester) async {
    const bool divider = true;

    const GFTypography typography = GFTypography(
      heading: 'type 1',
      showDivider: divider,
    );

    const TestApp app = TestApp(typography);

    expect(app.typography.showDivider, divider);
  });

  testWidgets('GF Typography with opacity', (tester) async {
    final textopacity = Colors.black.withOpacity(0.56);

    final GFTypography typography = GFTypography(
      heading: 'type1',
      headingColor: textopacity,
    );

    final TestApp app = TestApp(typography);

    expect(app.typography.headingColor, textopacity);
  });

  testWidgets('GF Typography with Custom Heading', (tester) async {
    final textopacity = Colors.black.withOpacity(0.56);
    const bool divider = true;
    const icon = GFAvatar();
    const colorfilter = ColorFilter.mode(Colors.black, BlendMode.darken);
    const bgImage = NetworkImage(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );

    final GFTypography typography = GFTypography(
      headingColor: textopacity,
      showDivider: divider,
      icon: icon,
      backgroundImage: bgImage,
      backgroundImageColorFilter: colorfilter,
      heading: 'type1',
    );

    final TestApp app = TestApp(typography);

    expect(app.typography.headingColor, textopacity);
    expect(app.typography.showDivider, divider);
    expect(app.typography.icon, icon);
    expect(app.typography.backgroundImage, bgImage);
    expect(app.typography.backgroundImageColorFilter, colorfilter);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.typography);

  final GFTypography typography;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: widget.typography,
              )
            ],
          ),
        ),
      );
}
