Gimenez-Velez course project

Assignment 2
Done:
-Scaffolding for users, posts, comments, likes, user types, home, reports and dislikes
-Navigation to login, register, main page, wall and profile
-Navigation to CRUD for user, posts, comments and likes
-Layouts for landing page, register, login, main, wall and profile
-Login and register page, unused by now. Redone over scaffold auto-page
-Common stylesheet for all views

API Tests (Done):
-Create for user and post
-Read for user and post (complete list of users or posts)
-Read for user and post
-Update for user and post
-Delete for user and post
link to postman API: https://www.getpostman.com/collections/bcec7e37a9f2f238ab89

Pending:
-Creating login and wall controller and model classes
-Scaffold for login and wall
-Propper routing for wall and login
-Delete dislike model and controller with respective scaffolding
-Use of bootstrap for easier stylesheet modification
-Showing user posts, comments and likes in wall
-Seeds for likes and dislikes
-Improve stylesheet sthetics

Assignment 3
Note: to access server use following command (in stead of rails s): dotenv rails server

Done:
-System Access (points a, b and c)
-Registration (points a, b and c)
-User Administration (points a, b.i, c and d)
-System Administration ()
-User Profile (points a and b)
-Posts (points a.i, iv, v and g)
-Comments ()
-User Search ()

Pending:
-User Administration (point b.ii)
-System Administration (points a, b, c and d)
-User Profile (point c)
-Posts (points a.ii, a.iii, b, c, d, e, f and h)
-Comments (points a, b c and d)
-User Search (points a and b)
-User email confirmation pending for email login and forgot password
-One click for each action per person (upvote, downvote, follow and flag) and saving counter in db

Bugs:
-back button for post details view not working
-cant edit profile if logged in with google auth due to no password input
