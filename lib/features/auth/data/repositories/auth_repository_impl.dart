import 'package:blog_app/core/entities/user.dart';
import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  //final ConnectionChecker connectionChecker;
  const AuthRepositoryImpl(
    this.remoteDataSource,
    // this.connectionChecker,
  );

  // @override
  // Future<Either<Failure, User>> currentUser() async {
  // try {
  //   if (!await (connectionChecker.isConnected)) {
  //     final session = remoteDataSource.currentUserSession;

  //     if (session == null) {
  //       return left(Failure('User not logged in!'));
  //     }

  //     return right(
  //       UserModel(
  //         id: session.user.id,
  //         email: session.user.email ?? '',
  //         name: '',
  //       ),
  //     );
  //   }
  //   final user = await remoteDataSource.getCurrentUserData();
  //   if (user == null) {
  //     return left(Failure('User not logged in!'));
  //   }

  //   return right(user);
  // } on ServerException catch (e) {
  //   return left(Failure(e.message));
  // }
  //}

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  //}) async {
  // return _getUser(
  //   () async => await remoteDataSource.loginWithEmailPassword(
  //     email: email,
  //     password: password,
  //   ),
  // );
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    // return _getUser(
    //   () async => await remoteDataSource.signUpWithEmailPassword(
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  // Future<Either<Failure, User>> _getUser(
  //   Future<User> Function() fn,
  // ) async {
  //   try {
  //     if (!await (connectionChecker.isConnected)) {
  //       return left(Failure(Constants.noConnectionErrorMessage));
  //     }
  //     final user = await fn();

  //     return right(user);
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message));
  //   }
  // }
}
