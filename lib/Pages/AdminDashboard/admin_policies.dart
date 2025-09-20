import 'package:flutter/material.dart';

class PoliciesView extends StatelessWidget {
  const PoliciesView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth < 600 ? 12 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Policy Recommendations',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 18 : 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Generate New',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const PolicyCard(
            priority: 'HIGH PRIORITY',
            status: 'PENDING',
            title: 'Increase Counselor Capacity During Exam Periods',
            description:
                'Data shows 40% spike in stress levels during midterms and finals. Recommend temporary counselor hiring.',
            cost: '\$15,000 per semester',
            timeline: '2-3 weeks to implement',
            expectedImpact:
                'Could reduce peak stress levels by 25% and improve appointment availability',
            implementationPlan: [
              'Hire 3 temporary counselors for exam periods',
              'Extend counseling hours to 8 PM during peak weeks',
              'Implement group counseling sessions for exam anxiety',
              'Create dedicated study wellness spaces',
            ],
            supportingData: {
              'Stress Increase': '40%',
              'Appointment Demand': '180%',
              'Students Seeking': '67%',
            },
          ),
          const SizedBox(height: 8),
          const PolicyCard(
            priority: 'MEDIUM PRIORITY',
            status: 'APPROVED',
            title: 'Implement Peer Support Program',
            description:
                'Anonymous forum engagement is high. Structured peer support could enhance mental health resources.',
            cost: '\$8,000 initial setup',
            timeline: '4-6 weeks to launch',
            expectedImpact:
                'Could reduce peak stress levels by 25% and improve appointment availability',
            implementationPlan: [
              'Hire 3 temporary counselors for exam periods',
              'Extend counseling hours to 8 PM during peak weeks',
              'Implement group counseling sessions for exam anxiety',
              'Create dedicated study wellness spaces',
            ],
            supportingData: {
              'Stress Increase': '40%',
              'Appointment Demand': '180%',
              'Students Seeking': '67%',
            },
          ),
          const SizedBox(height: 8),
          const PolicyCard(
            priority: 'LOW PRIORITY',
            status: 'UNDER REVIEW',
            title: 'Expand Digital Wellness Resources',
            description:
                'Mobile app usage indicates strong preference for self-help tools and guided meditation.',
            cost: '\$25,000 development',
            timeline: '3-4 months to develop',
            expectedImpact:
                'Could reduce peak stress levels by 25% and improve appointment availability',
            implementationPlan: [
              'Hire 3 temporary counselors for exam periods',
              'Extend counseling hours to 8 PM during peak weeks',
              'Implement group counseling sessions for exam anxiety',
              'Create dedicated study wellness spaces',
            ],
            supportingData: {
              'Stress Increase': '40%',
              'Appointment Demand': '180%',
              'Students Seeking': '67%',
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Last updated: September 12, 2025 at 2:45 PM',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          const Text(
            'Powered by AI Analytics Engine',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class PolicyCard extends StatefulWidget {
  final String priority;
  final String status;
  final String title;
  final String description;
  final String cost;
  final String timeline;
  final String expectedImpact;
  final List<String> implementationPlan;
  final Map<String, String> supportingData;

  const PolicyCard({
    super.key,
    required this.priority,
    required this.status,
    required this.title,
    required this.description,
    required this.cost,
    required this.timeline,
    required this.expectedImpact,
    required this.implementationPlan,
    required this.supportingData,
  });

  @override
  State<PolicyCard> createState() => _PolicyCardState();
}

class _PolicyCardState extends State<PolicyCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Color priorityColor;
    Color statusColor;
    switch (widget.priority) {
      case 'HIGH PRIORITY':
        priorityColor = Colors.red.shade800;
        break;
      case 'MEDIUM PRIORITY':
        priorityColor = Colors.orange.shade800;
        break;
      case 'LOW PRIORITY':
        priorityColor = Colors.blue.shade800;
        break;
      default:
        priorityColor = Colors.black54;
    }

    switch (widget.status) {
      case 'PENDING':
        statusColor = Colors.orange.shade800;
        break;
      case 'APPROVED':
        statusColor = Colors.green.shade800;
        break;
      case 'UNDER REVIEW':
        statusColor = Colors.blue.shade800;
        break;
      default:
        statusColor = Colors.black54;
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                _buildChip(widget.priority, priorityColor),
                _buildChip(widget.status, statusColor),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth < 600 ? 14 : 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.description,
              style: TextStyle(
                color: Colors.black54,
                fontSize: screenWidth < 600 ? 11 : 12,
              ),
            ),
          ],
        ),
        onExpansionChanged: (isExpanded) {
          setState(() {});
        },
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cost: ${widget.cost}',
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                Text(
                  'Timeline: ${widget.timeline}',
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                ...[
                  const SizedBox(height: 16),
                  const Text(
                    'Expected Impact',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.expectedImpact,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
                ...[
                  const SizedBox(height: 16),
                  const Text(
                    'Implementation Plan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  ...widget.implementationPlan.map(
                    (item) => Text(
                      '• $item',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
                ...[
                  const SizedBox(height: 16),
                  const Text(
                    'Supporting Data',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  screenWidth < 600
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.supportingData.entries
                              .map(
                                (entry) =>
                                    _buildDataColumn(entry.value, entry.key),
                              )
                              .toList(),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: widget.supportingData.entries
                              .map(
                                (entry) =>
                                    _buildDataColumn(entry.value, entry.key),
                              )
                              .toList(),
                        ),
                ],
                const SizedBox(height: 16),

                // ✅ Buttons responsive
                screenWidth < 600
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _buildButtons(context, true),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _buildButtons(context, false),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildDataColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  List<Widget> _buildButtons(BuildContext context, bool isVertical) {
    return [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: isVertical ? const Size.fromHeight(40) : null,
        ),
        child: const Text('Approve', style: TextStyle(color: Colors.white)),
      ),
      const SizedBox(width: 8, height: 8),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: isVertical ? const Size.fromHeight(40) : null,
        ),
        child: const Text(
          'Schedule Review',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      const SizedBox(width: 8, height: 8),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: isVertical ? const Size.fromHeight(40) : null,
        ),
        child: const Text(
          'Export Report',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ];
  }
}
