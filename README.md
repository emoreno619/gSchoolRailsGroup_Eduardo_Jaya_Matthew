#Connects users to vendors of gluten free and vegan foods

<img src="./public/screenshotwpics.png" alt="">
<img src="./app/assets/images/screenshot.png" alt="">



[app in action](https://powerful-beyond-3469.herokuapp.com/#)

This application is designed to connect consumers of foods catered to special diets (like gluten-free and vegan) to the locations that sell those foods. Too often sites like Yelp and Google either connect users to locations that do not have those foods or do not provide enough information about those locations. Our app, Glorious Options, fixes that problem by presenting data from multiple brands and restaurants in one location, and includes options for users to suggest locations and brands/foods to be displayed as well.

Technologically, we encountered some difficulties in executing our vision. Initially, the app was thought find and present users with locations dynamically, but due to rate limits from Google's Geocoding API and response times from food brand servers taking too long, it is too slow when deployed. Instead, the app should scrape the entirety of all locations for relevant brands and restaurants and store them in the database in order to avoid wait times for users. Not having realized this difficulty until the fourth of four days allocated to work on this project, those changes have not yet been implemented. 

However, this app succeeds a Ruby on Rails full CRUD application, backed by a postgres database that utilizes three resources (foods, locations and users) across five relations of both one-to-many and many-to-many. 

Note to self: locationuser and fooduser tables/relations ARE the FAVORITES
