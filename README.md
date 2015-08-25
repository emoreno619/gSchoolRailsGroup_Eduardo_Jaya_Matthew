<img src="./public/screenshotwpics.png" alt="">
<img src="./app/assets/images/screenshot.png" alt="">

[app in action](https://powerful-beyond-3469.herokuapp.com/#)

This application is designed to connect consumers of foods catered to special diets (like gluten-free and vegan) to the locations that sell those foods. Too often sites like Yelp and Google either connect users to locations that do not have those foods or do not provide enough information about those locations. Our app, Glorious Options, fixes that problem by presenting data from multiple brands and restaurants in one location, and includes options for users to suggest locations and brands/foods to be displayed as well.

Technologically, we encountered some difficulties in executing our vision. Initially, we conceived of the app finding and presenting users with locations dynamically, but due to rate limits from Google's Geocoding API and response times from brand servers taking too long, the app should scrape the entirety of locations for relevant brands and restaurants and store them in the database in order to avoid wait times for users. Not having realized this difficulty until the fourth of four days allocated to work on this project, we have not yet had time to implement those changes.

Note to self: locationuser and fooduser tables/relations ARE the FAVORITES
