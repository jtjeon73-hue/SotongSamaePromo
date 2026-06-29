import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_layout.dart';
import 'landing_section.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return LandingSection(
      anchorKey: sectionKey,
      eyebrow: 'APP FEATURES',
      title: '앱 주요 기능',
      subtitle: '출시 예정인 소통사매앱의 하단 5개 탭과 홈 메뉴 8종을 미리 살펴보세요.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubsectionLabel(title: '5개 메인 탭', trailing: '하단 네비게이션'),
          ResponsiveGrid(
            minCardWidth: isMobile ? 150 : 200,
            maxColumns: isMobile ? 2 : 3,
            spacing: isMobile ? 12 : 16,
            children: [
              for (final tab in AppCatalog.appTabs)
                PromoCard(
                  icon: tab.icon,
                  title: tab.title,
                  subtitle: tab.subtitle,
                  accentColor: AppColors.green,
                  compact: isMobile,
                ),
            ],
          ),
          SizedBox(height: isMobile ? 28 : 36),
          const SubsectionLabel(title: '홈 메뉴 8종', trailing: '생활·농촌 정보'),
          ResponsiveGrid(
            minCardWidth: isMobile ? 140 : 180,
            maxColumns: isMobile ? 2 : 4,
            spacing: isMobile ? 12 : 16,
            children: [
              for (final menu in AppCatalog.homeMenus)
                PromoCard(
                  icon: menu.icon,
                  title: menu.title,
                  subtitle: menu.subtitle,
                  accentColor: AppColors.olive,
                  compact: true,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
