import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final int selectedItem;

  const NavigationState({required this.selectedItem});

  NavigationState copyWith({int? selectedItem}) {
    return NavigationState(selectedItem: selectedItem ?? this.selectedItem);
  }

  @override
  List<Object?> get props => [selectedItem];
}
