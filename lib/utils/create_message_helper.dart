/// Constructs the message map.
/// This function can be used to add a message for either the bot or the user.
Map<String, String> createMessage(String text, String type) {
  return {'text': text, 'type': type};
}
