# iOS Native Bridge

A minimal Flutter demo showcasing **native interoperability on iOS** using **Swift** and **C++**.

## 🎯 Technical Task Implementation

On button press:
1. **Dart**: Increment counter `N`
2. **Dart → Swift**: Invoke native code via `MethodChannel`
3. **Swift → C++**: Call a minimal C++ library
4. **C++**: Write `"hello world N"` to a text file (`/tmp/hello.txt`)
5. **C++**: Read the file and return its content
6. **Swift → Dart**: Send result back through the channel
7. **Dart**: Display file content in UI

✅ All requirements fulfilled:
> *"Flutter → Swift → C++ → File I/O → Flutter"*

## 🛠️ Tech Stack
- **Flutter** (Dart) — UI & app logic
- **Swift** — iOS native bridge
- **C++** — file I/O via standard library (`std::ofstream`, `std::ifstream`)
- **MethodChannel** — communication layer

## ▶️ How to Run
```bash
flutter pub get
flutter run