import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/app/router.dart';
import 'package:move_app/core/utils/colors.dart';
import 'package:move_app/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:move_app/logic/cubits/auth_cubit/auth_state.dart';
import 'package:move_app/navigation_menu.dart';
import 'package:move_app/presentation/screens/auth/register.dart';
import 'package:move_app/widgets/custom_auth_widgets.dart';
// Make sure this is imported

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: LoginViewBody(),
      ),
    );
  }
}

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Successful!"),
              backgroundColor: Colors.green,
            ),
          );
          // TODO: Navigate to your home screen
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
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
                  color: AppColors.white.withOpacity(0.7),
                ),
                onPressed: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomPrimaryButton(
                  text: 'Login',
                  onPressed: () {
                    context.read<AuthCubit>().login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationMenu()));
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('OR', style: TextStyle(color: AppColors.white)),
                ),
                Expanded(child: Divider(color: AppColors.white)),
              ],
            ),
            const SizedBox(height: 24),
            CustomSocialButton(
              onPressed: () => context.read<AuthCubit>().signInWithGoogle(),
              iconPath: 'assets/images/OIP.webp', // Your asset path
              text: 'Sign in with Google',
            ),
            // TODO: Add navigation to Sign Up screen
            const SizedBox(height: 24),
            // Button to navigate back to Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppColors.white),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView())),
                  child: const Text(
                    "Register",
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
