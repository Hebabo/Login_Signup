// home_screen.dart
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> foodList = [];
  bool isLoading = true;

  Future<void> fetchFood() async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final List categories = jsonBody['categories'];
      setState(() {
        foodList = categories.map<Map<String, String>>((cat) {
          return {
            'name': cat['strCategory'],
            'thumb': cat['strCategoryThumb'],
            'desc': cat['strCategoryDescription'],
          };
        }).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load food');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Categories')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                final food = foodList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        food['thumb']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      food['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      food['desc']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
