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
      content:
          'Explore different types of computers for personal,work, and gaming needs.',
      isExpanded: false,
      subContent: [
        'Desktop Computers - Traditional, high-powered systems perfect for home or office use.',
        'Laptops - Portable computing devices.',
        'Gaming PCs - Designed for gaming with powerful GPUs and CPUs.',
        'Workstations - Professional-grade computers for design, engineering, or data processing.',
      ],
    ),
    Item(
      title: 'Mouse',
      content: 'Various types of computer mouse',
      isExpanded: false,
      subContent: [
        'Wired Mouse - A basic and reliable mouse that connects via USB.',
        'Wireless Mouse - Offers more flexibility with Bluetooth or USB receiver.',
        'Gaming Mouse - Features high-precision sensors and extra buttons for gaming.',
        'Ergonomic Mouse - Designed to reduce wrist strain.',
        'Vertical Mouse - Designed to keep the hand in a more natural.',
      ],
    ),
    Item(
      title: 'Keyboards',
      content:
          'Discover different keyboard styles, from mechanical to membrane types.',
      isExpanded: false,
      subContent: [
        'Mechanical Keyboards - Known for tactile feedback and longevity.',
        'Ergonomic Keyboards - Designed for comfort.',
        'Membrane Keyboards - Soft, quiet keyboards commonly used in offices.',
        'Wireless Keyboards - Keyboards that connect via Bluetooth or wireless receivers.',
        'Compact Keyboards - Small-sized keyboards ideal for minimalistic setups or portability.',
      ],
    ),
    Item(
      title: 'Monitors',
      content: 'Variety of monitors for gaming, work, and other  needs.',
      isExpanded: false,
      subContent: [
        'LED Monitors - Energy-efficient and commonly used for general work and entertainment.',
        'IPS Monitors - Known for better color accuracy and wide viewing angles.',
        'Curved Monitors - Provides an immersive experience with a curved screen design.',
        'Gaming Monitors - High refresh rate monitors.',
        '4K Monitors - Ultra high-definition monitors.',
      ],
    ),
    Item(
      title: 'Headphones',
      content:
          'Different variety of headphones for audio quality, comfort, and features.',
      isExpanded: false,
      subContent: [
        'Over-Ear Headphones - Large headphones.',
        'On-Ear Headphones - Compact and portable headphones that rest on the ears.',
        'In-Ear Headphones - Small, portable earphones that fit inside the ear canal.',
        'Noise-Cancelling Headphones - Reduces external noise.',
        'True Wireless Headphones - Completely wireless earbuds.',
      ],
    ),
  ];

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
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.greenAccent, Colors.green.shade100],
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
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade200, Colors.purple.shade100],
          ),
        ),
        padding: const EdgeInsets.all(10),
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
                item.isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.black,
                // Icon color
              ),
              onTap: () => _toggleItemExpansion(index),
            ),
            if (item.isExpanded)
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
                      ...item.subContent!.map((subItem) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.blueGrey,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  subItem,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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
      _items[index].isExpanded = !_items[index].isExpanded;
    });
  }
}
