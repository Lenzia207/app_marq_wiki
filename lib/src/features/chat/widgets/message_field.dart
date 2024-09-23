import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'custom_text_box.dart';

/// A widget that displays a list of messages.
class MessageField extends HookWidget {
  const MessageField({
    super.key,
    required this.messages,
  });

  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 100,
      ),
      child: Expanded(
        child: ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomTextBox(
              alignment: Alignment.topLeft,
              text: messages[messages.length - 1 - index],
            );
          },
        ),
      ),
    );
  }
}
