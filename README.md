# Inspiration
There were a couple of things that inspired us to take on this project. Arc'teryx is a well-known and well-loved brand known for their high quality outdoor gear. Both outdoors and online, Arc'teryx has developed a great reputation. To combine technology and the company's strengths, we had a vision for an omnichannel experience that follows customers from the store, to the trails, and with their friends. Thus, we came up with Arc'Trek as a mobile app that customers can take with them anywhere.

# What it does
Personalized Trail Recommendations: Arc'Trek provides personalized recommendations for hiking trails based on user preferences such as experience level, location, and interests. This helps users discover new outdoor destinations that align with their skill level and interests. Users will be able to build community with friends on the app.

Product Suggestions: Integrated with Arc'teryx's product catalog, Arc'Trek recommends outdoor gear and apparel tailored to the user's gender, location, and the specific trails that were recommended in exploring. It uses OpenWeather API to detect the weather of the place and recommend gears accordingly. This ensures users have the appropriate equipment for their outdoor adventures while also increasing Arc'Teryx's Brand Engagement.

Community Engagement: Arc'Trek fosters a vibrant community of outdoor enthusiasts by providing a platform for users to share their experiences, recommendations, and feedback. Users can connect with their friends and see the hikes they have explored. It allows users to save their progress in the name of Arc'Teryx, enhancing Arc'Teryx's Brand Loyalty.

# How we built it
Utilized Swift for front-end development to create a user-friendly interface for the iOS platform.
Designed and implemented various UI components, including the slider for filtering trails, using Swift and Figma for prototyping.
Incorporated sign-in options for Apple and Google accounts to provide users with convenient authentication methods while ensuring security and privacy.
Created a Supabase database to store trail data, including information such as trail difficulty, length, location, and user reviews.
Utilized FastAPI to retrieve the best trails based on user preferences, such as experience level and location.
Implemented FastAPI to create a backend server for handling requests and responses.
Integrated OpenWeather API to retrieve real-time weather data for the user's location, which is used to personalize trail recommendations based on weather conditions.
Leveraged weather data and user preferences to provide personalized recommendations for Arc'teryx gears and clothing.
Integrated Supabase product catalog to retrieve Arc'teryx product information and generate links to the website for easy access to purchase.
Implemented functionality to dynamically update trail results based on the selected distance range.
# Challenges we ran into
Supabase Database creation was something new for all of us. Since we got a text file for products, we had to wrangle it into a proper table. We ran into output errors while retrieving data from the database
The frontend and backend integration was a bit overwhelming; there were errors in connections, but we managed to get past them.
Accomplishments that we're proud of
Using frameworks we didn't use before and building something out of it.
Implementing a viable and scalable mobile app with cross-platform compatibility
Technical things we never knew of and learned during these 24 hours
Our team's effort and support
# What we learned
Using Supabase for database creation was a huge learning curve for all of us.
We learned Swift for the first time using it for frontend creation.
Prototyping on Figma to challenge our UI/UX design.
Thinking from a business perspective and studying Arc'teryx as a brand
What's next for Arc'Trek
Better front-end and back-end integration.
Implementing the checkpoint reminders and potentially incorporating an audio component to it.
Building a front-end for user profiles where users can get health analytics along with data on the trails visited. Improve the UI/UX by adding customised badges to share on their social media for users as they progress in their hiking journey.
