part of 'joy_stick_cubit.dart';

@immutable
abstract class JoyStickState {}

class JoyStickInitial extends JoyStickState {}


class ChangeSegment extends JoyStickState {}
class RemoveWord extends JoyStickState {}
class PanEnd extends JoyStickState {}
