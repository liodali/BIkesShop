# bikes_shop

Shopping Flutter application for bikes

## Getting Started

<img src="https://github.com/liodali/BIkesShop/blob/main/screenshot/bikesShop.gif?raw=true" alt="Bike catalog app"><br>


## Build
* I used Flutter 2.2.2
1) Android
> flutter build apk --release
2) iOS
> flutter build ios --no-codesign



##### In this project, we implement the  clean architecture
* we have 3 layer:

    * <srong>App module </string>  : This module contains all  the code related to the UI/Presentation layer such as widget,route,localization,DI  and contain viewModel
    * <srong>Core</string> : holds all concrete implementations of our repositories,usecaes and other data sources like  network
    * <srong>Domain module </string>  : contain all interfaces of repositories  and  classes



> I used getIt as dependency injection for this project

> I used dio for http calls 

> I used FlutterHook and Provider for reactive UI

> I used auto_route to routing navigation

> I build RestApi using Ktor 
