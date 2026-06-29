import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';
import 'landing_section.dart';

class AiSection extends StatelessWidget {
  const AiSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);
    final examples = isMobile
        ? AppCatalog.aiExamples.take(2).toList()
        : AppCatalog.aiExamples;

    return LandingSection(
      eyebrow: 'AI VILLAGE ASSISTANT',
      title: 'AI 마을비서 활용 예시',
      subtitle: '복잡한 지역 정보도 자연어로 물어보세요. 공지·관광·행사·귀농 안내가 한결 쉬워지는 미래형 지역 앱입니다.',
      backgroundDecoration: AppDecorations.sectionTint(AppColors.lightGreen),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          final chat = _AiChatPanel(compact: isMobile);
          final exampleList = _AiExamplesList(examples: examples, compact: isMobile);

          if (isWide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: chat),
                const SizedBox(width: 20),
                Expanded(child: exampleList),
              ],
            );
          }
          return Column(
            children: [chat, SizedBox(height: isMobile ? 16 : 20), exampleList],
          );
        },
      ),
    );
  }
}

class _AiChatPanel extends StatelessWidget {
  const _AiChatPanel({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 18 : 24),
      decoration: AppDecorations.surfaceCard(accent: AppColors.olive),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: AppDecorations.iconBadge(AppColors.olive, radius: 12),
                child: const Icon(Icons.smart_toy_outlined, color: AppColors.olive, size: 20),
              ),
              const SizedBox(width: 10),
              const Text(
                'AI 마을비서',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
            ],
          ),
          SizedBox(height: compact ? 14 : 18),
          const _ChatBubble(
            isUser: false,
            text: '안녕하세요. 공지, 관광, 행사, 귀농 지원사업을 물어보세요.',
          ),
          const SizedBox(height: 10),
          const _ChatBubble(isUser: true, text: '혼불문학관 운영시간 알려줘'),
          const SizedBox(height: 10),
          const _ChatBubble(
            isUser: false,
            text: '혼불문학관 운영시간, 위치, 전화번호, 사진, 영상, 길찾기 정보를 연결해 드립니다.',
          ),
        ],
      ),
    );
  }
}

class _AiExamplesList extends StatelessWidget {
  const _AiExamplesList({required this.examples, this.compact = false});

  final List<AiExample> examples;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final example in examples)
          Padding(
            padding: EdgeInsets.only(bottom: compact ? 10 : 12),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(compact ? 14 : 18),
              decoration: AppDecorations.surfaceCard(accent: AppColors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.chat_bubble_outline, size: 16, color: AppColors.green),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          example.question,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            fontSize: compact ? 13 : 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    example.answer,
                    style: TextStyle(
                      color: AppColors.textMuted,
                      height: 1.5,
                      fontSize: compact ? 12 : 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.isUser, required this.text});

  final bool isUser;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 420),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isUser ? AppColors.green.withValues(alpha: 0.12) : AppColors.lightGreen,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isUser
                ? AppColors.green.withValues(alpha: 0.2)
                : AppColors.warmBorder,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? AppColors.textOnGreen : AppColors.textPrimary,
            height: 1.45,
            fontSize: 13,
            fontWeight: isUser ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
