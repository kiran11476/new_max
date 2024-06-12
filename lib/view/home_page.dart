import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_max/view/model.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(Icons.favorite),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.notification_add),
            SizedBox(
              width: 20,
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Image.network(
                'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/082017/untitled-1_132.png?itok=iKeHld34'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'What are you looking for?',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(height: 200.0),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration:
                                  const BoxDecoration(color: Colors.amber),
                              child: Image.network(
                                  'https://thumbs.dreamstime.com/b/handwriting-text-trial-offer-concept-meaning-temporary-free-discounted-product-services-conceptual-photo-177048225.jpg'));
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Basket',
          )
        ]));
  }
}
