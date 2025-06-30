import 'package:flutter/material.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/modules/chat_bot/components/chat_builder.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () => scrollToBottom());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: CustomAppBar(title: 'ChatBot', showBackButton: true),
        body: ChatBuilder(),
      ),
    );
  }
}
