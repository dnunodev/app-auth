import 'package:clicknote/app/clicknote/settings/settings_modal_view.dart';
import 'package:flutter/material.dart';

class ClickNoteHeader extends StatelessWidget {
  const ClickNoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(child: IconButton(onPressed: (){SettingsModalView.show(context);}, icon: const Icon(Icons.settings), iconSize: size.height * 0.035,),);
  }
}