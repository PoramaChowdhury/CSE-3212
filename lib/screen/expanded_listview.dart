import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/model/expanded_item.dart';

class ExpandedListView extends StatefulWidget {
  const ExpandedListView({super.key});

  @override
  _ExpandedListViewState createState() => _ExpandedListViewState();
}

class _ExpandedListViewState extends State<ExpandedListView> {
  final List<Item> _items = [
    Item(
      title: 'Computers',
      content: 'Discover the best computers for work, play, and personal use.',
      isExpanded: false,
      subContent: [
        'Desktop Computers',
        'Laptops',
        'Gaming PCs',
        'Workstations',
      ],
    ),
    Item(
      title: 'Mouse',
      content: 'Various types of computer mouse',
      isExpanded: false,
      subContent: [
        'Wired Mouse ',
        'Wireless Mouse',
        'Gaming Mouse',
        'Ergonomic Mouse',
        'Vertical Mouse',
      ],
    ),
    Item(
      title: 'Keyboards',
      content:
          'Discover different keyboard styles,from mechanical to membrane types.',
      isExpanded: false,
      subContent: [
        'Mechanical Keyboards',
        'Ergonomic Keyboards',
        'Membrane Keyboards',
        'Wireless Keyboards',
        'Compact Keyboards',
      ],
    ),
    Item(
      title: 'Monitors',
      content: 'Variety of monitors for gaming, work, and other needs.',
      isExpanded: false,
      subContent: [
        'LED Monitors',
        'IPS Monitors',
        'Curved Monitors',
        'Gaming Monitors',
        '4K Monitors',
      ],
    ),
    Item(
      title: 'Headphones',
      content: 'Different types of headphone for audio,comfort, and features.',
      isExpanded: false,
      subContent: [
        'Over-Ear Headphones',
        'On-Ear Headphones',
        'In-Ear Headphones',
        'Noise-Cancelling Headphones',
        'True Wireless Headphones',
      ],
    ),
  ];

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Gadget Hub',
          style: GoogleFonts.montserrat(
            color: Colors.blueGrey,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.greenAccent.shade100, Colors.green.shade100],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return _buildExpandableItem(item, index);
          },
        ),
      ),
    );
  }

  Widget _buildExpandableItem(Item item, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade200, Colors.purple.shade100],
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text(
                item.title,
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                _expandedIndex == index
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                color: Colors.black,
              ),
              onTap: () => _toggleItemExpansion(index),
            ),
            if (_expandedIndex == index)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.content,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 14),
                    if (item.subContent != null)
                      ...item.subContent!.map(
                        (subItem) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 6,
                                color: Colors.blueGrey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                subItem,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _toggleItemExpansion(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = null;
      } else {
        _expandedIndex = index;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Clicked on ${_items[index].title}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.blueGrey,
        /*action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: () {},
        ),*/
      ),
    );
  }
}
