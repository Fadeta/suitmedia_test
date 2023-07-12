import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:suitmedia_test/modules/secondscreens.dart';
import 'package:suitmedia_test/style/style.dart';
import 'package:suitmedia_test/textfield/textfield.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = '/firstscreens';
  // FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameController = TextEditingController();
  final textController = TextEditingController();

  bool palindrome() {
    String? original = textController.text;
    print(original);

    String? reverse = original.split('').reversed.join('');
    print(reverse);

    if (original == reverse) {
      final snackBar = SnackBar(content: Text('True'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Its A Palindrome');
    } else {
      final snackBar = SnackBar(content: const Text('False'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Its A Not Palindrome');
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 116,
                        height: 116,
                        child: Image.asset('assets/images/btn_add_photo.png'),
                      ),
                      const SizedBox(height: 58.12),
                      const CustomTextfield(
                        obscureText: false,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 22.12),
                      const CustomTextfield(
                        obscureText: false,
                        hintText: 'Palindrome',
                      ),
                      const SizedBox(height: 45),
                      MaterialButton(
                        child: Text('CHECK',
                            style: Theme.of(context).textTheme.titleLarge),
                        color: secondaryColor,
                        height: 53,
                        minWidth: MediaQuery.of(context).size.width,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          palindrome();
                        },
                      ),
                      SizedBox(height: 22.12),
                      MaterialButton(
                        child: Text('NEXT',
                            style: Theme.of(context).textTheme.titleLarge),
                        color: secondaryColor,
                        height: 53,
                        minWidth: MediaQuery.of(context).size.width,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SecondScreen.routeName,
                              arguments: nameController.text);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => SecondScreen(
                          //       name: '',
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _buildNameField() {
//   return TextFormField(
//     style: Theme.of(context).textTheme.titleSmall,
//     controller: nameController,
//     validator: (text) {
//       if (text != null && text.isNotEmpty) {
//         return null;
//       } else {
//         return 'Name can\'t be empty!';
//       }
//     },
//     decoration: InputDecoration(
//       errorStyle: const TextStyle(
//         color: Colors.red,
//         wordSpacing: 5.0,
//       ),
//       hintText: 'Name',
//       hintStyle: Theme.of(context).textTheme.titleSmall,
//     ),
//   );
// }

// Widget _buildTextField() {
//   return TextFormField(
//     style: Theme.of(context).textTheme.titleSmall,
//     controller: textController,
//     decoration: InputDecoration(
//       errorStyle: const TextStyle(
//         color: Colors.red,
//         wordSpacing: 5.0,
//       ),
//       hintText: 'Palindrome',
//       hintStyle: Theme.of(context).textTheme.titleSmall,
//     ),
//   );
// }
