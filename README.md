# Web3 Trivia Template
Create your own web and mobile trivia app in just minutes using this full-feature template built using your favourite gameplay features such as:
* Video, audio and text question formats
* Leaderboards
* Player analytics
* Lifelines

&nbsp;
## Live Demo
- **Android:** https://play.google.com/store/apps/details?id=com.nbird.covalentweb3trivia
- **Web:** https://blockchaintrivia-8fc26.web.app

&nbsp;
## Quick Start

1. Fork this repo.

2. Add and customize your quiz questions (in JSON format) in `trivia-questions/questions.json`.

3. Create a new project in [Firebase](https://cloud.google.com/firestore/docs/client/get-firebase).

4. Add Firebase to your project (Android, iOS, and/or Web). 
    - For Android, you will need to download and copy over the `google-services.json` file to `android/app`
    - For iOS, you will need to download and copy over the `GoogleService-Info.plist` file to `ios/runner`

5. Set up a Realtime Database for your project in Firebase. Copy the database URL. 

6. In `lib/MainActivity.dart`, find the following line and paste the database URL:
    ```
    final needsSnapshot = await FirebaseDatabase.instance.refFromURL("PASTE THE URL HERE/NEW_APP/LeaderBoard").get()
    ```

7. Upload the `/trivia-questions/questions.json` file to your Firebase database.

8. Go to the Google Developer Console to get a app specific `Client ID` for Google authentication

9. In `lib/MainActivity.dart`, find the following line and paste in your Client ID from the previous step:

    ```
    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: "PASTE THE CLIENT ID HERE");
    ```

10. Run and test the app using your Android or iOS emulator. 

&nbsp;
## Features & Modes

<<<<<<< Updated upstream
#### Setup Flutter Firebase integration
Check out the [documentation](https://firebase.google.com/learn/pathways/firebase-flutter) to setup Flutter Firebase integration.
=======
- 📱 Mobile first: Created using [Flutter](https://flutter.dev/) and natively supports Android, iOS and Web platforms.
>>>>>>> Stashed changes

- 📊 Scalable, professional-grade database: Powered by [Firebase](https://firebase.google.com/docs).

- 📈 Leaderboard: Analyze, Track, Learn, and Grow! Keep an eye on your progress and self-evaluation!

- 💌 Lifelines: Four vivid sets of lifelines to help and guide you including: Poll, 50-50, Swap and Expert!

<<<<<<< Updated upstream
* Go to Google Developer Console and get the Client ID to access the Google authentication in Flutter Web.
```
https://console.cloud.google.com
```
Check out the [documentation](https://developers.google.com/adwords/api/docs/guides/authentication)

<!-- <ul>
 <li>Under "Select a project" on the top, select "Create new project" and fill the details.li>
 <li>Under "In the dashboard on the left, go to "API & Auth" -> Credentials.>
 <li>Under "OAuth", click "Create new client ID.>
 <li>Under "Application type", select "Web application.>
 <li>Under "Authorized Javascript origins", enter the URL(s) of your website. The "Authorized redirect URLs" are updated automatically>
 <li>Click "Create client ID".>
 <li>The new client ID can be accessed any time by going to "Credentials" in the left dashboard. It looks something like this: "3453453452345-dfgjw3456u2094mlfg45p.apps.googleusercontent.com".>
</ul> -->
=======
- 🎮 Single Mode: Test your knowledge, practice, and compete against time. Score points for accuracy. Achieve ranks and high levels!
>>>>>>> Stashed changes

- 🖼️ Picture Quiz: Test your visual skills and ace your pictorial predictions.

- 🥁 Audio & Video: Add multimedia quiz questions including: sounds, songs, video clips, and more.

&nbsp;
<a href="https://play.google.com/store/apps/details?id=com.nbird.covalentweb3trivia"><img src="https://play-lh.googleusercontent.com/yvMUS3_tE6z5yR7onWKYq-q3ZF9j8uxdtVnRymfw7jIVR8f-DshAPy8RlpL-kWgSXIt0=w832-h470"></a>

&nbsp;
## Feedback & Support
We love our community and want to help *everyone* build in web3 :muscle:

If you:
- Find bugs or issues with this template, please raise an [Issue](https://github.com/covalenthq/web3-templates/issues). Better yet, identify a fix and create a [PR](https://github.com/covalenthq/web3-resources/pulls) :smile:
- Need any support with using the template, message us in our [Discord](https://covalenthq.com/discord) in the `#feedback-and-support` channel