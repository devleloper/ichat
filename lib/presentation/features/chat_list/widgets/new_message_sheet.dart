import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../domain/entities/user/user.dart';
import '../../../widgets/user_tile.dart';
import '../bloc/chat_list_bloc.dart';
import '../bloc/chat_list_event.dart';

class NewMessageSheet extends StatelessWidget {
  final List<User> otherUsers;

  const NewMessageSheet({super.key, required this.otherUsers});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              AppStrings.newMessage,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: otherUsers.length,
              itemBuilder: (_, index) {
                final user = otherUsers[index];
                return UserTile(
                  title: user.name,
                  onTap: () {
                    Navigator.pop(context);
                    context.read<ChatListBloc>().add(
                      ChatListEvent.createRoom(user.id),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
