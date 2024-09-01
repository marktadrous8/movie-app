# Movie List App - Flutter Developer Assessment

![Flutter](https://img.shields.io/badge/Flutter-Framework-blue.svg)
![Dart](https://img.shields.io/badge/Dart-Language-blue.svg)

## Project Overview

This project was developed as part of a Flutter Developer assessment for MetaCodya. The goal of this project is to demonstrate proficiency in the following key areas:

- Clean Architecture
- SOLID Principles
- Dependency Injection
- Bloc State Management
- Responsive Design

The application fetches movie data from The Movie Database (TMDb) API and displays it in a responsive UI, allowing users to search for and view details about specific movies.

## Features

- **Responsive UI**: The app features a responsive layout with two main screens: List and Details.
- **Search Functionality**: A search bar on the List screen allows users to search for movies by title.
- **Detailed Movie View**: The Details screen displays detailed information about a selected movie, including its image.
- **State Management**: The app uses the Bloc pattern for managing application state.
- **Animations**: The app includes animations to enhance the user experience.
- **Dependency Injection**: `get_it` and `injectable` are used for dependency injection.
- **Networking**: `dio` and `retrofit` are used for making API calls to fetch movie data.

## App preview
![ScreenRecording2024-09-01at6 28 10PM-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/747cd9fa-78bf-4047-8e07-7eabec8745bb)

## Architecture

This project follows Clean Architecture principles to ensure a scalable and maintainable codebase. It is divided into the following layers:

- **Data Layer**: Responsible for data retrieval from APIs or other sources.
- **Domain Layer**: Contains the business logic, including use cases and entities.
- **Presentation Layer**: Handles the UI and state management using the Bloc pattern.

### SOLID Principles

The project adheres to the SOLID principles:

- **Single Responsibility Principle**: Each class has a single responsibility, making the code easier to maintain and test.
- **Open/Closed Principle**: Classes are open for extension but closed for modification.
- **Liskov Substitution Principle**: Subclasses can replace their base classes without affecting the correctness of the program.
- **Interface Segregation Principle**: Interfaces are split into smaller, more specific interfaces.
- **Dependency Inversion Principle**: High-level modules do not depend on low-level modules; both depend on abstractions.

## Tools & Technologies

- **get_it**: For dependency injection.
- **injectable**: For code generation and dependency injection setup.
- **flutter_bloc**: For state management using the Bloc pattern.
- **dio**: For making HTTP requests.
- **retrofit**: For generating API client code.

## API Integration

This app integrates with The Movie Database (TMDb) API to fetch movie data, including popular movies and search results.


