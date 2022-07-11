# **Covalent Web3 Trivia**
> Covalent Web3 Trivia : Single-Player Quizzers For Web3 And The Covalent Ecosystem.
<img src="https://play-lh.googleusercontent.com/FoyS9HkImE0Qo1PMyvEF21Ima9b55GbI5k9xNalAwXE4AXeF9fjXphh6XwSCCyTC-hY=w480-h960" width="100px" height="100px">


## ***INTRODUCTION***

Welcome! ❤

Covalent presents The Ultimate Quiz Station Of Web3.

An aim to connect people across the world 🤳🏻 and provide them a platform to learn Web3 . 💞


⭐⭐🌟⭐⭐



## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/covalenthq/Covalent_Flutter_Trivia.git
```

**STEP 2:**

#### Setup Flutter Firebase integration
Check out the [documentation](https://codelabs.developers.google.com/codelabs/flutter-firebase/#4) to setup Flutter Firebase integration.

##### For Android
In `android/app` folder add your `google-service.json`.
##### For iOS
In `ios/Runner` folder add your `GoogleService-Info.plist`.

**STEP 3:**

#### Get the Client ID

* Go to Google Developer Console.
```
https://console.cloud.google.com
```
<ul>
 <li>Under "Select a project" on the top, select "Create new project" and fill the details.li>
 <li>Under "In the dashboard on the left, go to "API & Auth" -> Credentials.>
 <li>Under "OAuth", click "Create new client ID.>
 <li>Under "Application type", select "Web application.>
 <li>Under "Authorized Javascript origins", enter the URL(s) of your website. The "Authorized redirect URLs" are updated automatically>
 <li>Click "Create client ID".>
 <li>The new client ID can be accessed any time by going to "Credentials" in the left dashboard. It looks something like this: "3453453452345-dfgjw3456u2094mlfg45p.apps.googleusercontent.com".>
</ul>

**STEP 4:**
* Open the Project and go to MainActivity

```
covalent_trivia_flutter/
|- lib/
    |- MainActivity
```
* Paste the Client ID generate in Step 3

```
final GoogleSignIn googleSignIn = GoogleSignIn(clientId: "PASTE THE CLIENT ID HERE");
```

**STEP 5:**
* Create the Firebase Database
* Copy the firebase database URL (DEMO FORMAT : https://blockchaintriviamania-00000-default-rtdb.firebaseio.com/)
* Open MainActivity and paste the URL, under leaderBoardData() function to access the LeaderBoard.

```
final needsSnapshot = await FirebaseDatabase.instance.refFromURL("PASTE THE URL HERE/NEW_APP/LeaderBoard").get();

```

**STEP 6:**
* Upload the the demo JSON File in Firebase Database for trial purpose

```
covalent_trivia_flutter/
|- lib/
    |- DemoJSON
```
### ***TECHNICAL ASPECTS & FUNCTIONALITIES***

- The Android,iOS And Web Application has been created using `FLUTTER` in `DART` as the primary language with designs and flows created on `FIGMA` .
- Covalent Web3 Trivia uses `FIREBASE` as the database.
- Powered by real-time firebase storage which sync players across the world, add them to a dynamic lobby for each game and store the stats as it proceeds.
- Highly interactive quizzing modes with neat logic and user-centric UI/UX.
- Optimized for smooth lobby experience and authenticate data fetching.
- Highly scalable, strong robustness and easy maintenance.


## ***🔮QUIZ MODES*** 

🎮 Single Mode: Test your knowledge, practice, and compete against time. Score points for accuracy. Achieve ranks and high levels!

🖼️Picture Quiz: Test your visual skills and ace your pictorial predictions with Covalent Web3 Trivia.

🥁Audio & Video: The ultimate test of senses. A knowledgeable and alert mind rules. Fight and make your way up! Song, Movies, Entertainment, Sounds, and many more!


<img src="https://play-lh.googleusercontent.com/yvMUS3_tE6z5yR7onWKYq-q3ZF9j8uxdtVnRymfw7jIVR8f-DshAPy8RlpL-kWgSXIt0=w832-h470">

## ***FEATURES*** 

📈 Leaderboard: Analyze, Track, Learn, and Grow! Keep an eye on your progress and self-evaluation!

📊Insatiable database: Sample Database to test the app with . Test & Boost your General Knowledge. Improve concentration and memory!

💌Lifelines: Four vivid sets of lifelines to help and guide you. Poll, 50-50, Swap and Expert!

⭐⭐🌟⭐⭐


### ***PUBLISHED SAMPLE***
Experience the fun of quizzing on Covalent Web3 Trivia!

Android Version
[Download now](https://play.google.com/store/apps/details?id=com.nbird.covalentweb3trivia) at Google Play Store

**APPLICATION SCREENSHORTS**

<!--  <img src="https://play-lh.googleusercontent.com/UbXmt1BMHNzyzZidAhCFliybpZiTNepkweQntyho9MnWcpff5_v3z_9i0kP3YMPKzI4=w1052-h592" width="150px" height="320px">   <img src="https://play-lh.googleusercontent.com/bmxdHdteYsFfuWg1OHVrqLJAYQkMiJw0VICgsfjh4AUlboiZBZL6JPOApDTwKrH66LQ=w1052-h592" width="150px" height="320px">   <img src="https://play-lh.googleusercontent.com/W1VUfTkwP11ATOMgj3e7PbyhtnJ9lmPkON7Ea8nq9CHTixLy55m1pOxwSQwWNu0CVA=w1052-h592" width="150px" height="320px">   <img src="https://play-lh.googleusercontent.com/YmxOK00J0Sm6cvRLcKG_A5c92KHujp1RFiva3dTSXIgaSvjdxDZAR6DKN5symVYnZQ=w1052-h592" width="150px" height="320px"> <img src="https://play-lh.googleusercontent.com/qjdjaB2Xpm1E0_VxxeKOWQJz-0l3lkqQUxTbz8J_6xJOEgjN-d6UL9k83bnQDE5TK3Ag=w1052-h592" width="150px" height="320px"> <img src="https://play-lh.googleusercontent.com/9WSllFKbR2KyF3jx5OSfjlIo9pdwk9l0l4-1pcELW0HFCzio3zp1NuXokVNtIT9maK4=w1052-h592" width="150px" height="320px"> -->

Web Version
[Visit Now](https://blockchaintrivia-8fc26.web.app/#/)

<!-- **FLUTTER WEB SCREENSHORTS**

 <img src="https://github.com/covalenthq/Covalent_Flutter_Trivia/blob/main/assets/Main%20Activity.png?raw=true"
     width="300px" height="180px"> <img src="https://github.com/covalenthq/Covalent_Flutter_Trivia/blob/main/assets/Quiz%20Layout.png?raw=true"
     width="300px" height="180px"> <img src="https://github.com/covalenthq/Covalent_Flutter_Trivia/blob/main/assets/Audience%20Advice.png?raw=true"
     width="300px" height="180px"> <img src="https://github.com/covalenthq/Covalent_Flutter_Trivia/blob/main/assets/Expert%20Advice.png?raw=true"
     width="300px" height="180px"> <img src="https://github.com/covalenthq/Covalent_Flutter_Trivia/blob/main/assets/Score%20Board.png?raw=true"
     width="300px" height="180px">	  -->
		 

>The most creative way to spend your spare time.🎯🏆 The Interactive platform will never stop astonishing the quizzer inside you.





 



