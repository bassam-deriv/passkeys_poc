
import 'package:passkeys/relying_party_server/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';
import 'package:passkeys/relying_party_server/types/authentication.dart';
import 'package:passkeys/relying_party_server/types/registration.dart';
import 'package:passkeys_poc/features/authentication/data/data_sources/base_auth_data_source.dart';

class SharedRelyingPartyServer
    implements 
        RelyingPartyServer<RpRequest, RpResponse>{
  SharedRelyingPartyServer()
      : _auth = CorbadoPasskeyBackend('pro-7837426045311437779');

  final CorbadoPasskeyBackend _auth;



  @override
  Future<AuthenticationInitResponse> initAuthenticate(RpRequest request) {
      return _auth.initAuthenticate(AuthRequest(request.email));
  }

  @override
  Future<RegistrationInitResponse> initRegister(RpRequest request) {
    return _auth.initRegister(AuthRequest(request.email));
  }

    @override
  Future<RpResponse> completeAuthenticate(
      AuthenticationCompleteRequest request,) async {
    try {
      await _auth.completeAuthenticate(request);
      return const RpResponse(success: true);
    } catch (e) {
      return const RpResponse(success: false);
    }
  }

  @override
  Future<RpResponse> completeRegister(
      RegistrationCompleteRequest request) async {
    try {
      await _auth.completeRegister(request);
      return const RpResponse(success: true);
    } catch (e) {
      return const RpResponse(success: false);
    }
  }

  @override
  Future<RpResponse> login({required RpRequest data}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<RpResponse> signup({required RpRequest data}) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}

class RpRequest {
  const RpRequest({required this.email});

  final String email;
}

class RpResponse {
  const RpResponse({required this.success});

  final bool success;
}