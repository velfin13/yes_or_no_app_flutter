import 'package:flutter/material.dart';
import 'package:yes_no_app/src/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/src/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    if (text.endsWith('?')) {
      herReply();
    }

    final newMessage = Message(text: text, fromwho: Fromwho.me);
    messagesList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
