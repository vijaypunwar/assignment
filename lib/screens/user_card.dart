import 'package:flutter/material.dart';
class UserCard extends StatelessWidget {
  final dynamic user;

  UserCard({super.key, required this.user});
  double size=16.0;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user['picture']['medium']),
                  radius: 25,
                ),
                Column(
                  children: [
                    Text(
                      '${user['name']['first']} - ${user['dob']['age']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '   3 km from you',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chat, color: Colors.blue),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone, color: Colors.green),
                      onPressed: () {},
                    ),
                  ],
                ),


              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.date_range, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          'Date:',
                          style:  TextStyle(fontSize: size),
                        ),
                      ],
                    ),
                    Text(
                      '${user['dob']['date'].substring(0, 10)}',
                      style:   TextStyle(fontSize: size),
                    ),
                  ],
                ),
                VerticalDivider(
                  width: 10,
                  color: Colors.black,
                  thickness: 1,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Text(
                            'Location:',
                            style:   TextStyle(fontSize: size)),
                      ],
                    ),
                    Text(
                      '${user['location']['city']}, ${user['location']['country']}',
                      style:   TextStyle(fontSize: size),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
