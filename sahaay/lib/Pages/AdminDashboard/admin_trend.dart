import 'package:flutter/material.dart';

class TrendsView extends StatelessWidget {
  const TrendsView({super.key});

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
            const Text(
              'Mental Health Trends',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildChartFilterButton('Line Chart', true),
                  _buildChartFilterButton('Bar Chart', false),
                  _buildChartFilterButton('Pie Chart', false),
                  const SizedBox(width: 8),
                  _buildChartFilterButton('3 Months', false),
                  _buildChartFilterButton('6 Months', true),
                  _buildChartFilterButton('1 Year', false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: CustomPaint(
                painter: LineChartPainter(),
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartFilterButton(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black54,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Dummy data for the chart
    final appointmentsData = [
      150.0,
      160.0,
      190.0,
      155.0,
      135.0,
      200.0,
      220.0,
      230.0,
    ];
    final assessmentsData = [
      90.0,
      105.0,
      125.0,
      100.0,
      80.0,
      140.0,
      160.0,
      170.0,
    ];
    final riskAlertsData = [10.0, 15.0, 20.0, 12.0, 10.0, 20.0, 25.0, 28.0];

    // X-axis labels (months)
    final xLabels = ['Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'];

    // Y-axis labels (values)
    final yLabels = [0, 60, 120, 180, 240];

    final double padding = 30.0;
    final double chartWidth = size.width - 2 * padding;
    final double chartHeight = size.height - 2 * padding;
    final double xStep = chartWidth / (appointmentsData.length - 1);
    final double yMax = 240.0;

    // Grid lines and labels
    final paintGrid = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1.0;

    for (int i = 0; i < yLabels.length; i++) {
      final y = padding + chartHeight - (yLabels[i] / yMax) * chartHeight;
      canvas.drawLine(
        Offset(padding, y),
        Offset(size.width - padding, y),
        paintGrid,
      );
      final textPainter = TextPainter(
        text: TextSpan(
          text: yLabels[i].toString(),
          style: const TextStyle(color: Colors.black54, fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(padding - textPainter.width - 5, y - textPainter.height / 2),
      );
    }

    // X-axis labels
    for (int i = 0; i < xLabels.length; i++) {
      final x = padding + i * xStep;
      final textPainter = TextPainter(
        text: TextSpan(
          text: xLabels[i],
          style: const TextStyle(color: Colors.black54, fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, size.height - padding + 5),
      );
    }

    // Function to draw a line and points
    void drawLine(List<double> data, Color color) {
      final paint = Paint()
        ..color = color
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;

      final path = Path();
      for (int i = 0; i < data.length; i++) {
        final x = padding + i * xStep;
        final y = padding + chartHeight - (data[i] / yMax) * chartHeight;
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
        canvas.drawCircle(Offset(x, y), 3, Paint()..color = color);
      }
      canvas.drawPath(path, paint);
    }

    drawLine(appointmentsData, Colors.green);
    drawLine(assessmentsData, Colors.blueGrey.shade300);
    drawLine(riskAlertsData, Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
