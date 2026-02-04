import 'package:flutter/material.dart';

/// Basic ListView Examples
class BasicListViewExamples {
  
  /// Simple ListView with static children
  static Widget simpleListView() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('User 1'),
          subtitle: Text('Online'),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('User 2'),
          subtitle: Text('Offline'),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('User 3'),
          subtitle: Text('Online'),
        ),
      ],
    );
  }

  /// ListView.builder for dynamic/large lists
  static Widget builderListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text('Item $index'),
          subtitle: Text('This is item number $index'),
        );
      },
    );
  }

  /// Horizontal ListView
  static Widget horizontalListView() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.all(8),
            color: Colors.teal[100 * (index + 2)],
            child: Center(child: Text('Card $index')),
          );
        },
      ),
    );
  }
}

/// Basic GridView Examples
class BasicGridViewExamples {
  
  /// Simple GridView with fixed count
  static Widget simpleGridView() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        Container(color: Colors.red, height: 100),
        Container(color: Colors.green, height: 100),
        Container(color: Colors.blue, height: 100),
        Container(color: Colors.yellow, height: 100),
      ],
    );
  }

  /// GridView.builder for dynamic grids
  static Widget builderGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(child: Text('Item $index')),
        );
      },
    );
  }

  /// GridView with custom aspect ratio
  static Widget customAspectGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.8, // Width/Height ratio
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 30),
              Text('$index'),
            ],
          ),
        );
      },
    );
  }
}

/// Performance Tips and Best Practices
class ScrollablePerformanceTips {
  
  /// Example of efficient list item with const constructor
  static Widget efficientListItem(String title, String subtitle, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text('$index'),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      // Use const where possible
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  /// Example of avoiding expensive operations in builder
  static Widget optimizedGridItem(int index) {
    // Pre-calculate expensive values outside builder if possible
    final color = Colors.primaries[index % Colors.primaries.length];
    final iconData = _getIconForIndex(index);
    
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: Colors.white, size: 30),
          Text('Item $index', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  static IconData _getIconForIndex(int index) {
    const icons = [
      Icons.home,
      Icons.favorite,
      Icons.star,
      Icons.settings,
      Icons.person,
      Icons.notifications,
    ];
    return icons[index % icons.length];
  }
}

/// Common Pitfalls and Solutions
class ScrollablePitfalls {
  
  /// ❌ BAD: Creating all widgets upfront for large lists
  static Widget badLargeList() {
    return ListView(
      children: List.generate(1000, (index) {
        return ListTile(title: Text('Item $index'));
      }),
    );
  }

  /// ✅ GOOD: Using builder for large lists
  static Widget goodLargeList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index) {
        return ListTile(title: Text('Item $index'));
      },
    );
  }

  /// ❌ BAD: Nested scrolling without proper physics
  static Widget badNestedScrolling() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ GOOD: Proper nested scrolling configuration
  static Widget goodNestedScrolling() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable inner scroll
              shrinkWrap: true, // Take only required space
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
            ),
          ),
        ],
      ),
    );
  }
}