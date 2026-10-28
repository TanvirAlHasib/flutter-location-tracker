# 📍 Flutter Real-Time Location Tracker

A Flutter application that integrates **Google Maps** and **Geolocator** to track the user's current location, automatically animate the map camera, update location markers, and visualize movement using polylines.

The application retrieves the user's location every **10 seconds** and dynamically updates the map to reflect their movement.

## 🚀 Features

### 🗺️ 1. Automatic Map Animation
- Displays an interactive Google Map.
- Automatically detects the user's current location.
- Smoothly animates the camera to the user's location.
- Keeps the map focused on the updated location.

### 📍 2. Real-Time Location Updates
- Uses the Geolocator package to retrieve GPS coordinates.
- Fetches the user's latest location every 10 seconds.
- Dynamically updates the marker's position.
- Displays the user's current latitude and longitude.

### 🛣️ 3. Polyline Tracking
- Tracks the user's movement between consecutive locations.
- Draws a polyline connecting previous and current coordinates.
- Continuously extends the polyline as new locations are recorded.
- Provides a visual representation of the user's movement history.

### ℹ️ 4. Interactive Marker Info Window
- Displays a marker at the user's current location.
- Allows users to tap the marker to view location information.
- Shows the following details:

**Title:** My current location

**Snippet:** Latitude: 23.8103, Longitude: 90.4125

*Note: Coordinates shown above are examples. Actual values are retrieved dynamically from the device.*

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Cross-platform application development |
| Dart | Programming language |
| Google Maps Flutter | Interactive maps and camera animation |
| Geolocator | GPS location tracking |
| Google Maps Polylines | Visualizing movement history |
| Dart Timer | Periodic location updates |

---

## 📦 Dependencies

The application uses the following Flutter packages:

```yaml
dependencies:
  flutter:
    sdk: flutter

  google_maps_flutter: ^2.14.0
  geolocator: ^14.0.2
```

Alternatively, install the latest compatible versions using:

```bash
flutter pub add google_maps_flutter geolocator
```

---

## ⚙️ Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/TanvirAlHasib/flutter-location-tracker.git
```

Navigate to the project directory:

```bash
cd flutter-location-tracker
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Google Maps API

1. Open Google Cloud Console.
2. Create a new project or select an existing one.
3. Enable **Maps SDK for Android**.
4. Create a Google Maps API key.
5. Configure the API key in your Flutter project.

For Android, open:

`android/app/src/main/AndroidManifest.xml`

Inside the `<application>` tag, add:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
```

Replace `YOUR_GOOGLE_MAPS_API_KEY` with your actual API key.

**Important:** Enable billing for your Google Cloud project and restrict your API key appropriately. Avoid committing sensitive configuration to public repositories.

### 4. Configure Location Permissions

For Android, add the following permissions to `AndroidManifest.xml`, outside the `<application>` tag:

```xml
<uses-permission
    android:name="android.permission.ACCESS_FINE_LOCATION"/>

<uses-permission
    android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

For iOS, add the following key to `ios/Runner/Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>
This app requires location access to track your current position on the map.
</string>
```

The application must also request location permission at runtime.

### 5. Run the Application

Connect an Android device or start an emulator.

```bash
flutter run
```

Ensure that location services are enabled on your device.

---

## 🔄 How It Works

### Step 1: Initialize Google Maps

When the application launches, it displays a Google Map and initializes the map controller.

### Step 2: Request Location Permission

The application checks whether location services are enabled and requests the necessary location permissions.

### Step 3: Retrieve Current Location

Geolocator retrieves the device's current GPS coordinates.

### Step 4: Animate Map Camera

The Google Maps controller smoothly animates the camera to the user's current location.

### Step 5: Update Location Every 10 Seconds

A periodic timer triggers a location request every 10 seconds while tracking is active.

Each successful location update:

- Retrieves the latest latitude and longitude.
- Updates the marker's position.
- Animates the camera to the new location.
- Adds the new coordinate to the tracking history.
- Updates the polyline displayed on the map.

### Step 6: Display Marker Information

Tapping the current location marker opens an info window displaying:

- **Title:** My current location
- **Latitude:** Current latitude
- **Longitude:** Current longitude

---

## 📱 Application Workflow

```text
          Application Launch
                  |
                  v
          Initialize Google Map
                  |
                  v
        Check Location Permission
                  |
                  v
         Get Current Location
                  |
                  v
         Animate Map Camera
                  |
                  v
       Display Current Location
                  |
                  v
       Start 10-Second Timer
                  |
                  v
         Fetch Latest Location
                  |
                  v
          Update Map Marker
                  |
                  v
       Add Coordinate to Polyline
                  |
                  v
          Animate Map Camera
                  |
                  v
        Wait for Next Update
                  |
                  v
         Repeat While Active
```

---

## 🎯 Assignment Requirements

| Requirement | Implementation |
|-------------|----------------|
| Display Google Map | Google Maps Flutter |
| Animate to current location | GoogleMapController.animateCamera() |
| Fetch location every 10 seconds | Timer.periodic() + Geolocator |
| Update marker dynamically | Google Maps Marker |
| Track movement with polylines | Google Maps Polyline |
| Display marker information | InfoWindow |
| Show latitude and longitude | Geolocator Position |

---

## 🔐 Permissions & Privacy

The application requires location access to provide real-time tracking functionality.

- Location access is requested at runtime.
- GPS coordinates are used to update the map.
- Location tracking operates while the application is active.
- Location coordinates are maintained locally for polyline visualization.
- Background location tracking is not included in this assignment.

---

## 🚧 Possible Future Improvements

- Start and stop tracking controls.
- Display total distance traveled.
- Show current movement speed.
- Save location history locally.
- Restore previous tracking sessions.
- Add background location tracking.
- Export tracked routes.
- Implement different map styles.

---

## 👨‍💻 Author

**Tanvir Al Hasib**

Flutter Developer | Mobile Application Developer

---

## 📄 License

This project is developed for educational purposes as part of a Flutter assignment focused on Google Maps integration and real-time location tracking.