import 'package:flutter/material.dart';
import 'package:hello_world/utils/app_colors.dart';
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
    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/categories.php',
    );
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
            'like': '0',
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

  Widget buildIconRow() {
    final icons = [
      {'icon': Icons.fastfood_rounded, 'label': 'Fast Food'},
      {'icon': Icons.cake, 'label': 'Cake'},
      {'icon': Icons.cookie_sharp, 'label': 'Snacks'},
      {'icon': Icons.emoji_food_beverage_rounded, 'label': 'Drinks'},
      {'icon': Icons.local_pizza, 'label': 'Pizza'},
      {'icon': Icons.icecream, 'label': 'Ice Cream'},
      {'icon': Icons.lunch_dining_rounded, 'label': 'Burger'},
      {'icon': Icons.kebab_dining, 'label': 'BBQ'},
    ];

    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: icons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Icon(icons[index]['icon'] as IconData, size: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    icons[index]['label'] as String,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'data:image/jpeg;base64,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',
                  ),
                  radius: 24,
                ),
                Icon(Icons.menu, color: AppColors.black),
              ],
            ),
            Text(
              'Hello, Pino',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'What do you want to buy?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
            buildIconRow(),
            const SizedBox(height: 16),

            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: foodList.length,
                      itemBuilder: (context, index) {
                        final food = foodList[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    food['thumb']!,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        food['name']!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        food['desc']!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(),
                                            child: const Text('Add to cart'),
                                          ),
                                          const Text('\$100'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                IconButton(
                                  icon: Icon(
                                    food['like'] == '1'
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: food['like'] == '1'
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      food['like'] = (food['like'] == '1')
                                          ? '0'
                                          : '1';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
