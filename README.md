# ATTENDANCE APP

## User Story

1. User can setting master location for company with tapped position on map.
2. User can check-in & check-out only one time
2. User can check-in & check-out only on today
3. User can check-in & check-out less than 50m from master location setting
3. User can look history attendance

<br/>

## Screen

Setting Master Location | User check in failed | User check in success
------------------------|----------------------|-------------------------
![Setting Master GIF](https://github.com/ghonijee/flutter-attendance-app-riverpod/blob/master/gif/setting_master_location.gif) | ![Failed GIF](https://github.com/ghonijee/flutter-attendance-app-riverpod/blob/master/gif/CheckIn-failed.gif) | ![Success GIF](https://github.com/ghonijee/flutter-attendance-app-riverpod/blob/master/gif/success.gif)

<br/>

## Tech Stack

* Manage flutter version 3.3.1 using [FVM](https://fvm.app)
* State Management Using [Riverpod](https://riverpod.dev)
* Maps view using [Flutter_map](https://docs.fleaflet.dev)
* Union-Type and model builder using [Freezed](https://pub.dev/packages/freezed)
* Local database using [Isar DB](https://isar.dev)
* Local storage key-value using [GetStorage](https://pub.dev/packages/get_storage)
* Calendar view using Table [Calendar](https://pub.dev/packages/table_calendar)
* Device location using [Geolocator](https://pub.dev/packages/geolocator)
* Convert position to address using [Geocoding](https://pub.dev/packages/geocoding)

<br/>

## How Run
1. Clone project from repository
    ```bash
    git clone git@github.com:ghonijee/flutter-attendance-app-riverpod.git
    ```
2. Install dependencies
    ```bash
    flutter pub get 
    ```
3. Running test
    ```bash
    flutter test
    ```
4. Running on emulator
    ```bash
    flutter run
    ```
</br>

## Author

This app develop by [Ahmad Yunus Afghoni](github.com/ghonijee)

[Twitter](https://twitter.com/ghonijee)
[LinkedIn](https://www.linkedin.com/in/yunus-afghoni/)
