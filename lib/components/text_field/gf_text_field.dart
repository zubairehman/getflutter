import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GfTextField extends StatelessWidget {
  final int maxLength;
  final int maxLines;
  final double fontSize;
  final String? initialValue;
  final String? hint;
  final String? errorText;
  final String? counterText;
  final bool obscureText;
  final bool isIcon;
  final bool isDense;
  final bool autoFocus;
  final bool enableBorder;
  final bool? enabled;
  final bool enableLeadingWidget;
  final bool enableClearButton;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  final Color hintColor;
  final Color iconColor;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final IconData? icon;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final ValueChanged? onChanged;
  final ValueChanged? onFieldSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onClearClick;

  const GfTextField({
    Key? key,
    this.onTap,
    this.onClearClick,
    this.icon,
    this.hint,
    this.errorText,
    this.counterText = '',
    this.obscureText = false,
    this.enableLeadingWidget = true,
    this.isDense = true,
    this.keyboardType,
    this.textController,
    this.isIcon = false,
    this.padding = const EdgeInsets.all(0),
    this.contentPadding = const EdgeInsets.only(left: 12),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.autoFocus = false,
    this.textInputAction,
    this.enableBorder = true,
    this.onChanged,
    this.enabled,
    this.initialValue,
    this.maxLength = 50,
    this.maxLines = 1,
    this.enableClearButton = true,
    this.fontSize = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: const Color(0xFFf4f7fa),
          borderRadius: getRadius(),
        ),
        child: Padding(
          padding: padding,
          child: TextFormField(
            onTap: onTap,
            enabled: enabled,
            initialValue: initialValue,
            onChanged: onChanged,
            controller: textController,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            autofocus: autoFocus,
            textInputAction: textInputAction,
            obscureText: obscureText,
            maxLength: maxLength,
            maxLines: maxLines,
            keyboardType: keyboardType,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontSize: fontSize, height: 1.5),
            decoration: InputDecoration(
                isDense: isDense,
                icon: isIcon ? Icon(icon, color: iconColor) : null,
                suffixIcon: enableClearButton
                    ? IconButton(
                        visualDensity: VisualDensity.compact,
                        splashRadius: 8,
                        icon: const Icon(
                          Icons.clear,
                          size: 20,
                        ),
                        onPressed: onClearClick,
                      )
                    : null,
                counterText: counterText,
                contentPadding:
                    contentPadding.copyWith(top: enableBorder ? 0 : 14),
                errorText: errorText,
                hintText: hint,
                hintStyle: TextStyle(
                    color: hintColor, fontSize: fontSize, inherit: false),
                enabledBorder: enableBorder
                    ? OutlineInputBorder(
                        gapPadding: 0,
                        borderSide: const BorderSide(color: Color(0xFFced4da)),
                        borderRadius: getRadius(),
                      )
                    : InputBorder.none,
                border: enableBorder
                    ? const OutlineInputBorder()
                    : InputBorder.none),
          ),
        ),
      );

  // general methods:-----------------------------------------------------------
  BorderRadius getRadius() => enableLeadingWidget
      ? const BorderRadius.only(
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4),
        )
      : const BorderRadius.all(
          Radius.circular(4),
        );
}
