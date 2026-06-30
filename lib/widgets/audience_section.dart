import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';
import 'landing_section.dart';

class AudienceSection extends StatelessWidget {
  const AudienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return LandingSection(
      eyebrow: '이용 대상',
      title: '이런 분들께 필요합니다',
      subtitle: '사매면 주민과 방문객, 그리고 지역에 관심 있는 분들을 위한 정보 공간을 준비하고 있습니다.',
      child: isMobile
          ? SizedBox(
              height: 168,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: AppCatalog.audienceSegments.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final seg = AppCatalog.audienceSegments[index];
                  return SizedBox(
                    width: 260,
                    child: _AudienceCard(segment: seg, compact: true),
                  );
                },
              ),
            )
          : ResponsiveGrid(
              minCardWidth: 240,
              maxColumns: 4,
              spacing: 14,
              children: [
                for (final seg in AppCatalog.audienceSegments)
                  _AudienceCard(segment: seg),
              ],
            ),
    );
  }
}

class _AudienceCard extends StatelessWidget {
  const _AudienceCard({required this.segment, this.compact = false});

  final AudienceSegment segment;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 16 : 20),
      decoration: AppDecorations.surfaceCard(accent: AppColors.green),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: AppDecorations.iconBadge(AppColors.deepGreen, radius: 12),
                child: Icon(segment.icon, size: 18, color: AppColors.deepGreen),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  segment.label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepGreen,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: compact ? 12 : 14),
          Text(
            segment.headline,
            style: TextStyle(
              fontSize: compact ? 14 : 15,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            segment.description,
            style: TextStyle(
              fontSize: compact ? 12 : 13,
              color: AppColors.textMuted,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
