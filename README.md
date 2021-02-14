# template

A Flutter template for new projects with most of the basic needs covered. This is a very opinionated and personal setup so keep that in mind when filing issues.

## Getting Started

### Architectural Overview
- The architecture closely resembles the one shown [here](https://www.raywenderlich.com/6373413-state-management-with-provider)
- State Management management is handled as follows
    - `/providers` folder will contain most of the logic of the app. 
        - The `*_provider` classes are just services which handle internal state of the application (aka viewModels if you're familiar with the terminology). They should handle all the data processing needs of your app including for the UI **(Please don't mix business logic with UI code even if it's easier that way )**. 
    - The `/services` classes are just plain dart classes which only provide functions and do not keep internal state or modify application state.
- Service location:
    - Get it is used for service Location.
    - Classes  which qualify are the ones which implement business logic, connect to repositories (local or else ), etc. Typically `/api` ,`/providers`, `/services`.
      Services **MUST** only be explicitly initialized in `services.dart` this convention aims to keep all the service's code centralized  and since they are not compile time checked have a single-file/source of truth comes in handy when debugging.
- UI is separated in different folders:
    - `screens` which encapsulate complete views of the app and sub-screens if the information they display is complex enough.
    - `widgets` which contains reusable pieces of the UI.**(If you find yourself copy-pasting a specific widget more than 2 times is probably a good candidate to standardize its parameters and move it to the widgets directory)**
- API folder contains the base contract of the API to which the app communicates (may be more than one but for each a new contract must be made) and its concrete implementations. A contract is created to decouple the implementation from the class and for them to be swappable .
    - Example: Instead of injecting the `concreteApi` you inject the `apiContract` which permits you the developer to swap the implementation to any class which complies with the `apiContract` such as a mock class.
- Core folder holds classes you use throughout your entire app or common logic. In this case the failure class is implemented which encapsulates Exceptions in the network layer. 
- Models folder contain your data classes(plain dart objects) and usually the logic to serialize , deserialize them if needed.
   - Fixtures keep raw data typically in `MdelName.json` format from which the models must be de serialized from. they provide enhanced testability and can be used to mock a server response during development.
- Lastly `utils` is just a utility folder containing mostly methods, constants, colors or widgets which provide none or little visual, but encapsulate common behavior.
### Extras
- Some extras that can be added are:
    - sqflite database boilerplate.
    
    - L10n and i18n for multi language 

    - Animations utilities.
    
Those have not been included to keep this as lightweight as possible and because not all projects require them. Albeit one could argue neither `dio` for  networking is required in every project. 
### Recommendations
- If more than simple serialization or deserialization is needed `freezed` or `json_serializable` packages are recommended.
- For form management `flutter_form_bloc` is recommended.
- For charts `fl_chart`

## Acknowledgement
 Most of the classes contained in the utils are inspired or implemented at [gskinner](http://blog.gskinner.com/archives/category/flutter). Feel free to visit their blog for awesome content.
 All of the awesome packages used here and their authors.

## Package by feature(or domain)
 Code/package organization is one of the key factors of a good architecture:

 Higher Modularity.
High Cohesion.
Easier Code Navigation.
Minimizes Scope.
Isolation and Encapsulation.

## App (Core)
Handle global dependency injection.
Contain extension functions.
Contain the main framework abstractions.
Initiate in the main application common 3rd party libraries like Analytics, Crash Reporting, etc.
