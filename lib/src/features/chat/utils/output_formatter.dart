// Function to extract and format sources
String formatSources(List<String> sources) {
  final RegExp regex = RegExp(r'src\\data\\(?:([^\\]+)\\)?([^\\]+\.pdf)');
  return sources.map((source) {
    final match = regex.firstMatch(source);
    if (match != null) {
      final subfolder = match.group(1);
      final title = match.group(2);
      return subfolder != null
          ? '\nFolder: $subfolder\nDocument: $title\n'
          : '\nDocument: $title!';
    }
    return source;
  }).join(', ');
}
