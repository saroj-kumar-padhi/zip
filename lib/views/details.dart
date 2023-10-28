import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  DetailsPage({required this.image, required this.title, required this.subtitle});

  // Obtain shared preferences.
  Future<void> _saveDataToSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Example: Saving the title and subtitle
    await prefs.setString('saved_title', title);
    await prefs.setString('saved_price', subtitle);
    // You can save other data as needed
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title), // Title won't be null due to it being required in the constructor
            Text('Price: $subtitle'),
             Image.network(image),

             SizedBox(height: 30,),

             TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return Colors.blue.withOpacity(0.04);
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
          return Colors.blue.withOpacity(0.12);
        return null; // Defer to the widget's default.
      },
    ),
  ),
  onPressed: () {
  
 _saveDataToSharedPreferences();
   },
  child: Text('Save')
)



            // Other product details as required
          ],
        ),
      ),
    );
  }
}
