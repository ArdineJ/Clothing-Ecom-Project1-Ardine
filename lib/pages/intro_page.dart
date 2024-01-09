import 'package:clothing/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(25.0),
              child: 
              Image.asset(
                'lib/images/logo3.png',
                ),
              ),
          
              const SizedBox(height: 24),
            
              const Text(
                'Just Wear It',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:20,
                ),
                textAlign: TextAlign.center,
              ),
          
              const SizedBox(height: 24),
          
              const Text(
                  'Brand new clothes and custom made with hype quality',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              GestureDetector(
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => HomePage()
                    )
                  ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        ),
                    ) 
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}