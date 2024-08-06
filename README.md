# Scrolling Table Application

This Flutter application demonstrates a scrolling table with synchronized columns using BLoC and clean architecture. The left and right columns scroll alternately, and corresponding columns are synchronized.

## Features

- Left and right sides of the table scroll in opposite directions.
- Columns are synchronized at specific points to ensure the correct data is displayed together.
- Implemented using BLoC for state management and clean architecture principles.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Comes with Flutter, no separate installation needed.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Nishant3516/Infitout-Scrolling-table.git
   cd scrolling_table
   ```

2. **Install dependencies**

   ````bash
   flutter pub get
    ```

   ````

3. **Run the application**

   ````bash
   flutter run
    ```
   ````

### Usage

The application displays a table with columns that scroll alternately. The left and right scroll controllers are synchronized to ensure the correct columns are displayed together.

### Customization

You can customize the table columns and data by modifying the table_data_model.dart and scrolling_table.dart files.
