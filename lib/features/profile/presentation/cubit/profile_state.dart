part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final String? name;
  final String? email;
  final String? phone;
  final String? mobile;
  final String? source;
  final String? username;
  final String? image;
  final File? imageUi;
  final List<UserData>? requestResponse;
  final RequestState? requestState;
  final String? responseMessage;

  const ProfileState({
    this.name,
    this.email,
    this.phone,
    this.mobile,
    this.source,
    this.username,
    this.image,
    this.imageUi,
    this.requestResponse = const [],
    this.requestState = RequestState.loading,
    this.responseMessage = '',
  });

  ProfileState copyWith({
    String? name,
    String? email,
    String? phone,
    String? mobile,
    String? source,
    String? username,
    String? image,
    File? imageUi,
    List<UserData>? requestResponse,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      mobile: mobile ?? this.mobile,
      source: source ?? this.source,
      username: username ?? this.username,
      image: image ?? this.image,
      imageUi: imageUi ?? this.imageUi,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        mobile,
        source,
        username,
        image,
        imageUi,
      ];
}
