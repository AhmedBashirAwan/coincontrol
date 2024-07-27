# CoinControl

- Manage your expenditures effectively with AI-powered solutions tailored to your financial conditions. Whether you're looking to reduce debt, gather savings, or make smart investments, our platform has you covered. Harness the power of advanced technology to take control of your finances and achieve your financial goals with ease
---

### Table of Contents

1. [Project Features](#projectfeatures)
2. [Requirements](#requirements)
3. [Installation Guide](#installation)
4. [Project Structure](#projectstructure)

---

### Project Features
- CoinControl comprised of Following features
    - FirebaseAuth
    - CloudFirestore
    - FinTech
    - Web Scrapping
    - Deeplinking

### Requirements
- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- Android Studio or Visual Studio Code for development
- Android/iOS emulator or a physical device for testing

### Installation Guide

**Steps:**
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/coincontrol.git

2. Navigate into the project directory:
   ```bash
   cd coincontrol

3. Get dependencies:
   ```bash
   flutter pub get

4. Run the app:
   ```bash
   flutter run

### Project Structure

coincontrol/  
├── lib/  
│   ├── main.dart                       # Entry point of the application  
│   ├── constants.dart                  # Global constants  
│   ├── firebase_options.dart           # Firebase configuration  
│   ├── assets/                         # Project assets (images, fonts, etc.)  
│   ├── bloc/                           # BLoC (Business Logic Component) related files  
│   │   ├── appbloc.dart                # Main BLoC implementation  
│   ├── components/                     # Reusable UI components  
│   │   ├── budgetcreationpopup.dart    # Budget creation popup UI  
│   │   ├── buttons.dart                # Custom buttons  
│   │   ├── drawer.dart                 # Navigation drawer UI  
│   │   ├── formsfield.dart             # Form fields UI  
│   │   ├── sociallinks.dart            # Social links UI  
│   │   ├── textfields.dart             # Custom text fields  
│   ├── src/                            # Core application logic  
│   │   ├── auth/                       # Authentication-related code  
│   │   ├── budget_creation/            # Budget creation logic and UI  
│   │   ├── customer_support/           # Customer support features  
│   │   ├── dashboard/                  # Dashboard UI and logic  
│   │   ├── debtrecovery/               # Debt recovery features  
│   │   ├── information_forms/          # Information forms and handling  
│   │   ├── investment_plans/           # Investment plans features  
│   │   ├── relief_plans/               # Relief plans features  
│   │   ├── settings/                   # Settings features and UI  

