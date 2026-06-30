import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/bounce_button.dart';
import '../../../widgets/custom_text_field.dart';
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
      appBar: AppBar(
        title: const Text('Who are you?'),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            context.go('/chats');
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Create New User',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Enter your name...',
                    onSubmitted: _onCreateUser,
                    suffixIcon: BounceButton(
                      onPressed: _onCreateUser,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8, bottom: 6),
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
                  const SizedBox(height: 32),
                  const Text(
                    'Or Select Existing',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: switch (state) {
                      LoadingState() => const Center(child: CircularProgressIndicator()),
                      UsersLoadedState(users: final users) => users.isEmpty
                          ? const Center(child: Text('No users found. Create one above!'))
                          : ListView.separated(
                              itemCount: users.length,
                              separatorBuilder: (context, index) => const Divider(),
                              itemBuilder: (context, index) {
                                final user = users[index];
                                return BounceButton(
                                  onPressed: () {
                                    context.read<AuthBloc>().add(AuthEvent.selectUser(user));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: AppTheme.receiverGray,
                                      child: Text(
                                        user.name.substring(0, 1).toUpperCase(),
                                        style: const TextStyle(
                                          color: AppTheme.textDark,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      user.name,
                                      style: AppTheme.lightTheme.textTheme.bodyLarge,
                                    ),
                                  ),
                                );
                              },
                            ),
                      _ => const SizedBox.shrink(),
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
