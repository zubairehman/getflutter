import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'GetWidget',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MyHomePage(),
          appBar: AppBar(
            title: const Text('Foody Toolkit'),
          ),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: GFColors.DARK,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildButtons(),
            _buildAccordion(),
            _buildTypography(),
            _buildRadio(),
          ],
        ),
      );

  // general methods:-----------------------------------------------------------
  Widget _buildTypography() => const GFTypography(
        text: 'GF Header Typo1',
        type: GFTypographyType.typo1,
        showDivider: true,
        dividerAlignment: Alignment.centerLeft,
        dividerType: GFDividerType.bottom,
        dividerColor: GFColors.PRIMARY,
        dividerBorderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      );

  Widget _buildRadio() => SizedBox(
        width: 10,
        child: GFToggle(
          onChanged: (val) {},
          value: false,
          type: GFToggleType.ios,
        ),
      );

  Widget _buildAccordion() => GFAccordion(
        title: 'Title goes here',
        content: 'Content goes here but its a String and i dont like it. '
            'Content goes here but its a String and i dont like it. '
            'Content goes here but its a String and i dont like it. '
            'Content goes here but its a String and i dont like it. '
            'Content goes here but its a String and i dont like it. Content goes here but its a String and i dont like it.',
        collapsedIcon: const Icon(Icons.add),
        expandedIcon: const Icon(Icons.zoom_out_sharp),
        collapsedTitleBackgroundColor: GFColors.DANGER,
        contentBackgroundColor: GFColors.ALT,
        contentBorder: Border.all(color: Colors.red),
        contentChild: const Text('Another content widget'),
        expandedTitleBackgroundColor: Colors.blue,
        showAccordion: true,
      );

  Widget _buildButtons() => Card(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            GFButton(
              size: GFSize.LARGE,
              text: 'Primary',
              color: GFColors.PRIMARY,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              size: GFSize.LARGE,
              text: 'Secondary',
              color: GFColors.SECONDARY,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              size: GFSize.LARGE,
              text: 'Success',
              color: GFColors.SUCCESS,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              size: GFSize.LARGE,
              text: 'Danger',
              color: GFColors.DANGER,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              size: GFSize.LARGE,
              text: 'Warning',
              color: GFColors.WARNING,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              size: GFSize.LARGE,
              text: 'Info',
              color: GFColors.INFO,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              size: GFSize.LARGE,
              text: 'Light',
              color: GFColors.LIGHT,
              textStyle: const TextStyle(color: GFColors.DARK),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              size: GFSize.LARGE,
              text: 'Dark',
              color: GFColors.DARK,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              size: GFSize.LARGE,
              buttonBoxShadow: false,
              hoverColor: GFColors.TRANSPARENT,
              hoverElevation: 0,
              elevation: 0,
              enableFeedback: true,
              // highlightColor: GFColors.PRIMARY,
              textStyle: TextStyle(
                color: isHovered && !kIsWeb ? GFColors.WHITE : GFColors.PRIMARY,
                decoration:
                    isHovered ? TextDecoration.underline : TextDecoration.none,
              ),
              onHover: (value) {
                setState(() {
                  isHovered = value;
                });
              },
              onHighlightChanged: (value) {
                setState(() {
                  isHovered = value;
                });
              },
              text: 'Link',
              type: GFButtonType.transparent,
              onPressed: () {},
            ),
          ],
        ),
      );
}
