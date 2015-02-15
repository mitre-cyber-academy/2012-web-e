This challenge is to ensure that they understand how to use the web inspector tools inside their browser as well as use cURL to post data. 

Solution:

1. inspect the form to find that there is a /turtles route.
2. inspect the contents of the route and see the alternate text for the link
3. recognize that the alt text is a link to a fb page with an id of 115138385166158
4. post to the /turtles/, doing so with a blank payload asks for your id. 
5. posting a name (the name of the form input that asks for your id) to turtles will return the id[0..-(number of turtles)] XOr'd with the flag
6. adjust the number of /turtles/ to change what is being XOr'd
7. Providing 4 turtles will give you the flag. 