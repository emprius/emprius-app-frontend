a# Emprius app

My first mobile app - learning Dart and Flutter from scratch!
Departing from a list of functional requirements, I designed the layout for UX/UI and organized the project into Feature-first DDD architecture as frontend software engineer.

**WIP!**: as the backend is being built atm, I have mocked the API responses for a relational database model and implemented the main features of the app so far.

<br>
<p align="center">
  <img src="/assets/extra/emprius_logo.png" style="width:30%"/>
</p>
<p align="center">

## Table of contents

- [Features](#features)
- [Mockup](#mockup)
- [Deployment](#deploy-the-app-demo)
- [Clone this repo](#clone-this-repository)
- [Technologies used](#technologies-used)
- [Demo](#demo)
- [Future work](#future-work)
- [Resources](#resources)
- [Aknowledgments](#aknowledgements)

## Features

This app will be used by Emprius non-profit foundation aimed to share resources among communities.

- Users will join the app by invitation and register their profile while pointing at their current location on a map. They are able to edit their profile and update an avatar.
- Once they log in with password authentication, they can search for resources showed in a map and check their availability with the option to apply different search filters.
- They can tap on the resource to see its detail card, which includes pictures, description and owner details.
- They can fill a form to ask for the resource to the owner only on available dates.
- Users can add their own resources to the network and track the ones they have asked for and the ones they have lent to other users as well as incoming petitions.
- They can finally rate the resource or the person they have been in contact with once the transaction is finished.
- There will be a graph displaying the activity of user in both senses.
- A system of tokens will be implemented for exchanging the resources among the network.

## Mockup
A first mockup I designed in Figma to guide feature distribution of the MVP prototype.

<p align="center">
  <img src="/assets/extra/mockup.png" style="width:70%;">
</p>

<br>

## Deploy the app demo
Download the [latest artifact](https://gitlab.com/emprius/emprius-app/-/jobs) from the pipeline, extract and install the **app.apk** on your Android device 

### Instructions for navigating the app demo
- Register the first time and remember your user
- Password length is now set to 4 characters
- Invitation can be anything at the moment
- Check out your new user drawer to find tools or manage in and outcoming requests

## Clone this repository
- Open the location where you want to clone the repository in terminal.
- Type `git clone git@gitlab.com:emprius/emprius-app.git` and press enter.

### Get dependencies and run the project
- Type `flutter pub get`
- Make sure you have debugging activated on your conected device
- Select your device (or emulator) on your IDE and run or execute `flutter run`

## Technologies Used

**Languages and frameworks**
- Dart
- Flutter
- Riverpod as state management library
- Freezed annotations
- JSON serialization

**Deployment and control system**
- Git
- Gitlab
- CD/CI

**Additional tools**
- Figma
- Leaflet.js
- Swagger
- Intellij

## Demo

<figure class="video_container">
  <iframe src="https://player.vimeo.com/video/789282344?h=78f4e31ad2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

## Future Work

- I will have first users check this MVP and gather their feedback to improve UX experience
- Implement the next features
- Remove the mocks and connect with the real backend
- Debugging
- Refactor providers and investigate new Riverpod auto generator
- Implement interfaces for repositories
- Build a beautiful theme
- Further coverage of Unit, Widget and Integration tests
- Refactor the code following DRY principle and have it better decoupled
- Apply mediaQuery to make it responsive to different screen sizes

## Resources

- [Flutter documentation](https://docs.flutter.dev)
- [Material design](https://m2.material.io/design) for UI guidelines
- [Swagger](https://swagger.io) for API development
- [Code with Andrea articles](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/) to decide best architecture


## Aknowledgements

I want to thank [Selankon](https://gitlab.com/selankon) for helping me with bug fixing, teach me how Swagger works and much more.
