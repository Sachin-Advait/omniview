import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/modules/chat_bot/components/build_assistance_messages.dart';
import 'package:omniview/modules/chat_bot/components/build_input_field.dart';

class ChatBuilder extends StatelessWidget {
  const ChatBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dummyMessages = [
      {"text": "Hello, how can I help you today?", "isUser": false},
      {"text": "I need a summary of Q2 sales.", "isUser": true},
      {"text": "Sure, fetching that for you...", "isUser": false},
      {"text": "Thank you!", "isUser": true},
      {"text": "Here's the summary: Revenue up by 20%.", "isUser": false},
      {"text": "That's great!", "isUser": true},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.widthMultiplier),
            children: [
              BuildAssistanceMessages(),
              ListView.separated(
                shrinkWrap: true,
                reverse: true,
                padding: const EdgeInsets.only(bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyMessages.length,
                separatorBuilder: (context, index) => 8.verticalSpace,
                itemBuilder: (context, index) {
                  final message =
                      dummyMessages[dummyMessages.length - 1 - index];
                  final isUser = message['isUser'] as bool;

                  return Align(
                    alignment: isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: kIsWeb
                            ? 330.widthMultiplier
                            : 200.widthMultiplier,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.widthMultiplier,
                          vertical: 10.heightMultiplier,
                        ),
                        decoration: BoxDecoration(
                          color: isUser
                              ? AppColors.violet
                              : AppColors.darkSlate,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.radiusMultipier),
                            topRight: Radius.circular(12.radiusMultipier),
                            bottomLeft: Radius.circular(
                              isUser ? 12.radiusMultipier : 0,
                            ),
                            bottomRight: Radius.circular(
                              isUser ? 0 : 12.radiusMultipier,
                            ),
                          ),
                        ),
                        child: SelectableText(
                          message['text'],
                          style: context.medium,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(color: AppColors.white, height: 0),
        Container(
          padding: EdgeInsets.only(bottom: 25),
          decoration: BoxDecoration(color: AppColors.primary),
          child: const BuildInputField(),
        ),
      ],
    );
  }
}
