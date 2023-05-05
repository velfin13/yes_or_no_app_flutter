import 'package:flutter/material.dart';
import 'package:yes_no_app/src/domain/entities/message.dart';

class HerMesageBubble extends StatelessWidget {
  final Message message;
  const HerMesageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(
            imageUrl: message.imageUrl ??
                'https://yesno.wtf/assets/no/26-34b31d1f0777f70c61488f67a36576a9.gif'),
        const SizedBox(
          height: 9,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Esta enviando una imagen'),
          );
        },
      ),
    );
  }
}
