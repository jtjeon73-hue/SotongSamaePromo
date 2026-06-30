import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({
    super.key,
    required this.sectionKey,
    required this.onNotifyTap,
    required this.onContactTap,
    required this.onFeedbackTap,
  });

  final Key sectionKey;
  final VoidCallback onNotifyTap;
  final VoidCallback onContactTap;
  final VoidCallback onFeedbackTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return Container(
      key: sectionKey,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: AppLayout.horizontalPadding(context),
        vertical: isMobile ? 28 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Container(
            padding: EdgeInsets.all(isMobile ? 24 : 40),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.deepGreen, Color(0xFF166534), AppColors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(isMobile ? 24 : 32),
              boxShadow: AppDecorations.elevatedShadow,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;
                final titleSize = isMobile ? 22.0 : 28.0;

                final text = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppCatalog.ctaTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleSize,
                        fontWeight: FontWeight.w900,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppCatalog.ctaSubtitle,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: isMobile ? 14 : 16,
                        height: 1.65,
                      ),
                    ),
                  ],
                );

                final buttons = Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.deepGreen,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        textStyle: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      onPressed: onContactTap,
                      icon: const Icon(Icons.mail_outline),
                      label: const Text('문의하기'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white.withValues(alpha: 0.45)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        textStyle: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      onPressed: onFeedbackTap,
                      icon: const Icon(Icons.edit_note_outlined),
                      label: const Text('의견 보내기'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.lightGreen,
                        side: BorderSide(color: AppColors.lightGreen.withValues(alpha: 0.5)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        textStyle: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      onPressed: onNotifyTap,
                      icon: const Icon(Icons.notifications_active_outlined),
                      label: const Text('앱 출시 소식 받기'),
                    ),
                  ],
                );

                if (isWide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: text),
                      const SizedBox(width: 32),
                      SizedBox(width: 260, child: buttons),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [text, SizedBox(height: isMobile ? 22 : 28), buttons],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
