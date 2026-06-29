import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
    required this.onAnchorTap,
  });

  final void Function(String anchor) onAnchorTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      color: AppColors.deepGreen,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppCatalog.brandName,
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 6),
              Text(
                '사매면 지역 생활정보 플랫폼',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 14),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  for (final item in AppCatalog.navItems)
                    InkWell(
                      onTap: () => onAnchorTap(item.anchor),
                      child: Text(
                        item.label,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.white.withValues(alpha: 0.2)),
              const SizedBox(height: 16),
              Text(
                '© ${DateTime.now().year} ${AppCatalog.brandName} · 전북 남원시 사매면',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
