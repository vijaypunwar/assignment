import 'package:assignment/providers/user_provider.dart';
import 'package:assignment/screens/user_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dating List"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          // User List
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                    !userProvider.isLoading) {
                  userProvider.fetchUsers();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: userProvider.users.length + 1,
                itemBuilder: (context, index) {
                  if (index < userProvider.users.length) {
                    final user = userProvider.users[index];
                    return UserCard(user: user);
                  } else {
                    return userProvider.isLoading
                        ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                        : const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}