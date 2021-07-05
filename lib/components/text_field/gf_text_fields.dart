import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GfTextField extends StatefulWidget {
  const GfTextField({Key? key}) : super(key: key);

  @override
  State<GfTextField> createState() => _GfTextFieldState();
}

class _GfTextFieldState extends State<GfTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final TextEditingController _controller = TextEditingController();
  late Color color = Colors.black26;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _isFocused = true;
          color = const Color(0XFFBFDEFF);
          // focus gained
        });
      } else {
        setState(() {
          _isFocused = _focusNode.hasFocus;
          color = Colors.black38;
        });
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(children: [
            _isFocused
                ? Container(
                    height: 42,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.zero,
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 2),
                            color: Colors.blue,
                            blurRadius: 4,
                            spreadRadius: 1),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Container(
              height: 45,
              child: TextFormField(
                focusNode: _focusNode,
                controller: _controller,
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
                decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0XFF9DCBFE),
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color, width: 1),
                    ),
                    hintText: 'Enter email',
                    hintStyle:
                        const TextStyle(color: Colors.black38, fontSize: 14)),
              ),
            ),
          ]),
        ),
      );
}
