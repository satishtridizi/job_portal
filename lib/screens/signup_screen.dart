import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/common_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _agreeTerms = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onCreateAccount() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirm = _confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirm.isEmpty) {
      _showSnack('Please fill in all fields.', Colors.redAccent);
      return;
    }
    if (password.length < 8) {
      _showSnack('Password must be at least 8 characters.', Colors.redAccent);
      return;
    }
    if (password != confirm) {
      _showSnack('Passwords do not match.', Colors.redAccent);
      return;
    }
    if (!_agreedToTerms) {
      _showSnack('Please agree to the Terms of Service.', Colors.orangeAccent);
      return;
    }

    // TODO: Hook up real registration
    _showSnack('Creating your account...', AppColors.primary);
  }

  void _showSnack(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  void _onTermsOfService() {
    _showSnack('Opening Terms of Service...', AppColors.cardBackground);
  }

  void _onPrivacyPolicy() {
    _showSnack('Opening Privacy Policy...', AppColors.cardBackground);
  }

  void _onSignIn() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 36),

              // ── Logo ──
              const HireHubLogo(subtitle: 'Start hiring top talent today'),

              const SizedBox(height: 32),

              // ── Card ──
              HireHubCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Create Account',
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AIBadge(),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Full Name
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    HireHubInputField(
                      hintText: 'John Doe',
                      leadingIcon: Icons.person_outline_rounded,
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                    ),

                    const SizedBox(height: 16),

                    // Email
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    HireHubInputField(
                      hintText: 'you@company.com',
                      leadingIcon: Icons.email_outlined,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 16),

                    // Password
                    const Text(
                      'Password',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    HireHubInputField(
                      hintText: 'Create a password',
                      leadingIcon: Icons.lock_outline_rounded,
                      obscureText: _obscurePassword,
                      controller: _passwordController,
                      helperText: 'Must be at least 8 characters',
                      suffixWidget: GestureDetector(
                        onTap: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Confirm Password
                    const Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    HireHubInputField(
                      hintText: 'Confirm your password',
                      leadingIcon: Icons.lock_outline_rounded,
                      obscureText: _obscureConfirm,
                      controller: _confirmPasswordController,
                      suffixWidget: GestureDetector(
                        onTap: () =>
                            setState(() => _obscureConfirm = !_obscureConfirm),
                        child: Icon(
                          _obscureConfirm
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Terms checkbox
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: _agreeTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreeTerms = value ?? false;
                              });
                            },
                            activeColor: AppColors.primary,
                            checkColor: Colors.black,
                            side: BorderSide(
                              color: AppColors.primary.withOpacity(.7),
                              width: 1.5,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 13,
                              ),
                              children: [
                                const TextSpan(text: 'I agree to the '),
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: _onTermsOfService,
                                    child: const Text(
                                      'Terms of Service',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const TextSpan(text: ' and '),
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: _onPrivacyPolicy,
                                    child: const Text(
                                      'Privacy Policy',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // Create Account button
                    HireHubButton(
                      label: 'Create Account',
                      prefixIcon: Icons.auto_awesome,
                      onTap: _agreeTerms
                          ? _onCreateAccount
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please accept Terms of Service and Privacy Policy',
                                  ),
                                ),
                              );
                            },
                    ),
                    const SizedBox(height: 20),

                    // Sign In link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: _onSignIn,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.shield_outlined,
                    color: AppColors.textGrey,
                    size: 13,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Protected by AI-powered security',
                    style: TextStyle(color: AppColors.textGrey, fontSize: 11),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
