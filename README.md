# Project 5 - Tumblr
Submitted by: Samir Hassan

Tumblr is an app that fetches a feed of blog posts from the Tumblr API and displays them in a scrolling list via a table view. The app can be easily configured to fetch the blog posts from 
any other Tumblr blog. I'm using the Tumblr humansofnewyork blog to show on my feed. The app is also refreshable which does not matter for the data we're using because it seems that 
humansofnewyork Tumblr blog hasn't been updated in a while. If we were to target any other API with real-time changing data, the refresh button would update the app accordingly.

Time spent: 3 hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] App has a configured table view and table view call
- [X] App populates the table view with data fetched from an API


The following **optional** features are implemented:

- [ ] App fetches posts from a different Tumblr blog
- [X] App has a refresh control to update the table view

The following **additional** features are implemented:

N/A

## Video Walkthrough

Here is a reminder on how to embed Loom videos on GitHub. Feel free to remove this reminder once you upload your README. 

[Guide](https://www.youtube.com/watch?v=GA92eKlYio4) .

## Notes

I encountered a few challenges while building the app. I didn't get why at first I was making the network call and there was no data coming in. Then, I realized that downloading data
over a network is both a slow and async process. So, I made sure to refresh the table which would give the table another chance to call the data in and incorporate it. I also had trouble 
getting the UI to look good. I coudn't find just the right image size so I settled on a small square and proportional labels. I felt that a white font on black background would look nice 
for this app and that was one way I targeted making the app look better.

## License

    Copyright 2024 Samir Hassan

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
