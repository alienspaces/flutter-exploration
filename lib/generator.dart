import 'package:build/build.dart';
import 'package:logging/logging.dart';

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
    log.info('copyAssetId - content length ${fileContent.length}');

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
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: HighlightView(
        "\$textContent", 
        language: 'dart',
        theme: githubTheme,
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
''';
  }
}
