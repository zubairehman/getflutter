import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'GetWidget',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Wrap(
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
                GFIconButton(
                  size: GFSize.SMALL,
                  color: GFColors.DARK,
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                GFButton(
                  size: GFSize.LARGE,
                  buttonBoxShadow: false,
                  hoverColor: GFColors.PRIMARY,
                  hoverElevation: 0,
                  elevation: 0,
                  enableFeedback: true,
                  highlightColor: GFColors.PRIMARY,
                  textStyle: TextStyle(
                      color: isHovered ? GFColors.WHITE : GFColors.PRIMARY),
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
                  type: GFButtonType.outline,
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Center(
                    child: Text(
                      'We also have same app on playstore. It shows various possibilities that you can achieve using GetWidget library.',
                      style: TextStyle(
                        fontSize: 16,
                        color: GFColors.WHITE,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GFButton(
                    size: GFSize.LARGE,
                    text: 'View on Playstore',
                    textStyle:
                        const TextStyle(fontSize: 16, color: GFColors.WHITE),
                    icon: const Icon(Icons.store),
                    color: GFColors.SUCCESS,
                    blockButton: true,
                    shape: GFButtonShape.standard,
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      );
}
