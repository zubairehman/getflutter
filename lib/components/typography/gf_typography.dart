import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_divider_type.dart';

class GFTypography extends StatelessWidget {
  /// Creates simple title with underline. Style of title can be changed using [GFTypographyType]
  /// showDivider is default true, can be set false.
  const GFTypography({
    Key? key,
    this.type = GFTypographyType.typo4,
    this.child,
    required this.text,
    this.icon,
    this.dividerBorderRadius,
    this.textColor,
    this.dividerAlignment,
    this.dividerColor,
    this.showDivider = true,
    this.dividerWidth,
    this.dividerHeight,
    this.backgroundImage,
    this.backgroundImageColorFilter,
    this.dividerType = GFDividerType.left,
  })  : assert(text != null || child != null),
        super(key: key);

  /// child of  type [Widget] is alternative to text key. text will get priority over child
  final Widget? child;

  /// text of type [String] is alternative to child. text will get priority over child
  final String? text;

  ///icon of type [Widget] used to pass icon or image
  final Widget? icon;

  /// Pass [GFColors] or [Color] for dividerColor
  final Color? dividerColor;

  /// Pass [GFColors] or [Color] for textColor
  final Color? textColor;

  /// dividerBorderRadius of type [BorderRadius] to alter the radius of the divider
  final BorderRadius? dividerBorderRadius;

  ///dividerAlignment of type [Alignment] used for aligning the divider to required alignment
  final Alignment? dividerAlignment;

  ///Pass [bool] value to show or hide the divider
  final bool showDivider;

  ///pass [double] type to increase or decrease the width of the divider
  final double? dividerWidth;

  ///pass [double] type to increase or decrease the height of the divider
  final double? dividerHeight;

  ///backgroundImage of type [ImageProvider] to set the background of [GFTypography]
  final ImageProvider? backgroundImage;

  ///backgroundImagecolorFilter of type [ColorFilter] to set the
  ///background color of [GFTypography] only when backgroundImage is available
  final ColorFilter? backgroundImageColorFilter;

  /// header type of [GFTypographyType] i.e, typo1, typo2, typo3, typo4, typo5, typo6
  final GFTypographyType type;

  /// divider type of [GFDividerType] i.e, left, bottom
  final GFDividerType dividerType;

  @override
  Widget build(BuildContext context) {
    double? fontSize;
    double? dWidth;
    double? dHeight;

    if (type == GFTypographyType.typo1) {
      fontSize = 25.0;
    } else if (type == GFTypographyType.typo2) {
      fontSize = 22.0;
    } else if (type == GFTypographyType.typo3) {
      fontSize = 19.0;
    } else if (type == GFTypographyType.typo4) {
      fontSize = 17.0;
    } else if (type == GFTypographyType.typo5) {
      fontSize = 15.0;
    } else if (type == GFTypographyType.typo6) {
      fontSize = 13.0;
    }

    if (dividerType == GFDividerType.left) {
      dWidth = dividerWidth != null ? dividerWidth : 5;
      dHeight = dividerHeight != null ? dividerHeight : 24;
    } else if (dividerType == GFDividerType.bottom) {
      dWidth = dividerWidth != null ? dividerWidth : 70;
      dHeight = dividerHeight != null ? dividerHeight : 5;
    }

    return Container(
      padding: EdgeInsets.all(backgroundImage != null ? 10 : 0),
      decoration: BoxDecoration(
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                fit: BoxFit.cover,
                colorFilter: backgroundImageColorFilter ??
                    const ColorFilter.mode(Colors.black54, BlendMode.darken),
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                dividerType == GFDividerType.left
                    ? _buildHeadingDivider(dWidth, dHeight)
                    : Container(),
                _buildIcon(),
                _buildPadding(),
                _buildText(fontSize),
              ],
            ),
            dividerType == GFDividerType.bottom
                ? _buildHeadingDivider(dWidth, dHeight)
                : Container(),
            _buildDivider()
          ],
        ),
      ),
    );
  }

  Widget _buildText(double? fontSize) => text != null
      ? Expanded(
          child: Text(
            text!,
            style: TextStyle(
                color: textColor ??
                    (backgroundImage != null ? Colors.white : Colors.black),
                fontSize: fontSize,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w500),
          ),
        )
      : child!;

  Widget _buildPadding() => icon != null
      ? const Padding(padding: EdgeInsets.only(left: 10))
      : Container();

  Widget _buildHeadingDivider(double? width, double? height) => showDivider
      ? Container(
          margin: const EdgeInsets.only(right: 16, top: 3, bottom: 3),
          alignment: dividerAlignment,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: dividerColor ??
                  (backgroundImage != null ? Colors.white : Colors.black),
              borderRadius: dividerBorderRadius ??
                  const BorderRadius.all(
                    Radius.circular(5),
                  ),
            ),
          ),
        )
      : Container();

  Widget _buildIcon() => icon ?? Container();

  Widget _buildDivider() => dividerType == GFDividerType.left
      ? const Divider(height: 32)
      : Container();
}
