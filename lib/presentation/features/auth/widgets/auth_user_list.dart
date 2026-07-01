import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/user_tile.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class AuthUserList extends StatelessWidget {
  final AuthState state;

  const AuthUserList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      AuthLoadingState() => const Center(child: CupertinoActivityIndicator()),
      AuthUsersLoadedState(users: final users) =>
        users.isEmpty
            ? Center(
                child: Text(
                  AppStrings.noUsersFound,
                  style: TextStyle(color: context.textSecondary),
                ),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Column(
                    children: [
                      UserTile(
                        title: user.name,
                        onTap: () => context.read<AuthBloc>().add(
                          AuthEvent.selectUser(user),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 84.0),
                        child: Divider(
                          height: 1,
                          color: context.separatorColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
      _ => const SizedBox.shrink(),
    };
  }
}
