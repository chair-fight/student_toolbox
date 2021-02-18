import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonTextFormField extends StatefulWidget {
  final InputDecoration decoration;
  final Function(String) validator;
  final Function(String) onChanged;
  final bool obscureText;

  const CommonTextFormField({
    Key key,
    this.decoration,
    this.validator,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: TextFormField(
            decoration: widget.decoration,
            validator: widget.validator,
            onChanged: widget.onChanged,
            obscureText: _obscureText,
          ),
        ),
        if (widget.obscureText) IntrinsicHeight(
          child: FlatButton(
            minWidth: 0,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(_obscureText ? FontAwesomeIcons.solidEyeSlash : FontAwesomeIcons.solidEye, size: 20),
            onPressed: () => setState(() => _obscureText = !_obscureText),
          ),
        )
      ],
    );
  }
}
