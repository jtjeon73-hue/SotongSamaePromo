import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';

class PhoneMockup extends StatelessWidget {
  const PhoneMockup({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final width = compact ? 240.0 : 280.0;
    final height = compact ? 400.0 : 480.0;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          right: compact ? -8 : -16,
          top: compact ? 20 : 28,
          child: _FloatingBadge(
            icon: Icons.landscape_outlined,
            label: '관광 안내',
            color: AppColors.green,
          ),
        ),
        Positioned(
          left: compact ? -12 : -20,
          bottom: compact ? 40 : 56,
          child: _FloatingBadge(
            icon: Icons.diversity_3_outlined,
            label: '21개 마을',
            color: AppColors.olive,
          ),
        ),
        Container(
          width: width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(compact ? 30 : 36),
            boxShadow: AppDecorations.elevatedShadow,
          ),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: AppColors.cream,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.white12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.deepGreen, AppColors.olive, AppColors.heroAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.spa_outlined, color: Colors.white70, size: 16),
                              SizedBox(width: 6),
                              Text(
                                'SotongSamae',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            '소통사매',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.5,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '사매면 주민 플랫폼',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1.12,
                          children: const [
                            _MockMenu('행정', Icons.account_balance_outlined),
                            _MockMenu('마을소식', Icons.diversity_3_outlined),
                            _MockMenu('사매발전', Icons.handshake_outlined),
                            _MockMenu('관광', Icons.landscape_outlined),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                      decoration: const BoxDecoration(
                        color: AppColors.creamSurface,
                        border: Border(top: BorderSide(color: AppColors.warmBorder)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _MockTab(Icons.campaign_outlined, '공지', selected: true),
                          _MockTab(Icons.diversity_3_outlined, '마을'),
                          _MockTab(Icons.handshake_outlined, '발전'),
                          _MockTab(Icons.landscape_outlined, '관광'),
                          _MockTab(Icons.smart_toy_outlined, 'AI'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  const _FloatingBadge({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.creamSurface,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.warmBorder),
        boxShadow: AppDecorations.cardShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _MockMenu extends StatelessWidget {
  const _MockMenu(this.label, this.icon);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.creamSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.warmBorder),
        boxShadow: const [
          BoxShadow(color: Color(0x06000000), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: AppDecorations.iconBadge(AppColors.olive, radius: 10),
            child: Icon(icon, size: 14, color: AppColors.olive),
          ),
          const Spacer(),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _MockTab extends StatelessWidget {
  const _MockTab(this.icon, this.label, {this.selected = false});

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: selected ? AppColors.deepGreen : AppColors.olive),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w800,
            color: selected ? AppColors.deepGreen : AppColors.textOnGreen,
          ),
        ),
      ],
    );
  }
}
