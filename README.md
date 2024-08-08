# todoapp


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## flutter_assignment

### Cloning the Repository

1. Clone the repository:
   ```bash
   git clone <repository-url>


Replace <repository-url> with the URL of your repository.

Navigate to the project directory:

bash
Copy code
cd todoapp
Download and install the required Flutter packages:

bash
Copy code
flutter pub get
Running the App
Start an emulator or connect a device.

Run the app in profile mode:

bash
Copy code
flutter run --profile
Running Integration Testing
Run the performance integration test:

bash
Copy code
flutter drive \
  --driver=test_driver/perf_driver.dart \
  --target=integration_test/performance_test.dart \
  --profile \
  --write-sksl-on-exit=integration_test/results/performance_summary.sksl.json \
  --cache-sksl
To get the performance timeline, run the following command:

bash
Copy code
flutter drive -t lib/main.dart --driver test_driver/main_test.dart --profile
The performance results will be saved in the build folder as ui_timeline.timeline.json. Open this file using Chrome Tracing to view the app performance report.