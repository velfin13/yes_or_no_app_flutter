import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final ValueChanged<String> onValue;
  MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // final colorSchema = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(0, 34, 28, 28)),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: 'Enter your message',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final textValue = textEditingController.value.text;
            onValue(textValue);
            textEditingController.clear();
          },
        ));

    return TextFormField(
      keyboardType: TextInputType.text,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textEditingController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textEditingController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
