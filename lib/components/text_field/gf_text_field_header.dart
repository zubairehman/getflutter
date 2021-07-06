import 'package:flutter/material.dart';
import 'package:getwidget/components/text_field/gf_text_fields.dart';

class GFTextFieldWithLabel extends StatelessWidget {
  static const _kNormalPadding =    EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 1);
  static const _kGeneralPadding =   EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 1);


  // ignore: sort_constructors_first
  const GFTextFieldWithLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getTextWidget('Email address', const TextStyle(color: Colors.black54),_kGeneralPadding),
          _buildTextField(),
          _getTextWidget('We will never share your email with anyone else.', const TextStyle(color: Colors.black54,fontSize: 11),_kNormalPadding),

        ],
      );

  GfTextField _buildTextField() => const GfTextField();

  Widget _getTextWidget(String title, TextStyle style, padding) => Padding(
    padding: padding,
    child: Text(title, style: style),
      );
}
