import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(const ThemeApp());
}

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          dynamicSchemeVariant: DynamicSchemeVariant.vibrant,
        ),
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Theme Sample', style: theme.textTheme.titleMedium),
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  final theme = Theme.of(context);
  return CustomScrollView(
    slivers: [
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        delegate: SliverChildListDelegate([
          _buildBox(
            context,
            'Primary',
            theme.colorScheme.primary,
            theme.colorScheme.onPrimary,
          ),
          _buildBox(
              context,
              'Primary Container',
              theme.colorScheme.primaryContainer,
              theme.colorScheme.onPrimaryContainer
          ),
          _buildBox(
              context,
              'Secondary',
              theme.colorScheme.secondary,
              theme.colorScheme.onSecondary
          ),
          _buildBox(
              context,
              'Secondary Container',
              theme.colorScheme.secondaryContainer,
              theme.colorScheme.onSecondaryContainer
          ),
          _buildBox(
            context,
            'Surface',
            theme.colorScheme.surface,
            theme.colorScheme.onSurface,
          ),
          _buildBox(
            context,
            'Surface Container',
            theme.colorScheme.surfaceContainer,
            theme.colorScheme.onSurface,
          ),
          _buildBox(
            context,
            'Tertiary',
            theme.colorScheme.tertiary,
            theme.colorScheme.onTertiary,
          ),
          _buildBox(
            context,
            'Tertiary Container',
            theme.colorScheme.tertiaryContainer,
            theme.colorScheme.onTertiaryContainer,
          ),
          _buildBox(
            context,
            'Error',
            theme.colorScheme.error,
            theme.colorScheme.onError,
          ),
          _buildBox(
            context,
            'Error Container',
            theme.colorScheme.errorContainer,
            theme.colorScheme.onErrorContainer,
          ),
        ]),
      ),
    ],
  );
}

Widget _buildBox(
  BuildContext context,
  String title,
  Color backgroundColor,
  Color foregroundColor,
) {
  return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: Theme.of(context,).textTheme.titleLarge?.copyWith(color: foregroundColor),
        ),
      ),
  );
}
