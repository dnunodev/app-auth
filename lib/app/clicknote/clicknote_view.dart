import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:clicknote/app/clicknote/clicknote_elements/clicknote_header.dart';
import 'package:clicknote/providers/locale_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClickNoteView extends StatefulWidget {
  const ClickNoteView({super.key});

  @override
  State<ClickNoteView> createState() => _ClickNoteViewState();
}

class _ClickNoteViewState extends State<ClickNoteView> {
  @override
  Widget build(BuildContext context) {
    // Mantén el almacenamiento del idioma
    Provider.of<LocaleStorage>(context);
    final isDarkMode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // Centramos el contenido y lo llevamos al final
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ClickNoteHeader(),
            IconButton(
                  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode, size: size.height * 0.03,),
                  onPressed: () {
                    // Cambia el tema dinámicamente
                    if (isDarkMode) {
                      AdaptiveTheme.of(context).setLight();
                    } else {
                      AdaptiveTheme.of(context).setDark();
                    }
                    setState(() {}); // Reconstruye el widget para actualizar el ícono
                  },
                ),
          ],
        ),
      ),
    );
  }
}