import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sprung/sprung.dart';

class TextFieldEmail extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;

  const TextFieldEmail({
    super.key,
    required this.hintText,
    required this.controller,
    required this.focusNode,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldEmailState createState() => _TextFieldEmailState();
}
  
class _TextFieldEmailState extends State<TextFieldEmail> {
  late bool hasFocus;

  @override
  void initState() {
    super.initState();
    hasFocus = widget.focusNode.hasFocus;
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      hasFocus = widget.focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Color? borderColor = hasFocus ? const Color(0xFFaa3bff) : Theme.of(context).elevatedButtonTheme.style?.foregroundColor?.resolve({})?.withAlpha(30);

    return AnimatedContainer(
        curve: Sprung.overDamped,
        duration: const Duration(milliseconds: 600),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor!, width: 2.0),
        ),
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: GoogleFonts.getFont(
            "IBM Plex Mono",
            fontWeight: FontWeight.w500,
            fontSize: size.height * 0.02,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.getFont(
              "IBM Plex Mono",
              fontWeight: FontWeight.w500,
              fontSize: size.height * 0.02,
            ),
          ),
        ),
      );
  }
}
