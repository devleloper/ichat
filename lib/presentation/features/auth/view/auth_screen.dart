import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/bounce_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/user_tile.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.loadUsers());
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onCreateUser() {
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      context.read<AuthBloc>().add(AuthEvent.createUser(name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            context.go('/chats');
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                  child: Text(
                    'Создать пользователя',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    controller: _nameController,
                    hintText: 'Введите ваше имя...',
                    onSubmitted: _onCreateUser,
                    suffixIcon: BounceButton(
                      onPressed: _onCreateUser,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppTheme.iMessageBlue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Выбрать',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: switch (state) {
                    LoadingState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    UsersLoadedState(users: final users) =>
                      users.isEmpty
                          ? const Center(
                              child: Text(
                                'Пользователи не найдены. Создайте выше!',
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
                                      onTap: () {
                                        context.read<AuthBloc>().add(
                                          AuthEvent.selectUser(user),
                                        );
                                      },
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 84.0),
                                      child: Divider(
                                        height: 1,
                                        color: Color(0xFFE5E5EA),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                    _ => const SizedBox.shrink(),
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
