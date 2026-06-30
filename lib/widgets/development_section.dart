import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';
import 'landing_section.dart';

class DevelopmentSection extends StatelessWidget {
  const DevelopmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return LandingSection(
      eyebrow: '사매발전',
      title: '사매발전, 함께 만드는 사매면',
      subtitle: AppCatalog.developmentMessage,
      backgroundDecoration: AppDecorations.sectionTint(AppColors.cream),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 20 : 28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.olive, AppColors.heroAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: AppDecorations.cardShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '주민 연결 · 지역 커뮤니티 · 투명한 소통',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.82),
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 12 : 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '사매면의 미래를 함께 만들어 갑니다',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '주민 제안부터 사업 진행까지, 사매면의 변화를 함께 따라갈 수 있도록 준비하고 있습니다.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.88),
                    fontSize: isMobile ? 13 : 14,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 20 : 24),
          ResponsiveGrid(
            minCardWidth: isMobile ? 260 : 300,
            maxColumns: 2,
            spacing: isMobile ? 14 : 20,
            children: [
              for (final item in AppCatalog.developmentItems)
                _DevelopmentCard(item: item, compact: isMobile),
            ],
          ),
        ],
      ),
    );
  }
}

class _DevelopmentCard extends StatelessWidget {
  const _DevelopmentCard({required this.item, this.compact = false});

  final DevelopmentItem item;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 18 : 24),
      decoration: AppDecorations.surfaceCard(accent: AppColors.deepGreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: AppDecorations.iconBadge(AppColors.deepGreen),
                child: Icon(item.icon, color: AppColors.deepGreen, size: compact ? 22 : 26),
              ),
              const Spacer(),
              if (item.progress != null)
                Text(
                  '${(item.progress! * 100).round()}%',
                  style: const TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
            ],
          ),
          SizedBox(height: compact ? 12 : 16),
          Text(
            item.title,
            style: TextStyle(
              fontSize: compact ? 16 : 18,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: TextStyle(
              color: AppColors.textMuted,
              height: 1.55,
              fontSize: compact ? 13 : 14,
            ),
          ),
          if (item.progress != null) ...[
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: item.progress,
                minHeight: 8,
                backgroundColor: AppColors.lightGreen,
                color: AppColors.green,
              ),
            ),
          ],
          const SizedBox(height: 14),
          for (final highlight in item.highlights)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle_outline, size: 16, color: AppColors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      highlight,
                      style: TextStyle(
                        color: AppColors.textMuted,
                        height: 1.45,
                        fontSize: compact ? 12 : 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
