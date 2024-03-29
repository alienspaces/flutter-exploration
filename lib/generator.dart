import 'package:build/build.dart';
import 'package:logging/logging.dart';

// NOTE: This builder stuff is complex limited in its capability, the documentation
// is poor and for what we are doing here, this could simply be a dart script.

Builder sourceWidgetBuilder(BuilderOptions builderOptions) => SourceWidgetBuilder(builderOptions);

class SourceWidgetBuilder extends Builder {
  final log = Logger('SourceWidgetBuilder');

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['_source.dart']
      };

  final BuilderOptions builderOptions;

  SourceWidgetBuilder(this.builderOptions);

  @override
  Future<void> build(BuildStep buildStep) async {
    // Retrieve the currently matched asset
    AssetId inputId = buildStep.inputId;

    // Create a new target `AssetId` based on the current one
    var copyAssetId = inputId.changeExtension('_source.dart');
    log.info('copyAssetId - path - ${copyAssetId.path}');

    var fileContent = await buildStep.readAsString(inputId);

    // Write out the new asset
    await buildStep.writeAsString(copyAssetId, getContent(fileContent));
  }

  String getContent(String content) {
    // Escape problematic symbols
    content = content.replaceAll('\'', '\\\'');
    content = content.replaceAll('"', '\"');
    content = content.replaceAll('\$', '\\\$');
    content = "\n$content";

    return '''
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = \'\'\'
  $content
  \'\'\';

  @override
  Widget build(BuildContext context) {

    // Adjust font size based on screen width
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontSize = 20;
    if (width < 1024) {
      fontSize = 14;
    } else if (width < 2048) {
      fontSize = 18;
    }

    return Container(
      alignment: Alignment.topLeft,
      color: Theme.of(context).colorScheme.background,
      child: Container(
        // Setting minimum height allows scrolling when
        // content height is greater than the screen height
        constraints: BoxConstraints(
          minHeight: height,
        ),
        color: Theme.of(context).colorScheme.secondary,
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: HighlightView(
          "\$textContent",
          language: 'dart',
          theme: githubTheme,
          padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
''';
  }
}
