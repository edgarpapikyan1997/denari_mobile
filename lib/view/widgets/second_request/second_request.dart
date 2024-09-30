// import 'dart:async';
//
// Future<void> _tryFetchingDataWithTimeout(Function function) async {
//   try {
//     await Future.any([
//       function.call(),
//       Future.delayed(const Duration(seconds: 3)).then((_) {
//         throw TimeoutException('Data fetching timed out');
//       }),
//     ]);
//   } catch (e) {
//     if (e is TimeoutException) {
//       await _retryFetchingData(function);
//     } else {
//       rethrow;
//     }
//   }
// }
//
//
// Future<void> _retryFetchingData(Function function) async {
//   try {
//     await function.call();
//   } catch (e) {
//     throw Exception('Failed after retry');
//   }
// }