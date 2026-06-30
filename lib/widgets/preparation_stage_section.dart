import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';
import 'landing_section.dart';

class PreparationStageSection extends StatelessWidget {
  const PreparationStageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return LandingSection(
      eyebrow: '준비 현황',
      title: '현재 준비 단계',
      subtitle: AppCatalog.preparationIntro,
      backgroundDecoration: AppDecorations.sectionTint(AppColors.cream),
      child: ResponsiveGrid(
        minCardWidth: isMobile ? 240 : 260,
        maxColumns: isMobile ? 1 : 2,
        spacing: isMobile ? 14 : 20,
        children: [
          for (final stage in AppCatalog.preparationStages)
            _StageCard(stage: stage, compact: isMobile),
        ],
      ),
    );
  }
}

class _StageCard extends StatelessWidget {
  const _StageCard({required this.stage, this.compact = false});

  final PreparationStage stage;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 18 : 24),
      decoration: AppDecorations.surfaceCard(accent: AppColors.green),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: compact ? 40 : 44,
            height: compact ? 40 : 44,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Text(
              '${stage.step}',
              style: TextStyle(
                color: Colors.white,
                fontSize: compact ? 16 : 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stage.title,
                  style: TextStyle(
                    fontSize: compact ? 15 : 17,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  stage.description,
                  style: TextStyle(
                    fontSize: compact ? 13 : 14,
                    color: AppColors.textMuted,
                    height: 1.55,
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
