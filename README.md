
# **GoRouter Sample — High-Level Summary**

This sample demonstrates a clean, scalable navigation architecture using **GoRouter + StatefulShellRoute + IndexedStack**. The goal is simple: predictable navigation, controlled screen lifecycles, and cubits scoped exactly where they belong.

---

## 1. `extra`

* A straight replacement for `arguments`
* Lets you pass any data to a route. 

---

## **2. Difference between `context.go`, `context.push`, and `context.pushReplacementNamed`**

### **`go`**

* Replaces the entire navigation stack.
* Use it for major route jumps like navigating from splash or auth module.

### **`push`**

* Pushes a new screen on top of the current stack.
* Use it for details screens or temporary flows.

### **`pushReplacementNamed`**

* Replaces the current screen with a new one.

---

## **3. HomeScreen & AppRouter explained**

### **HomeScreen**

* This is the shell that hosts your bottom navigation and orchestrates your branch switching.
* Displays the active branch using `StatefulNavigationShell`.
* The Scaffold lives at the top level, so UI chrome (bottom nav) never disappears.


### **AppRouter**

* Configures all routes.
* Uses `StatefulShellRoute.indexedStack` to create three independent navigation stacks: Dashboard, Profile, Settings.
* Injects cubits per branch (or per screen) instead of globally.

This separation makes the routing model predictable and the codebase modular.

---

## **4. Screens build only when accessed**

IndexedStack + GoRouter gives you controlled lifecycles:

* Each branch maintains its own state independently.
* Screens are built only when the user visits the tab. They are kept alive once built.
* Keeps each branch alive while switching between them.
* Returning to a tab does not trigger heavy rebuilds or API calls unless you choose to.
* No reinitialization when switching tabs.
* No extra API calls unless you trigger them.

This improves performance and avoids unnecessary work.

---

## **5. Cubits are provided only where needed**

The sample shows a disciplined injection pattern:

* `DashboardCubit` is scoped at the shell level → shared across Dashboard and its inner routes.
* `ItemDetailsCubit` is created only in the details route.
* `ProfileCubit` and `SettingsCubit` exist only inside their respective branches.

This prevents accidental global state, reduces memory usage, and keeps responsibilities tight.

