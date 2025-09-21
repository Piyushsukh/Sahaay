import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminOverview extends StatelessWidget {
  const AdminOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Analytics Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Comprehensive mental health insights and institutional analytics',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: const [
                DashboardCard(
                  title: 'Total Active Students',
                  value: '2,847',
                  change: '+12.5% vs last month',
                  icon: Icons.group,
                  iconColor: Colors.blue,
                ),
                DashboardCard(
                  title: 'Anonymous Risk Percentage',
                  value: '18.3%',
                  change: '-2.1% vs last month',
                  icon: Icons.visibility_off,
                  iconColor: Colors.orange,
                ),
                DashboardCard(
                  title: 'Counselor Utilization',
                  value: '87.2%',
                  change: '+5.8% vs last month',
                  icon: Icons.person_pin_outlined,
                  iconColor: Colors.green,
                ),
                DashboardCard(
                  title: 'Resource Engagement',
                  value: '94.6%',
                  change: '+8.3% vs last month',
                  icon: Icons.bar_chart,
                  iconColor: Colors.lightGreen,
                ),
                DashboardCard(
                  title: 'Average Response Time',
                  value: '4.2 hrs',
                  change: '-1.3 hrs vs last month',
                  icon: Icons.access_time,
                  iconColor: Colors.purple,
                ),
                DashboardCard(
                  title: 'Crisis Interventions',
                  value: '23',
                  change: '-8 vs last month',
                  icon: Icons.warning_amber,
                  iconColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const StressHeatmap(),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final IconData icon;
  final Color iconColor;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        // 🔥 Always full width of screen minus padding
        width: screenWidth - 32,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Icon(icon, color: iconColor, size: 24),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              change,
              style: TextStyle(
                fontSize: 12,
                color: change.startsWith('+') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StressHeatmap extends StatefulWidget {
  const StressHeatmap({super.key});

  @override
  State<StressHeatmap> createState() => _StressHeatmapState();
}

class _StressHeatmapState extends State<StressHeatmap> {
  String selectedTime = "Full Semester";
  String selectedGroup = "All Students";

  final List<String> timeFilters = ["Full Semester", "This Month", "This Week"];

  final List<String> groupFilters = [
    "All Students",
    "Undergraduate",
    "Graduate",
    "International",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.heartPulse, color: Colors.redAccent),
                SizedBox(width: 8),
                const Text(
                  'Campus Stress Level Heatmap',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
              ],
            ),

            Wrap(
              spacing: 8,
              children: timeFilters.map((filter) {
                return ChoiceChip(
                  label: Text(filter),
                  selected: selectedTime == filter,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedTime = filter;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              children: groupFilters.map((filter) {
                return ChoiceChip(
                  label: Text(filter),
                  selected: selectedGroup == filter,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedGroup = filter;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // 🔥 Your table (can later filter data based on selections)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 12.0,
                dataRowHeight: 48,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Department',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Week 1',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Week 2',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Week 3',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Week 4',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Week 5',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Week 6',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Week 7',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Week 8',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('Computer Science')),
                      DataCell(Text('65%')),
                      DataCell(Text('72%')),
                      DataCell(Text('85%')),
                      DataCell(Text('78%')),
                      DataCell(Text('68%')),
                      DataCell(Text('75%')),
                      DataCell(Text('82%')),
                      DataCell(Text('90%')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Engineering')),
                      DataCell(Text('58%')),
                      DataCell(Text('64%')),
                      DataCell(Text('78%')),
                      DataCell(Text('71%')),
                      DataCell(Text('62%')),
                      DataCell(Text('69%')),
                      DataCell(Text('76%')),
                      DataCell(Text('83%')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Business')),
                      DataCell(Text('52%')),
                      DataCell(Text('59%')),
                      DataCell(Text('71%')),
                      DataCell(Text('65%')),
                      DataCell(Text('58%')),
                      DataCell(Text('63%')),
                      DataCell(Text('70%')),
                      DataCell(Text('77%')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Psychology')),
                      DataCell(Text('48%')),
                      DataCell(Text('55%')),
                      DataCell(Text('67%')),
                      DataCell(Text('61%')),
                      DataCell(Text('54%')),
                      DataCell(Text('59%')),
                      DataCell(Text('66%')),
                      DataCell(Text('73%')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Medicine')),
                      DataCell(Text('70%')),
                      DataCell(Text('77%')),
                      DataCell(Text('88%')),
                      DataCell(Text('82%')),
                      DataCell(Text('74%')),
                      DataCell(Text('79%')),
                      DataCell(Text('86%')),
                      DataCell(Text('93%')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Arts & Humanities')),
                      DataCell(Text('45%')),
                      DataCell(Text('52%')),
                      DataCell(Text('64%')),
                      DataCell(Text('58%')),
                      DataCell(Text('51%')),
                      DataCell(Text('56%')),
                      DataCell(Text('63%')),
                      DataCell(Text('70%')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
