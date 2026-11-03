import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../theme/app_colors.dart';

class HomePage extends StatelessWidget {
  final UserData userData;

  final products = [
    {
      'name': 'Green Dress',
      'price': 45,
<<<<<<< HEAD
      'image': 'images/dress.webp',
=======
      'image': 'assets/images/dress.webp',
>>>>>>> Test_branch
    },
    {
      'name': 'Casual Sneakers',
      'price': 35,
<<<<<<< HEAD
      'image': 'images/sneakers.webp',
=======
      'image': 'assets/images/sneakers.webp',
>>>>>>> Test_branch
    },
  ];

   HomePage({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListenableBuilder(
                        listenable: userData,
                        builder: (context, child) {
                          return Text(
                            'Welcome ${userData.name}',
                            style: Theme.of(context).textTheme.headlineLarge,
                          );
                        },
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'What are you looking for today?',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Search products',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  'Explore Categories',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 16),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns =
                    constraints.maxWidth < 600 ? 2 : 4;

                    return GridView.count(
                      crossAxisCount: columns,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.2,
                      children: const [
                        CategoryTile(
                          icon: Icons.checkroom,
                          title: 'Clothes',
                        ),
                        CategoryTile(
                          icon: Icons.shopping_bag_outlined,
                          title: 'Bags',
                        ),
                        CategoryTile(
                          icon: Icons.directions_walk,
                          title: 'Shoes',
                        ),
                        CategoryTile(
                          icon: Icons.watch_outlined,
                          title: 'Accessories',
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Products',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {  },
                      child: Text("View ALL",),)
                  ],
                ),
                SizedBox(height: 16),

                LayoutBuilder(
                  builder: (context,constraints) {
                    final columns= constraints.maxWidth<600 ?2:4;
                    return GridView.builder(
                      itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85
                        ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                        itemBuilder: (context, index) {
                        final product=products[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                    child: Image.asset(
                                          product['image'] as String,
                                      fit: BoxFit.fill,
                                      width: double.infinity,),
                                  ),
                                ),

<<<<<<< HEAD
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                      product['name'] as String,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "\$${product['price']}",
                                        style: TextStyle(color: AppColors.textSecondary)
                                      ),
                                    ],
                                  )
                                    ],
                                  ),
=======
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            product['name'] as String,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '\$${product['price']}',
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                  ],
>>>>>>> Test_branch
                                ),

                              ],
                            ),
                          );
                        },
                    );
                  }
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: AppColors.primary,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}