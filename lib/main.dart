import 'package:bloc_api/bloc/user_bloc.dart';
import 'package:bloc_api/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocRequests());
}

class BlocRequests extends StatelessWidget {
  const BlocRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserBloc(UserRepository());
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          print(state);
          if (state is UserInitial) {
            context.read<UserBloc>().add(const LoadUser(2));
          }
          return MaterialApp(
            home: Scaffold(
                body: (state is UserLoaded)
                    ? Center(
                        child: SafeArea(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Image.network((state.user?.avatar == null)
                                  ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                                  : state.user!.avatar!),
                              Text("${state.user?.email}"),
                              Text("${state.user?.first_name}"),
                              Text("${state.user?.last_name}"),
                            ],
                          ),
                        ),
                      )
                    : (state is UserInitial)
                        ? const Center(
                            child: Text("Loading..."),
                          )
                        : Center(
                            child: Text((state as UserError).message),
                          )),
          );
        },
      ),
    );
  }
}
