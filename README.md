# Todo Project

## Prerequisites

In order to be able to setup and run this application, the following need to be installed and setup

- [Flutter](https://docs.flutter.dev/get-started/install)
- [Android Studio](https://developer.android.com/studio)
- [VS Code](https://code.visualstudio.com/)

## Project Setup

To setup the project in your machine:

- Clone the repo

```console
foo@bar:~$ git clone git@github.com:moseskamira/todo.git
```
- CD into the root of the project and install the dependencies

```console
foo@bar:~$ cd todo
```

```console
foo@bar:~$ flutter pub get
```

- Run the build runner in all packages to generate required files

```console
dart run build_runner watch --delete-conflicting-outputs
```
## Project Implemented Concepts
- Providers: State Management
- Material Route: Route Management

### Screenshot showing Items in Bottom Sheet

![List of Todos](/assets/one.png)

![Todo details](/assets/two.png)

![Todo Edit](/assets/three.png)