import 'package:flutter/material.dart';
import 'package:yes_no_app/src/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messagesList = [
    Message(text: 'hola', fromwho: Fromwho.me),
    Message(text: 'como estas?', fromwho: Fromwho.her),
    Message(text: 'si, y usted?', fromwho: Fromwho.me),
    Message(text: 'si', fromwho: Fromwho.her),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromwho: Fromwho.me);
    messagesList.add(newMessage);
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
