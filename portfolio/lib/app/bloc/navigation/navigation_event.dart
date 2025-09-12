import 'package:equatable/equatable.dart';

enum NavigationItem { home, resume, portfolio, contact }

abstract class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigationItemSelected extends NavigationEvent {
  final int selectedItem;

  NavigationItemSelected(this.selectedItem);

  @override
  List<Object?> get props => [selectedItem];
}
