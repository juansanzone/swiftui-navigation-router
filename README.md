
<img width="879" alt="Screenshot 2025-04-05 at 11 22 44 AM" src="https://github.com/user-attachments/assets/0b479e51-b6bc-4101-a880-92b37dfb1ef3" />

# SwiftUINavigationRouter

`SwiftUINavigationRouter` is a lightweight protocol designed to simplify and structure navigation logic in SwiftUI using `NavigationStack` and `NavigationPath`. It provides a scalable and reusable way to manage navigation per feature or flow in your app.

---

## ✨ Features

- 🔁 Decoupled navigation logic
- 🔍 Type-safe and testable
- 🧠 Declarative API
- 📚 Supports `push`, `pop`, and `popToRoot` out of the box
- 🧱 Each flow can have its own router
- 🛠️ Ready for dependency injection
- 📲 Example App Included
- 📦 Future support for `.present` navigation

---

## 📦 Installation

### Swift Package Manager

In **Xcode**, open your project and go to:

```
File > Add Packages...
```

Then, enter the following URL:

```
https://github.com/juansanzone/swiftui-navigation-router
```

You can also add it manually to your `Package.swift`:

```swift
.package(url: "https://github.com/juansanzone/swiftui-navigation-router.git", from: "1.0.0")
```

---

## 🚀 Getting Started

To use the router, you’ll need to:

1. Create a class that conforms to `SwiftUINavigationRouterProtocol`
2. Define your `Destination` enum
3. Implement the `viewFor(for:)` method
4. Connect everything inside a `NavigationStack` in your root view

---

## 🧪 Example

### Step 1 — Create your router

```swift
import SwiftUI
import SwiftUINavigationRouter

final class PaymentsRouter: SwiftUINavigationRouterProtocol {
    @Published var navigationPath: NavigationPath = .init()
}

extension PaymentsRouter {
    enum Destination: Hashable {
        case detailView
        case successView(paymentID: String)
    }
}

extension PaymentsRouter {
    @ViewBuilder
    func viewFor(for destination: Destination) -> some View {
        switch destination {
        case .detailView:
            DetailView()
        case .successView(let paymentID):
            Text("Success View: \(paymentID)")
        }
    }
}
```

> ✅ Each router manages the navigation logic of a specific flow (e.g., Payments, Profile, Onboarding, etc).

---

### Step 2 — Integrate router in the root view

```swift
import SwiftUI

struct HomeView: View {
    
    @StateObject private var router: PaymentsRouter = .init()
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            VStack {
                Button("Details") {
                    router.push(screen: .detailView)
                }
            }
            .navigationDestination(for: PaymentsRouter.Destination.self) { destination in
                router.viewFor(for: destination)
                    .environmentObject(router)
            }
            .navigationTitle("HomeView")
        }
    }
}
```

> ⚠️ In this example, we use `@EnvironmentObject` for simplicity. In real-world apps, prefer a proper dependency injection strategy (e.g., via factory, container, or constructor injection).

---

### Step 3 — Push from a nested view

```swift
import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var router: PaymentsRouter
    
    var body: some View {
        VStack {
            Text("DetailView")
                .onTapGesture {
                    router.push(screen: .successView(paymentID: "123"))
                }
        }
    }
}
```

---

## 📚 API Reference

### `push(screen:)`

Pushes a new screen defined in your `Destination` enum:

```swift
router.push(screen: .detailView)
```

### `push(_ view: Hashable)`

Pushes a view directly to the `NavigationPath`:

```swift
router.push("AnyHashableView")
```

> Note: This method is less type-safe. Prefer using `.push(screen:)` with an enum when possible.

---

### `pop()`

Pops the last view in the stack:

```swift
router.pop()
```

---

### `popToRoot()`

Clears the entire navigation stack and returns to the root:

```swift
router.popToRoot()
```

---

## 🧠 Why a Router per Flow?

Each major flow (e.g., Payments, Orders, Onboarding) should have its own router. This promotes separation of concerns and improves scalability and testability.

```swift
final class OnboardingRouter: SwiftUINavigationRouterProtocol { ... }
final class OrdersRouter: SwiftUINavigationRouterProtocol { ... }
```

---

## ☝️ One more thing...

### 🚀 Simplify Your Navigation with `NavigationRouterView`

**Bored and tired of repeatedly defining `navigationDestination` everywhere?** Let `NavigationRouterView` handle everything for you!

### 🎯 Why `NavigationRouterView`?

- ✅ **Simplified Setup**: Define your navigation logic once and reuse it effortlessly across your app.
- ✅ **Cleaner Code**: No more repetitive `navigationDestination` setups cluttering your SwiftUI views.
- ✅ **Easy Maintenance**: Centralized routing makes your navigation easy to maintain and scale.

### ⚙️ How Does It Work?

`NavigationRouterView` uses a simple yet powerful protocol `NavigationRouterProtocol`, which lets you define navigation paths and corresponding views neatly in one place.

### Set Up `NavigationRouterView`

Simplify your view by embedding it within `NavigationRouterView`:

```swift
struct HomeView: View {
    @StateObject private var router = MyRouter()

    var body: some View {
        NavigationRouterView(router: router) {
            VStack {
                Button("Push Detail View") {
                    router.push(screen: .detailView)
                }
            }
            .navigationTitle("Home")
        }
    }
}
```

That's it! 🎉 Now your navigation is cleaner, modular, and easier than ever!

---

## 📱 Example App

A basic working example is available inside the [`ExampleApp`](./ExampleApp) folder.  
This mini app demonstrates how to:

- Create a router for a feature flow
- Push and pop views using the router
- Display views based on enum-driven navigation

You can open the folder with Xcode and run it on the simulator to see `SwiftUINavigationRouter` in action as a local package.

---

## 🚧 Roadmap

- [x] Support for push-based navigation
- [x] Built-in support for `pop` and `popToRoot`
- [X] Sample app
- [X] Automatic Injection: The router is automatically injected into your stack views using SwiftUI's EnvironmentObject.
- [ ] Full integration with dependency injection containers
- [ ] `present` and `dismiss` API (coming soon)

---

## 🙌 Contributing

Pull requests are welcome! Feel free to fork the repo, open issues, and help shape the future of `SwiftUINavigationRouter`.

---

## 📄 License

MIT License

---

## 👨‍💻 Author

Created with ❤️ by [Juan Sanzone](https://github.com/juansanzone)
