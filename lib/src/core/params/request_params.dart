import 'package:equatable/equatable.dart';

class RegisterDriverRequestParams extends Equatable {
  final String imageUrl;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;

  const RegisterDriverRequestParams({
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [imageUrl, firstName, lastName, phoneNumber, email, password];
}
