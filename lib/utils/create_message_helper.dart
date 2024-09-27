/// Constructs the message map.
/// This function can be used to add a message for either the bot or the user.
Map<String, String> createMessage(
  String text,
  List<String>? sources,
  String type,
) {
  return {
    'text': text,
    'sources': sources?.join(', ').toString() ?? '',
    'type': type,
  };
}
