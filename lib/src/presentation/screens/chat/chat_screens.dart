import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/src/domain/entities/message.dart';
import 'package:yes_no_app/src/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/src/presentation/widgets/chat/her_message_buble.dart';
import 'package:yes_no_app/src/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/src/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: _ChatView(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Goku'),
      centerTitle: false,
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://7ellm.com/wp-content/uploads/2019/09/goku-imagenes.jpg'),
        ),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemBuilder: (context, index) {
              final message = chatProvider.messagesList[index];
              return message.fromwho == Fromwho.her
                  ? const HerMesageBubble()
                  : MyMesageBubble(
                      message: message,
                    );
            },
            itemCount: chatProvider.messagesList.length,
          )),
          MessageFieldBox(
            onValue: (value) => chatProvider.sendMessage(value),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
