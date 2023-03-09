part of 'failure.dart';

abstract class FetchFailure extends Failure {
  const FetchFailure();

  TResult fold<TResult>({
    required TResult Function(LocalFetchFailure failure) local,
    required TResult Function(RemoteFetchFailure failre) remote,
  });
}

abstract class LocalFetchFailure extends FetchFailure {
  const LocalFetchFailure();

  const factory LocalFetchFailure.unknown({
    FailureInformation? info,
  }) = UnknownLocalFetchFailure;

  const factory LocalFetchFailure.notFound() = NotFoundLocalFetchFailure;

  TResult when<TResult>({
    required TResult Function(FailureInformation? info) unknown,
    required TResult Function() notFound,
  });

  @override
  TResult fold<TResult>({
    required TResult Function(LocalFetchFailure failure) local,
    required TResult Function(RemoteFetchFailure failure) remote,
  }) {
    return local(this);
  }
}

class UnknownLocalFetchFailure extends LocalFetchFailure {
  const UnknownLocalFetchFailure({
    FailureInformation? info,
  }) : _info = info;

  final FailureInformation? _info;

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation? info) unknown,
    required TResult Function() notFound,
  }) {
    return unknown(_info);
  }
}

class NotFoundLocalFetchFailure extends LocalFetchFailure {
  const NotFoundLocalFetchFailure();

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation info) unknown,
    required TResult Function() notFound,
  }) {
    return notFound();
  }
}

abstract class RemoteFetchFailure extends FetchFailure {
  const RemoteFetchFailure();

  const factory RemoteFetchFailure.unknown({
    required FailureInformation info,
  }) = UnknownRemoteFetchFailure;

  const factory RemoteFetchFailure.notFound() = NotFoundRemoteFetchFailure;

  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
  });

  @override
  TResult fold<TResult>({
    required TResult Function(LocalFetchFailure failure) local,
    required TResult Function(RemoteFetchFailure failre) remote,
  }) {
    return remote(this);
  }
}

class UnknownRemoteFetchFailure extends RemoteFetchFailure {
  const UnknownRemoteFetchFailure({
    required FailureInformation info,
  }) : _info = info;

  final FailureInformation _info;

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
  }) {
    return unknown(_info);
  }
}

class NotFoundRemoteFetchFailure extends RemoteFetchFailure {
  const NotFoundRemoteFetchFailure();

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
  }) {
    return notFound();
  }
}

class TimeoutRemoteFetchFailure extends RemoteFetchFailure {
  const TimeoutRemoteFetchFailure();

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
  }) {
    return timeout();
  }
}

class NoInternetRemoteFetchFailure extends RemoteFetchFailure {
  const NoInternetRemoteFetchFailure();

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
  }) {
    return noInternet();
  }
}
