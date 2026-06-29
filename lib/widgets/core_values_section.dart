import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import 'landing_section.dart';

class CoreValuesSection extends StatelessWidget {
  const CoreValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingSection(
      eyebrow: 'WHY SOTONGSAMAe',
      title: '소통사매가 전하는 가치',
      subtitle: '주민의 일상부터 방문객의 여행, 귀농귀촌의 정착, 지역 발전의 참여까지 — 사매면에 맞춘 정보를 담았습니다.',
      backgroundDecoration: AppDecorations.sectionTint(AppColors.cream),
      child: ResponsiveGrid(
        minCardWidth: 260,
        maxColumns: 3,
        children: [
          for (final item in AppCatalog.coreValues)
            PromoCard(
              icon: item.icon,
              title: item.title,
              subtitle: item.subtitle,
              accentColor: item.accentColor,
              audience: item.audience,
            ),
        ],
      ),
    );
  }
}
