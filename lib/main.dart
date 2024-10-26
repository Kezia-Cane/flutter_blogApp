import 'package:blog_app/core/secrets/app_screts.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/data/auth_data_source.dart';
import 'package:blog_app/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/domain/usercases/user_sign_up.dart';
import 'package:blog_app/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppScrets.supaBaseUrl,
    anonKey: AppScrets.supaBaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignup: UserSignUp(
            AuthRepositoryImpl(
              AuthDataSourceImpl(supabase.client),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
