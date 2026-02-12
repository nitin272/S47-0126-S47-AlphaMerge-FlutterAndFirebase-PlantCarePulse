import 'package:flutter/material.dart';

// Care schedule screen - demonstrates calendar/schedule view
class CareScheduleScreen extends StatelessWidget {
  const CareScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Care Schedule'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isTablet) {
            // Tablet: Two-column layout
            return SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(
                            fontSize: isTablet ? 28 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isTablet ? 20 : 16),
                        _ScheduleCard(
                          plantName: 'Monstera "Monty"',
                          task: 'Water',
                          time: '10:00 AM',
                          icon: Icons.water_drop,
                          color: Colors.blue,
                          isCompleted: false,
                          isTablet: isTablet,
                        ),
                        SizedBox(height: isTablet ? 16 : 12),
                        _ScheduleCard(
                          plantName: 'Peace Lily "Lily"',
                          task: 'Check soil',
                          time: '2:00 PM',
                          icon: Icons.touch_app,
                          color: Colors.orange,
                          isCompleted: true,
                          isTablet: isTablet,
                        ),
                        SizedBox(height: isTablet ? 32 : 24),
                        Text(
                          'Tomorrow',
                          style: TextStyle(
                            fontSize: isTablet ? 28 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isTablet ? 20 : 16),
                        _ScheduleCard(
                          plantName: 'Pothos "Patty"',
                          task: 'Water',
                          time: '9:00 AM',
                          icon: Icons.water_drop,
                          color: Colors.blue,
                          isCompleted: false,
                          isTablet: isTablet,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Right column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This Week',
                          style: TextStyle(
                            fontSize: isTablet ? 28 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isTablet ? 20 : 16),
                        _ScheduleCard(
                          plantName: 'Aloe Vera "Allie"',
                          task: 'Water',
                          time: 'Friday',
                          icon: Icons.water_drop,
                          color: Colors.blue,
                          isCompleted: false,
                          isTablet: isTablet,
                        ),
                        SizedBox(height: isTablet ? 16 : 12),
                        _ScheduleCard(
                          plantName: 'Fiddle Leaf Fig "Figgy"',
                          task: 'Fertilize',
                          time: 'Saturday',
                          icon: Icons.science,
                          color: Colors.green,
                          isCompleted: false,
                          isTablet: isTablet,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Mobile: Single column layout
            return ListView(
              padding: EdgeInsets.all(screenWidth * 0.04),
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: isTablet ? 28 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isTablet ? 20 : 16),
                _ScheduleCard(
                  plantName: 'Monstera "Monty"',
                  task: 'Water',
                  time: '10:00 AM',
                  icon: Icons.water_drop,
                  color: Colors.blue,
                  isCompleted: false,
                  isTablet: isTablet,
                ),
                SizedBox(height: isTablet ? 16 : 12),
                _ScheduleCard(
                  plantName: 'Peace Lily "Lily"',
                  task: 'Check soil',
                  time: '2:00 PM',
                  icon: Icons.touch_app,
                  color: Colors.orange,
                  isCompleted: true,
                  isTablet: isTablet,
                ),
                SizedBox(height: isTablet ? 32 : 24),
                Text(
                  'Tomorrow',
                  style: TextStyle(
                    fontSize: isTablet ? 28 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isTablet ? 20 : 16),
                _ScheduleCard(
                  plantName: 'Pothos "Patty"',
                  task: 'Water',
                  time: '9:00 AM',
                  icon: Icons.water_drop,
                  color: Colors.blue,
                  isCompleted: false,
                  isTablet: isTablet,
                ),
                SizedBox(height: isTablet ? 32 : 24),
                Text(
                  'This Week',
                  style: TextStyle(
                    fontSize: isTablet ? 28 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isTablet ? 20 : 16),
                _ScheduleCard(
                  plantName: 'Aloe Vera "Allie"',
                  task: 'Water',
                  time: 'Friday',
                  icon: Icons.water_drop,
                  color: Colors.blue,
                  isCompleted: false,
                  isTablet: isTablet,
                ),
                SizedBox(height: isTablet ? 16 : 12),
                _ScheduleCard(
                  plantName: 'Fiddle Leaf Fig "Figgy"',
                  task: 'Fertilize',
                  time: 'Saturday',
                  icon: Icons.science,
                  color: Colors.green,
                  isCompleted: false,
                  isTablet: isTablet,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

// Schedule card widget - Responsive
class _ScheduleCard extends StatefulWidget {
  final String plantName;
  final String task;
  final String time;
  final IconData icon;
  final Color color;
  final bool isCompleted;
  final bool isTablet;

  const _ScheduleCard({
    required this.plantName,
    required this.task,
    required this.time,
    required this.icon,
    required this.color,
    required this.isCompleted,
    this.isTablet = false,
  });

  @override
  State<_ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<_ScheduleCard> {
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 2,
        color: _isCompleted ? Colors.grey[50] : Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.all(widget.isTablet ? 16 : 12),
          leading: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: CircleAvatar(
              radius: widget.isTablet ? 28 : 24,
              backgroundColor: widget.color.withOpacity(_isCompleted ? 0.1 : 0.2),
              child: Icon(
                widget.icon,
                color: widget.color.withOpacity(_isCompleted ? 0.5 : 1.0),
                size: widget.isTablet ? 28 : 24,
              ),
            ),
          ),
          title: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: widget.isTablet ? 18 : 16,
              decoration: _isCompleted ? TextDecoration.lineThrough : null,
              color: _isCompleted ? Colors.grey : Colors.black,
            ),
            child: Text(widget.plantName),
          ),
          subtitle: Text(
            '${widget.task} • ${widget.time}',
            style: TextStyle(fontSize: widget.isTablet ? 15 : 14),
          ),
          trailing: Checkbox(
            value: _isCompleted,
            onChanged: (value) {
              setState(() {
                _isCompleted = value ?? false;
              });
              if (_isCompleted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.task} completed! ✓'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
