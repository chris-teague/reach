# Reach Location Sharing

This is the Rails web app underpinning the Reach iOS & Android applications. It was created as an exercise in learning how Turbolinks 5 could work as a base for iOS & Android app development.

## Overview

The associated iOS & Android apps allow users to generate a unique URL that shares their current location with real time updates. This URL automatically expires after a given period of time. These apps use native background location updates so the user doesn't need to keep the app open for it to work effectively (as opposed to browser based location updates). After creating a location sharing session, a unique URL is generated & copied to the app user's clipboard. The user can then share this however they wish, and as it's just a plain old URL, the recipient just needs a web browser for it to work.

### Quick Demo:

<img src="https://raw.githubusercontent.com/chris-teague/reach/master/docs/example.gif" width="250">

## Tech

Turbolinks 5 is used to deliver a more native feel to the iOS & Android applications.

Action Cable is used to display real time location updates to the user.

LeafletJS is used to render the maps.

Ratchet is used to add some more native-feeling styling to the respective iOS & Android apps.

## Dependencies

The app relies on Redis & PostgreSQL

