
# 🏠 Flutter Take-Home Task — Rent Flow (By Zeinab)

This project is a submission for the Aseto Flutter take-home challenge. I implemented all three available screens — **Create Account**, **Pay Rent**, and **Pay Rent Saved** — to showcase clean architecture, reusable components, local data storage, and real-time user interactions.

---

## 📱 Features Implemented

### ✅ 1. **Pay Rent Flow**

* Full-screen form to collect rent payment details
* Fields: Landlord Name, IBAN, Bank Name, Email, Phone
* Location is fetched via GPS with reverse geocoding
* Validation added for all inputs using a shared validator class

### ✅ 2. **Pay Rent Saved**

* Displays the saved rent details
* Allows editing of Landlord Name via modal dialog
* Reads/writes from local storage (`GetStorage`)
* If no saved data is found, redirects back to the rent form

### ✅ 3. **Create Account**

* User registration screen with validation
* Password confirmation logic
* Responsive layout and mobile-friendly input

---

## 🛠️ Tech Stack & Packages

| Feature                      | Package / Tech                 |
| ---------------------------- | ------------------------------ |
| State Management             | `GetX`                         |
| Local Storage                | `get_storage`                  |
| Location (GPS & Reverse Geo) | `geolocator`, `geocoding`      |
| Permissions                  | `permission_handler`           |
| International Phone Input    | `intl_phone_field`             |
| Date Picker                  | `flutter_datetime_picker_plus` |
| Validation Utility           | Custom `TValidator` class      |
| Form Handling                | `GlobalKey<FormState>`         |

---

## ♻️ Architecture & Reusability

* **Stateless Widgets + Controllers** using `GetBuilder` and `Obx`
* **Reusable Components**: `CustomTextField`, `CustomButton`, `AddressSummaryCard`, `_infoTile()`
* **Model-Driven State**: `PayRentModel` with `fromJson`, `toJson`, `copyWith`
* **Navigation**: Centralized in `AppPages` with route constants
* **Auto State Restore**: Data is rehydrated from local storage if available
* **Location Fetch Flow**: Permission request ➝ GPS ➝ Reverse geocode ➝ Pre-fill address

---

## 🔐 Validation Rules

* Required checks on all fields
* Email format using RegExp
* Phone number range checks
* Password confirmation (in account screen)
* Dropdown and national ID validators

---

## 🚀 Bonus Features (Beyond Requirements)

* ✅ Built **all three** screens, not just one
* ✅ Fully working **edit & update** logic for saved rent data
* ✅ **Dynamic location fetching**
* ✅ Full form validation & user feedback
* ✅ Modular architecture for scale
* ✅ Smooth **user redirection** when saved data is missing
* ✅ Clean UI with consistent styling using `AppStyles`

---

## 📂 Folder Highlights

```
lib/
├── screens/
│   ├── create_account/
│   ├──<img width="426" height="935" alt="Screenshot 2025-08-02 at 8 20 11 PM" src="https://github.com/user-attachments/assets/6c14973e-34ad-4946-9ad7-55fa97ee2b08" />
<img width="431" height="982" alt="Screenshot 2025-08-02 at 8 19 59 PM" src="https://github.com/user-attachments/assets/a04fe93e-57f4-4d02-91dc-ed578dd9801d" />
<img width="423" height="947" alt="Screenshot 2025-08-02 at 8 19 38 PM" src="https://github.com/user-attachments/assets/a2ede062-af3b-4e3b-94be-f6abbf87887d" />
<img width="429" height="943" alt="Screenshot 2025-08-02 at 8 19 25 PM" src="https://github.com/user-attachments/assets/47a60441-ca2e-4834-8ba5-8ad388dfe496" />
<img width="425" height="937" alt="Screenshot 2025-08-02 at 8 19 15 PM" src="https://github.com/user-attachments/assets/d45a0cb5-0808-490d-a242-0aa5345d033e" />
 pay_rent/
│   └── pay_rent_saved/
├── controllers/
├── models/
├── styles/
├── widgets/
├── routes/
│   └── app_pages.dart
```

---

## 🧪 To Run the App

1. Run `flutter pub get`
2. Run the app using `flutter run` or via your IDE
3. Navigate between `/pay-rent`, `/pay-rent-saved`, `/create-account` via buttons or GetX routing

---

## ✨ Final Thoughts

This submission is structured with scalability and user experience in mind. I went beyond the initial scope to demonstrate:

* Clean architecture
* Local storage integration
* Map/location permissions
* Robust state management
* Real-time editing


 
---

## 📸 Screenshots

### 🏠 Pay Rent Screen

<img src="screenshots/Screenshot 2025-08-02 at 8.19.15 PM.png" alt="Pay Rent" width="400"/>

### ✅ Pay Rent Saved Screen

<img src="screenshots/Screenshot 2025-08-02 at 8.19.25 PM.png" alt="Pay Rent Saved" width="400"/>

### 📋 Summary View

<img src="screenshots/Screenshot 2025-08-02 at 8.19.38 PM.png" alt="Summary View" width="400"/>

### 📍 Location Picker

<img src="screenshots/Screenshot 2025-08-02 at 8.19.59 PM.png" alt="Location Picker" width="400"/>

### 📞 Phone Input + Calendar

<img src="screenshots/Screenshot 2025-08-02 at 8.20.11 PM.png" alt="Phone & Calendar" width="400"/>

---
 
