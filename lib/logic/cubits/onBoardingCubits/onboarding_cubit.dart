import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(currentPage: 0));

  void setPage(int index) => emit(OnboardingState(currentPage: index));

  void nextPage() {
    final next = state.currentPage + 1;
    emit(OnboardingState(currentPage: next));
  }
}
