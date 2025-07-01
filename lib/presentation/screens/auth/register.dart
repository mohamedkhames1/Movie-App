import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/core/utils/colors.dart';
import 'package:move_app/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:move_app/logic/cubits/auth_cubit/auth_state.dart';
import 'package:move_app/presentation/screens/auth/login.dart';
import 'package:move_app/widgets/custom_auth_widgets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: SignUpViewBody(),
      ),
    );
  }
}

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (!mounted) return;

        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Account Created!"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginView()),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),

            CustomTextFormField(
              controller: _nameController,
              labelText: 'Full Name',
            ),
            const SizedBox(height: 24),

            CustomTextFormField(
              controller: _emailController,
              labelText: 'Email Address',
            ),
            const SizedBox(height: 24),

            CustomTextFormField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: !_isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.white,
                ),
                onPressed: () {
                  setState(() => _isPasswordVisible = !_isPasswordVisible);
                },
              ),
            ),
            const SizedBox(height: 32),

            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return CustomPrimaryButton(
                  text: 'Sign Up',
                  onPressed: () {
                    context.read<AuthCubit>().signUp(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                  },
                );
              },
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                const Expanded(child: Divider(color: AppColors.white)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('OR', style: TextStyle(color: AppColors.white)),
                ),
                const Expanded(child: Divider(color: AppColors.white)),
              ],
            ),
            const SizedBox(height: 24),

            CustomSocialButton(
              onPressed: () {
                context.read<AuthCubit>().signInWithGoogle();
              },
              iconPath: 'assets/images/OIP.webp',
              text: 'Sign up with Google',
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ", style: TextStyle(color: AppColors.white)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginView()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
