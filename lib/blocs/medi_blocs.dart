import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mediboard/medication/bloc/medication_bloc.dart";
import "package:mediboard/medication/repository/medication_repository.dart";
import "package:mediboard/user/repository/user_repository.dart";

class MediBlocs extends StatelessWidget {
  const MediBlocs({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider<MedicationRepository>(
          create: (context) {
            return MedicationRepository(
              userRepository: context.read<UserRepository>(),
            );
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MedicationBloc>(
            create: (context) {
              return MedicationBloc(
                medicationRepository: context.read<MedicationRepository>(),
              )..add(const MedicationEvent.medicationsReceived());
            },
          ),
        ],
        child: child,
      ),
    );
  }
}
