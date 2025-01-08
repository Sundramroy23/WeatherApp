# Flutter Weather App

A simple Flutter application to display weather information with enhanced UI/UX features. The app fetches hourly weather data and showcases it in a user-friendly way using cards.

---

## Features

### 1. Dynamic Weather Cards

- Displays weather data for each hour.
- Includes details such as:
  - Weather icon.
  - Temperature (in Celsius).
  - Time.

### 2. Smooth Image Loading

- Uses `FadeInImage` to provide a seamless fade-in effect when weather icons are loaded.
- Placeholder feature to show a **loading spinner** while the image is being fetched.

### 3. Error Handling for Images

- If the weather icon fails to load, a fallback icon (`Icons.broken_image`) is displayed to indicate an issue.

### 4. Responsive Design

- Icons and text adapt well to different screen sizes.

### 5. Clean UI

- Modern card-based design for readability and aesthetics.

---

## Technologies Used

- **Flutter**: For building the app.
- **Dart**: Programming language for Flutter.
- **API Integration**: Fetches weather data dynamically.

---

## Setup and Installation

### Prerequisites

- Install [Flutter](https://flutter.dev/docs/get-started/install) and set up your development environment.
- Ensure you have an API key from a weather service provider (if required).

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/Sundramroy23/WeatherApp.git
   ```
2. Navigate to the project directory:
   ```bash
   cd flutter-weather-app
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## How It Works

- The app fetches hourly weather data from a weather API.
- For each hour, a card is generated showing the time, temperature, and weather condition icon.
- The image for each weather condition is loaded dynamically, with a loading spinner shown until it’s fully fetched.

---

## Future Enhancements

- Add daily weather summaries.
- Introduce dark mode.
- Enable location-based weather data fetching.
- Display additional weather details like humidity, wind speed, etc.

---

## Contributing

Contributions are welcome! Follow these steps to contribute:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add some feature"
   ```
4. Push the branch:
   ```bash
   git push origin feature-name
   ```
5. Create a pull request.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Contact

For questions or suggestions, feel free to reach out:

- **Email**: [sundramroy2412@gmail.com](mailto\:sundramroy2412@gmail.com)

---

Enjoy exploring the weather with the Flutter Weather App!

give me in the raw format

