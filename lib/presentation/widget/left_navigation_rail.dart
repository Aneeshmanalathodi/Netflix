import 'package:flutter/material.dart';

class LeftNavigationRail extends StatelessWidget {
  final bool extended;
  const LeftNavigationRail({super.key, this.extended = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: extended ? 200 : 72,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'NETFLIX',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: extended ? 20 : 16,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildNavItem(Icons.home, 'Home', extended),
                _buildNavItem(Icons.tv, 'TV Shows', extended),
                _buildNavItem(Icons.movie, 'Movies', extended),
                _buildNavItem(Icons.history, 'Recently Added', extended),
                _buildNavItem(Icons.list, 'My List', extended),
                _buildNavItem(Icons.trending_up, 'Trending Now', extended),
                const Divider(color: Colors.grey),
                _buildNavItem(
                  Icons.settings,
                  'Change Plan',
                  extended,
                  isSettings: true,
                ),
                _buildNavItem(Icons.help, 'FAQ', extended, isSettings: true),
                _buildNavItem(
                  Icons.info,
                  'Help Center',
                  extended,
                  isSettings: true,
                ),
                _buildNavItem(
                  Icons.description,
                  'Terms of Use',
                  extended,
                  isSettings: true,
                ),
                _buildNavItem(
                  Icons.privacy_tip,
                  'Privacy',
                  extended,
                  isSettings: true,
                ),
                _buildNavItem(
                  Icons.contact_support,
                  'Questions? Contact us',
                  extended,
                  isSettings: true,
                ),
              ],
            ),
          ),
          if (extended)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'NETFLIX V1.0',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool extended, {
    bool isSettings = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              children: [
                Icon(icon, size: 20, color: Colors.white70),
                if (extended) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
