import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:navigation_practice/theme/app_colors.dart';

class MainScreen extends StatefulWidget{
  final StatefulNavigationShell navigationShell;
  const MainScreen(
      {super.key,required this.navigationShell,required this.userData
  });

  final UserData userData;
  @override
  State<MainScreen> createState() =>_StateMain();
}

class _StateMain extends State<MainScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'gleam',
          style: GoogleFonts.caprasimo(
            fontSize: 30,
            color: AppColors.primary,
          ),
        ),
        actions: [

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined),
              ),


        ],

      ),
      body: widget.navigationShell,
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex ,
          onTap: (index){
            widget.navigationShell.goBranch(index);
          },
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Home",

          ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Products",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: "Profile",
            ),
        ]

    ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: ListenableBuilder(
                listenable: widget.userData,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: widget.userData.profileImageBytes != null
                            ? MemoryImage(widget.userData.profileImageBytes!)
                            : null,
                        child: widget.userData.profileImageBytes == null
                            ? const Icon(Icons.person)
                            : null,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.userData.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.userData.email,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  );
                },
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home_filled),
              onTap: (){
                Navigator.pop(context);
                context.go('/home');
              },
            ),
            ListTile(
              title: Text('Products'),
              leading: Icon(Icons.shopping_bag),
              onTap: (){
                Navigator.pop(context);
                context.go('/product');
              },
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              onTap: (){
                Navigator.pop(context);
                context.go('/profile');
              },
            )
          ],
        ),
      ),
    );
  }
}