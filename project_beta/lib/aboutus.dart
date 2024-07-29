import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'This Program',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Program ini adalah aplikasi untuk rental mobil mewah yang berada di bali',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Team',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.person,
                  size: 100,
                ),
                Text(
                  'I Ketut Sagita Narayana(2215354084)',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildGridItem(Icons.group, 'Mission'),
                  _buildGridItem(Icons.flag, 'Values'),
                  _buildGridItem(Icons.favorite, 'Contact'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 0.5,
            blurRadius: 1.5,
            offset: const Offset(2, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
