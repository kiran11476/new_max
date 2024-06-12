import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_max/controller/controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];
  bool isLoading = false; // Flag for loading indicator

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
    });
    try {
      final data = await ApiService().getUsers();
      print(data);
      setState(() {
        users = data;
        isLoading = false;
      });
    } catch (error) {
      print(error); // Handle error appropriately (e.g., show error message)
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Call fetchUsers on initial load
  }

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
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: users.length,
              itemBuilder: (BuildContext context, index) {
                final user = users[index];
                return Card(
                  color: Colors.yellow,
                  child: Center(child: Text(user['name'])),
                );
              }),
        ));
  }
}
