# flutter_ios_native_bridge

📱 iOS Native Bridge (Flutter + Swift + C++)
A minimal iOS demo app built with Flutter that demonstrates seamless interop between Dart, Swift, and C++ via MethodChannel.

Workflow on button tap:

Increment counter N in Dart
Call native Swift code via MethodChannel
Swift invokes a C++ library
C++ writes "hello world N" to a text file
File content is read and returned to Flutter UI
✅ Full implementation of the technical task:
Flutter → Swift → C++ → File I/O → Flutter