# TRACTIAN Challenge Mobile

## 📌 About the Project
This is an application developed in Flutter. The project uses **Flutter 3.27.3** and follows a modular architecture, divided into two main modules:

- **Home**: Displays a list of available companies.
- **Assets**: Lists the assets of the selected company in a hierarchical structure.

The application is available for **iOS and Android** platforms.

## 🚀 Technologies Used
- **Flutter** 3.27.3
- **State and dependency management**: get
- **REST requests**: dio
- **Font styling**: google_fonts
- **Environment variables management**: flutter_dotenv
- **Native splash screen**: flutter_native_splash

## 📂 Project Structure
The project was developed using a modular architecture, where each module is responsible for a specific functionality:

```
/lib
│── app
|── |── modules
│   |   |── home
│   │   |   ├── controller
│   │   |   ├── page
│   │   |   ├── bindings
│   |   |── assets
│   │   |   ├── controllers
│   │   |   ├── page
│   │   |   ├── bindings
│── core
│── models
│── repositories
│── ui
│── main.dart
```

## 🎥 Demonstration
Below is a demonstration video of the application in action:

[[Application Demonstration]](https://drive.google.com/file/d/1vhz5aau-GSnauA-Ic91i_0bKlO3M81QV/view?usp=sharing)

## 🔧 Future Improvements
The application can be enhanced with the following improvements:

- 📌 **Create unit and widget tests** to ensure greater code reliability.
- 🌎 **Internationalization** to support multiple languages.
- 🔍 **Creation of new filters** to facilitate searching for different types of sensors.
- 💾 **Implementation of caching** to optimize relevant requests and improve performance.

---
If you have any questions or suggestions, feel free to reach out!

