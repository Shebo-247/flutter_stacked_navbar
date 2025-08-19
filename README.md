# Flutter Stacked Navbar

> Flutter Stacked Navbar is a customizable and flexible navigation bar built for Flutter applications, designed to work seamlessly.


## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_stacked_navbar: ^1.0.0
```

## 🚀 Usage
```dart
StackedNavbar(
  navItems: [
    NavItem(
      title: "Home",
      icon: Icon(Icons.home),
      iconSelected: Icon(Icons.home),
    ),
    NavItem(
      title: "My Visits",
      icon: Icon(Icons.calendar),
      iconSelected: Icon(Icons.calendar),
    ),
  ],
  onTabClicked: (index) {},
  activeNavColor: Colors.blueGrey,
  activeLabelColor: Colors.blueGrey,
  inactiveLabelColor: Colors.black,
)
```

---

## 📸 Preview

![Stacked Navbar](images/stacked_navbar.gif)
<img src="https://github.com/Shebo-247/flutter_stacked_navbar/blob/main/images/stacked_navbar.gif"  width="300"/>

---