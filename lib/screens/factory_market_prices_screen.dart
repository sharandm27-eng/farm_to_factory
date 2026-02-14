  import 'package:flutter/material.dart';
  import 'package:fl_chart/fl_chart.dart';


  class FactoryMarketPricesScreen extends StatelessWidget {
    const FactoryMarketPricesScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xFFF9F8F3),

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Market Prices',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [

              Text(
                'Today – Guntur District',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
               SizedBox(height: 20),

 Text(
  'Price History - Chilli (Guntur S4)',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),

SizedBox(height: 20),

SizedBox(
  height: 250,
  child: _PriceHistoryChart(),
),

SizedBox(height: 30),


              SizedBox(height: 24),

              _PriceCard(
                crop: 'Tomato',
                mandi: '₹20 – ₹28',
                local: '₹22',
                factory: '₹32',
                change: '+14%',
              ),

              SizedBox(height: 20),

              _PriceCard(
                crop: 'Chilli (Guntur S4)',
                mandi: '₹150 – ₹175',
                local: '₹160',
                factory: '₹185',
                change: '+6%',
              ),

              SizedBox(height: 20),

              _PriceCard(
                crop: 'Onion',
                mandi: '₹30 – ₹38',
                local: '₹32',
                factory: '₹42',
                change: '+11%',
              ),

              SizedBox(height: 40),

              Center(
                child: Text(
                  '💡 Factory prices are typically 10–15% higher than mandi prices.\nSell directly to get better returns!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  class _PriceCard extends StatelessWidget {
    final String crop;
    final String mandi;
    final String local;
    final String factory;
    final String change;

    const _PriceCard({
      required this.crop,
      required this.mandi,
      required this.local,
      required this.factory,
      required this.change,
    });

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
         border: Border.all(color: Colors.green.withValues(alpha: 0.4)),
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              crop,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
            Text('Mandi Price: $mandi'),
            Text('Local Buyer: $local'),

            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Factory Price: $factory',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    change,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
  class _PriceHistoryChart extends StatelessWidget {
  const _PriceHistoryChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = ['Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan'];
                if (value.toInt() >= 0 && value.toInt() < months.length) {
                  return Text(months[value.toInt()]);
                }
                return const Text('');
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        minX: 0,
        maxX: 5,
        minY: 100,
        maxY: 200,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 140),
              FlSpot(1, 155),
              FlSpot(2, 165),
              FlSpot(3, 160),
              FlSpot(4, 170),
              FlSpot(5, 175),
            ],
            isCurved: true,
            color: Colors.green,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withValues(alpha: 0.1)

            ),
          ),
          LineChartBarData(
            spots: const [
              FlSpot(0, 155),
              FlSpot(1, 170),
              FlSpot(2, 180),
              FlSpot(3, 175),
              FlSpot(4, 185),
              FlSpot(5, 190),
            ],
            isCurved: true,
            color: Colors.lightGreen,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: false,
            ),
          ),
        ],
      ),
    );
  }
}

