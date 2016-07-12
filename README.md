# RACMVVM
Proof of concept: using Reactive Cocoa with MVVM

This app displays a single view whose view controller uses ReactiveCocoa to monitor its view model for updates to the variable `beatle` and displays information about whether the value is a valid member of the Beatles. The view model periodically updates the value of `beatle` in order to demonstrate each possible outcome (valid or invalid).
