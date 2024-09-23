import 'package:app_marq_wiki/constants/app_color.dart';
import 'package:app_marq_wiki/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../constants/app_text.dart';
import '../data/chat_repository.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/custom_text_box.dart';
import '../widgets/message_field.dart';

/// A screen that displays a chat interface.
class ChatScreen extends HookWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = ChatRepository();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text(
          AppText.appTitle,
        ),
      ),
      body: Container(
        color: AppColor.background,
        child: Stack(
          children: [
            if (chat.errorMessage.value.isNotEmpty) ...[
              const SizedBox(height: p16),
              Text(
                chat.errorMessage.value,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
            if (chat.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColor.yellow,
                ),
              ),
            if (chat.controller.text.isNotEmpty)
              CustomTextBox(
                alignment: Alignment.topRight,
                text: chat.controller.text,
              ),
            if (chat.answer.value.isNotEmpty)
              MessageField(
                messages: [chat.answer.value],
              ),
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
                    child: CustomInputField(
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
