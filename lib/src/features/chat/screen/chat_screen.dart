import 'package:app_marq_wiki/constants/app_color.dart';
import 'package:app_marq_wiki/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../constants/app_text.dart';
import '../../../../utils/create_message_helper.dart';
import '../data/chat_repository.dart';
import '../widgets/user_input_field.dart';
import '../widgets/message_field.dart';

/// A screen that displays a chat interface.
class ChatScreen extends HookWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = ChatRepository();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColor.background,
        title: const Text(
          AppText.appTitle,
        ),
      ),
      body: Container(
        color: AppColor.background,
        child: Stack(
          children: [
            // error Message
            if (chat.errorMessage.value.isNotEmpty) ...[
              const SizedBox(height: p16),
              Text(
                chat.errorMessage.value,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],

            // loading Indicator
            if (chat.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColor.yellow,
                ),
              ),

            // message Field and Conversation
            MessageField(
              messages: [
                // request User
                if (chat.controller.text.isNotEmpty)
                  createMessage(
                    chat.controller.text,
                    null,
                    'user',
                  ),

                // response from the model
                if (chat.answer.value.isNotEmpty &&
                    chat.sources.value.isNotEmpty)
                  createMessage(
                    chat.answer.value,
                    chat.sources.value,
                    'model',
                  ),
              ],
            ),

            // user input field
            Positioned(
              bottom: pZero,
              right: pZero,
              left: pZero,
              child: Column(
                children: [
                  if (!chat.isLoading.value && chat.answer.value.isEmpty) ...[
                    const Text(AppText.chatIntroduction),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(p16),
                    child: UserInputField(
                      inputController: chat.controller,
                      onSubmitted: chat.makePostRequest,
                      onUploadFile: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
