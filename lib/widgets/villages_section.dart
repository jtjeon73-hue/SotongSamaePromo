import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';
import 'landing_section.dart';

class VillagesSection extends StatelessWidget {
  const VillagesSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);
    final featured = isMobile
        ? AppCatalog.featuredVillages.take(4).toList()
        : AppCatalog.featuredVillages;

    return LandingSection(
      anchorKey: sectionKey,
      eyebrow: '21 VILLAGES',
      title: '사매면 21개 마을을 하나로 연결합니다',
      subtitle: '마을별 게시판에서 이웃의 소식과 사진을 나누세요. 우리 마을 이야기는 우리 마을에서 시작됩니다.',
      backgroundDecoration: AppDecorations.sectionTint(AppColors.lightGreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubsectionLabel(title: '대표 마을', trailing: '게시판 · 사진 · 댓글'),
          ResponsiveGrid(
            minCardWidth: isMobile ? 150 : 200,
            maxColumns: isMobile ? 2 : 3,
            spacing: 12,
            children: [
              for (final village in featured)
                _VillageCard(name: village),
            ],
          ),
          SizedBox(height: isMobile ? 22 : 28),
          const SubsectionLabel(title: '전체 21개 마을'),
          if (isMobile)
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: AppCatalog.allVillages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) => _VillageChip(name: AppCatalog.allVillages[i]),
              ),
            )
          else
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final village in AppCatalog.allVillages)
                  _VillageChip(name: village),
              ],
            ),
        ],
      ),
    );
  }
}

class _VillageCard extends StatelessWidget {
  const _VillageCard({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: AppDecorations.surfaceCard(accent: AppColors.green),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: AppDecorations.iconBadge(AppColors.green, radius: 14),
            child: const Icon(Icons.home_work_outlined, color: AppColors.green, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '마을 소식 · 이웃과 소통',
                  style: TextStyle(fontSize: 12, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VillageChip extends StatelessWidget {
  const _VillageChip({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.creamSurface,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.warmBorder),
        boxShadow: const [
          BoxShadow(color: Color(0x06000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.textOnGreen,
          fontSize: 13,
        ),
      ),
    );
  }
}
