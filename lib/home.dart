import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(100.0), // Adjust the height if needed
        child: Padding(
          padding: const EdgeInsets.only(left: 0), // Padding around the AppBar
          child: AppBar(
            toolbarHeight: 100,
            leading: const SizedBox(), // Hides the default back button
            title: Padding(
              padding: const EdgeInsets.only(
                  top: 25, left: 20), // Padding for the title
              child: Image.asset(
                'assets/Asset 1.png', // Add your logo image here
                height: 32,
                width: 234,
                // Adjust logo size if needed
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, top: 26), // Padding for the action icons
                child: IconButton(
                  icon:
                      const Icon(Icons.notifications), // Notification bell icon
                  onPressed: () {
                    // Add functionality when notification icon is pressed
                    print("Notification icon pressed");
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Body with Carousel displaying images directly
      body: Padding(
        padding: const EdgeInsets.only(top: 26.0), // Padding from top
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(
                'assets/1 Header.png', // Replace with your image file
                fit: BoxFit.cover,
                width: 300,
              ),
              Image.asset(
                'assets/3 Header.png', // Replace with your image file
                fit: BoxFit.cover,
                width: 300,
              ),
            ],
          ),
        ),
      ),

      // Adding the footer with buttons and icons
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixes the shifting behavior
        currentIndex: 0, // Set to Home index
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              // Add navigation to Discover page if needed
              break;
            case 2:
              // Add navigation to My Learning page if needed
              break;
            case 3:
              // Add navigation to Translate page if needed
              break;
            case 4:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My Learning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.translate),
            label: 'Translate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
