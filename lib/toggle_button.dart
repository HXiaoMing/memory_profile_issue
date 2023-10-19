import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final Future Function() toggle;

  final ValueGetter<bool> isActive;

  final String activeText;

  final String unActiveText;

  const ToggleButton({
    required this.toggle,
    required this.isActive,
    required this.activeText,
    required this.unActiveText,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _ToggleButtonState();
  }
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await widget.toggle();
        setState(() {});
      },
      child: Text(widget.isActive() ? widget.unActiveText : widget.activeText),
    );
  }
}
