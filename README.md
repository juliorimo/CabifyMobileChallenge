# CabifyMobileChallenge

In this iOS app a user can pick products from a list and checkout them to get the resulting price. The list of products is gotten from here: https://api.myjson.com/bins/4bwec/

## Overview

The project makes uses of `CocoaPods (1.1.1)` in order to automate and build the project.

Pods used in this project are:

    pod 'Alamofire', '~> 4.0'
    pod 'JGProgressHUD', '~> 1.4'
    pod 'SwiftyJSON', '~> 3.1'
    
## Project Setup Instructions

1. Clone the repository:
    ```zsh
    $ git clone git@github.com:juliorimo/CabifyMobileChallenge.git
    ```

1. Install missing `pods`
    ```zsh
    $ pod install
    ```

1. Open `CabifyMobileChallenge.xcworkspace`
1. Run

## Usability

This app is very easy to use for a new user. After launching the app, it will load all available products from the server and will show in a list. For each product you will see name, unit price and a stepper where tapping on it you will increase/decrease the number of units you want to add.

In the bottom of the view you can find a view where the total amount of the products will be shown.

![](https://github.com/juliorimo/CabifyMobileChallenge/blob/master/screenshot.png)

## Architecture

I followed a simplex architecture with 3 levels:
- View: Storyboards 
- Controller: ViewControllers and ViewControllersAccessory
- Model: Requests, RequestManagers and Responses

## Communications

I developed a custom communications system using Alamofire and SwiftyJSON where for each new request we will need to include a new Request and RequestManager class, as we have with `GetProductsRequest` and `GetProductsRequestManager`. The main reason to follow this pattern is that we can get 100% of test coverage in communications module by writing good tests as we have in `GetProductsRequestTests` and `GetProductsRequestManagerTests`.

## Unit testing

Due to the avialable time to do this challenge I just wrote tests in some of the most important parts of the proyect: communications module and the accessory where all the logic the main view is included. 




