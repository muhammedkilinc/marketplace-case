
# MarketplaceCase iOS Project

![Platform](https://img.shields.io/badge/platform-iOS%2016.0%2B-blue.svg)
![Swift](https://img.shields.io/badge/swift-5.5-orange.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

Welcome to the **MarketplaceCase** iOS project! This project is developed using Xcode and follows a modular architecture. It leverages Swift Package Manager (SPM) for managing modules, making it easy to maintain and extend.

## Project Overview

### Modular Structure

The project is structured into several Swift packages, each serving a specific purpose:

1.  **Localization 🌍**:
    
    -   Contains all language support and string localization.
2.  **DesignSystem 🎨**:
    
    -   Includes fonts, colors, spacing, radii, images, and asset files used throughout the app.
3.  **CommonUI 🚀**:
    
    -   Provides common UI components and elements shared across modules (e.g., Solid Button).
4.  **Network 🌐**:
    
    -   Handles all network operations, requests, and responses.
5.  **MarketplaceCore 🏢**:
    
    -   Houses shared structures used across modules, such as public interfaces (e.g., `LoginModuleBuilder`, `DiscoveryModuleBuilder`), Alert routable, TabBarController, and TabBarConfigurator. This separation ensures that modules don't have direct dependencies on each other.

### Modules

1.  **LoginModule**:
    
    -   Contains all components related to the login screen, including router, presenter, view, interactor, email and password validators, and login module configurator.
2.  **DiscoveryModule**:
    
    -   Encompasses all components for the discovery screen, including router, presenter, view, interactor, email and password validators, and discovery module configurator. The screen utilizes `UICollectionViewCompositionalLayout` and `UICollectionViewDiffableDataSource` for listing discover products.

### VIPER Architecture

-   Each module follows the VIPER architecture, consisting of ViewController, Presenter, Interactor, and Router.
-   Configurators and dependency entities are utilized within each module:
    -   **Dependency**: Contains objects needed externally by the module.
    -   **Configurator**: Configures the module, including its dependencies, and returns the view controller.

### Unit Testing🧪

-   Unit tests are written for components within the **LoginModule**:
    -   EmailValidator
    -   PasswordValidator
    -   LoginService

## Getting Started🚀

1.  Clone the repository to your local machine.
    
2.  Open the Xcode project `MarketplaceCase.xcodeproj`.
    
3.  Build and run the project using Xcode.
    

## Contributing

Contributions to the **MarketplaceCase** project are welcome! Feel free to open issues and pull requests for bug fixes, features, or enhancements.

## License

Not available.

🚀 Happy coding! 📱🎉
