# MentorMe

[App deployed on Heroku] (https://techmentor.herokuapp.com/)

Rails App by Simon, Corey and Vanessa.

## Contents

[Working Info](#working-info)

[Short Answer Questions](#short-answer-questions)

[Design Planning](#design-planning)

[Inspiration](#inspiration)

[Team Communication](#team-communication)


## Working Info

---

**Workflow Info for Us**

Team Questions Thurs Nov 1st

Bookings: do we want to go the route of sending an email, or do we want to go the route of allowing people to make full bookings on the website? Today is the time to decide which of those to push for. Could potentially go for email first to have some sort of record, then do the calendar afterwards. (I know email is not MVP, but it would give us a simple solution to the booking problem which we could then build off.)

Decision: do emails first and then shoot for a booking system.

## Git Workflow

We set the project up as a GitHub organisation, aiming to make the organisation repo the source of truth. When working on our own machines, we will start by doing the following:

- on branch master, do 'git pull'
- create a new branch with: 'git checkout -b branch-name'
- work on the new branch
- commit to the new branch
- push to the online repo with: 'git push origin branch-name'
- checkout back to master
- go into the GitHub repo and merge it into master 'new pull request'
- delete the branch online if you don't need it anymore
- do a git pull on the local machine
- delete the local branch if you don't need it any more with 'git branch -d branch-name'

## Database Seeding

In order to use the seed file to populate our database we need to do the following:

rails db:drop
rails db:create
rails db:migrate
rails db:seed

## Heroku

- Deploy either in the morning or early in the afternoon as this is less stressful than at 4.45pm!

## Sprint Planning

Friday Oct 26 and Monday Oct 29

App Idea - To connect Mentors and Mentees in the Tech Industry in Melbourne.

Problems this app will solve:

• Hard to meet developers in the industry
• Hard to develop communication and management skills working in a highly technical enviroment

**User Personas:**

• Coder Academy student - John is a career changer and has recently finished a bootcamp course at Coder Academy. He is confused about what direction he should be taking and would like to sit down with an experienced developer to gain some career advice.

• Senior Developer - Jane is a Senior Developer at a large company in Melbourne. She loves the idea of sharing her knowledge and giving back to the industry but doesn't know where to start.

• Sarah is a freelance designer who works in website design. She would love to expand her network within the tech industry but is unsure of where or how to start. 

• Alex is currently learning to code online in his spare time. He is struggling with databases and would like help from a mentor to learn more about it one on one.

• Javascript Developer - Alicia is a mid-level Javascript developer who has a few years experience working for a start-up. She currently works 3 days a week and loves the idea of supplementing her income by teaching code. She isn't a qualified teacher but has amazing skills in the area of Javascript. She would love to improve her communication and managing skills to help her move up in her own career.

*NB: Also created user stories during this session, but have moved these down into question 15 of the SAQs.*

**User flow**

• Wireframes
• ERD

**Ethical Considerations:**

• User reviews
• Code of conduct
• Code of conduct violations

*Charging People with Stripe and Getting People Paid*
Charging people and paying others: Stripe used to have a way to do this with someone's band card but even then we would be storing people's bank cards. It looks like Stripe Connect sorts all this out for you - user verification, selling, etc.
In terms of people being happy to mentor for no charge, it may be that their button is just one to make a booking and doesn't talk to Stripe, so Stripe connect is only involved if people wish to charge for their services. That way people only have to sign up for a Stripe seller account if they want to make money using the service. Looks like the standard service is the one that would work best for us - doesn't cost anything extra and integration is apparently pretty easy. Given that our user base is tech people, they should be tech savvy enough to create a Stripe account if they want to charge for their services on the platform. 

Chatted as a team and decided to implement Stripe Connect for any payments over 50c (and mentors will need to have a Stripe Account to be paid). If they choose not to be paid, the button to book them will be a standard rails button, not a Stripe button. (The is also good as you won't have to enter card details and be charged 50c if they mentor doesn't want to be paid.)

- added a stripe charge id to bookings table
- added a stripe user id to mentors table for when they authorise their account (we only support standard Stripe accounts - they require us to take the least responsibility which is good because we are new developers)

Info for Mentors Signing up:
- That they’ll need to create and maintain their Stripe account.
- That they’ll need to handle chargebacks and all customer service issues.
- Who is responsible for paying the Stripe fees.
- What, if any, fees the platform charges.


## Short Answer Questions

---

## 1. What is the need (i.e. challenge) that you will be addressing in your project?

MyMentor is addressing the need for flexible mentorship within the technology industry in Melbourne. Our challenge is to provide a service which connects individuals who are seeking mentorship with skilled professionals. To address this need, our solution must provide users with a platform which effectively facilitates this process.

## 2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?

MyMentor is a platform that bridges mentors and mentees in the technology industry together. MyMentor is the solution to the lack of mentorship services outside trading hours. There are many mentees seeking mentors to develop their hard skills, soft skills and cultural understanding, whereas mentors can improve their soft skills and a means to give back to the community.
<!-- MyMentor may expand to other industries -->

## 3. Describe the project will you be conducting and how your App will address the needs.

MyMentor will connect a mentor and mentee through bookings. Users will be able to signup and explore the plethora of mentors and book a mentor that is suitable. Mentors have the freedom to charge their mentees depending on their purpose. Mentees have the option to mentor, and mentors can forfeit their positions.

## 4. Describe the network infrastructure the App may be based on.

Heroku is a service that delivers apps for developers that focuses on handling the hardware and server elements. One of the benefits of Heroku is that it provides a PostgreSQL database for the user which is both secure and scalable. Furthermore, there is a healthy variety of powerful add-ons that can be utilized to help their users. All in all, Heroku is a hosting platform whose sole purpose is to allow their users to focus primarily on their apps.

## 5. Identify and describe the software to be used in your App.

We have used a Ruby on Rails tech stack and included several libraries and gems. The basic stack is:

Ruby on Rails
Ruby
SCSS and CSS
HTML

We also used the Bootstrap library, including a small amount of Jquery for the hamburger menu the app has in small viewing windows.

*Ruby Gems we added (in order listed in Gemfile)*
dotenv-rails: allows environment variables to be stored in a .env file so that the Rails server can load them when it boots up and they are available for the code during runtime.

aws-sdk-s3: provides interface with the AWS bucket that user profile images are kept in.

bootstrap: provides access to the Bootstrap library by importing it and making it available to style the app.

jquery-rails: the bootstrap gem is dependent on this jquery-rails gem, so both need to be in the Gemfile.

stripe: library for integrating with the Stripe platform

httparty: library for making http requests which we use to make an http request to the Stripe API

json: the httparty gem depends on the json gem to parse json, so it is included

devise: this gem provides user authentication, i.e. allows users to sign in, and provides a library for resetting passwords via email links and so on, as per standard user requirements in an app. We have done several customisation around the devise standard user sign-up, including customising the params required for signup and adjusting the back end as well as styling the form on the front end using a customised Bootstrap theme.

## 6. Identify the database to be used in your App and provide a justification for your choice.

We chose PostgreSQL as our database because it provides a rich variety of data types and handles large amounts of data very efficiently, even with complex queries. It is also open-source, therefore free and supported by a strong community. However, with its extensive features, it may be an excessive database for simpler queries. Many users have reported the documentation to be lacking and needs improvement. 

## 7. Identify and describe the production database setup (i.e. postgres instance).

Simon

## 8. Describe the architecture of your App.

Our app follows the classic Model-View-Controller architecture of Rails Apps. 

*Models*

We have the following Models: booking, mentor, review, search and user.

*Views*

We have limited the views in our app as much as possible, both to make development easier by having few pages to style and to make using the app a better experience for users by allowing them to see associated information on the same page, rather than having to click through to see bookings with a particular mentor. This means that our views largely centre around the user and mentor models.

*Controllers*




## 9. Explain the different high-level components (abstractions) in your App.

Simon

## 10. Detail any third party services that your App will use.

MyMentor makes use of the 3rd party payment system Stripe in order to allow mentors to be paid for their time. We have created a Stripe Connect platform for our app. In the app, mentors have the option of linking their Stripe account to ours, allowing card payments made on the app to be directed to them. Extensive details on this process, and the reasoning for the choices we made in implementation, are detailed in this blog series: 

[Integrating Stripe with Rails - link to part 1/3](https://medium.com/@nimmoking/integrating-stripe-connect-with-rails-5-part-1-3-a3007e4bc2cf)

[Integrating Stripe with Rails - link to part 2/3](https://medium.com/@nimmoking/integrating-stripe-connect-with-rails-5-part-2-3-c3fbe7360750)

[Integrating Stripe with Rails - link to part 3/3](https://medium.com/@nimmoking/integrating-stripe-connect-with-rails-5-part-3-3-51f2cacb163d)

MyMentor also makes use of the transactional email API service MailGun, which allows emails to be automatically sent by the app. We are sending transactional emails for both paid and free sessions, containing the booking information and emails of the mentor and mentee, allowing them to determine the details of the booking. MailGun provides a sandbox domain which you can use to test the mailing feature, but this only works to send to authorised email addresses. In order to get MailGun working in production for any email a user wishes to sign up with, we registerd a domain owned by a team member with MailGun and configured the DNS settings to allow mail to be sent to any user email in the database.

## 11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

Corey

## 12. Discuss the database relations to be implemented.

The Mentor table has a foreign key of user_id that references the User table. The Booking table is a self join on the id of the user table, with one side of the join labelled mentor_id and the other mentee_id, i.e. a user can be a mentor or a mentee at different times in their use of the app, but they will always be a user.

## 13. Describe your project’s models in terms of the relationships (active record associations) they have with each other.

The Mentor table is associated with the User table with user_id reference as it serves to hold additional information about the user. The Booking table is a self-joining table that holds two user_ids from the User table, one from the mentee and the other from the mentor (both are users). 

## 14. Provide your database schema design.

*Database Schema - Initial*
Green tables are our MVP, red tables are the beginnings of a plan for some additional features we hope to get to.
![Database Schema - Initial](readme-assets/MentorMe_Database.png)

*Database Schema - Final*

## 15. Provide User stories for your App.

**User Stories:**

*MVP*

As a user I should be able to:
- Log-in
- Create a profile with a profile image, username, description, purpose for using the app
- View other user's profiles
- Have the option to pay for a booking/receive payment

*Extras*

- Book a time with a mentor/provide my availability as a mentor
- Message other users about bookings

## 16. Provide Wireframes for your App.

EVERYONE

## 17. Describe the way tasks are allocated and tracked in your project.

During Sprint Planning at the start of the project we created tasks on our team trello board. Each morning during the stand-up, team members choose what they would like to work on and the task is allocated to them on Trello and moved to the 'Doing' list. At the end of the day we come together and assess the progress of the items as a team, deciding which ones are ready to go in the 'Done' list and which should remain for the following day.

Sometimes we choose to pair or mob program, especially for crucial components of the app design. We prefer to work together in person, so sometimes once someone chooses a task, either or both remaining team members choose to join them on the task because they are also interested and would like to use the opportinity to work on it together to learn.

## 18. Discuss how Agile methodology is being implemented in your project.

Agile was implemented in our projects in the form of scrum and kanban. We communicated daily face to face and also through [slack](#slack).

At the beginning, we decided to implement a scrum master who is responsible for steering the direction of our app. Vanessa was assigned scrum master because of her skills and experience. Morning stand-ups was routine, which consisted of what the team member had accomplished, what they were currently working on and their challenges. Finally, we implemented user stories to help determine the who's, what's and why's of our app which can be seen [here](#15.-provide-user-stories-for-your-app)

Kanban was essential to visualize our workflow. We used [Trello](#trello) in our project, and have divided the the workflow into "To do", "Doing", "Design", "Build", "Deploy" and "Done". 

## 19. Provide an overview and description of your Source control process.

Our git workflow can be viewed [here](#git-workflow).

[Github organization](https://github.com/mentorapp/railsapp)

## 20. Provide an overview and description of your Testing process.

**Testing in Development**



**Testing in Production**

We deployed at least once every day, and this provided us with the opportunity to test new features in production as they were going up and resolve the inevitable bugs. On the first few days we deployed late in the afternoon, but we soon learned that this didn't give us enough time to work through the deployment issues before finishing for the day. From mid way through the process we deployed either in the morning or early afternoon and did manual testing on the app.

**Testers from outside the team**
*Beta Testing*

We asked several people to give the app a try throughout the build process, and their experiences are detailed here.

*1st Tester - Anhar - Friday Week 1*

![Discussion from Slack](readme-assets/anhar-beta-test.png)

Anhar very kindly ran through the signup process on Friday and found a bug - if you added a photo the AWS bucket wasn't working. This was because it didn't have a proper card to charge things to (even though the service we are using is free AWS wants to know they could charge you if you ended up using one of the non-free ones). Once this was fixed users were able to upload photos again.

Feedback from other beta testers:
*Industry Expert*
- Logout button is normally on right hand side

*Beginner experimenting with the tech industry*
- Tested the Heroku app (so production version)
- Default kitten picture is great
- Interface is intuitive - she was able to click around and find mentors and a booking interface and make a booking
- Liked that you could see on your info page any reviews you had given
- Felt that there could be more info on the splash page - at the moment it isn't clear what sort of mentoring the app is for - tech? Any? Other?
- Started typing on the login screen before realising it wasn't the signup screen
- Email worked for her email - see screenshot

![Email to second tester](readme-assets/mailgun-email-example.png)

*Educated average user*
- Tested the Heroku app
- Homepage needs info
- Mentors page still has lorem ipsum
- Search didn't work at all in Heroku
- My Info page didn't load in Heroku (didn't check it before we booked a session - it may have something to do with the bookings)
- All links on Contact page worked
- Was expecting to receive an email about having created an account
- Picking a time was difficult to do with that interface
- Confirmation email had no information about the date and time selected
- Started typing in the login screen before realising they needed to signup NB: this was an issue for two testers, perhaps move sign up button to top of page, or have  separate signup link, or have signup as the default on this page when the app is new

*Industry rails coder*
- Tested on localhost
- Also found the lack of information available without logging in a bit odd
- Found two errors in the search function - if there are no mentors matching that name it errors out, and the advanced search errors out
- Not enough information about what the app is

*Industry senior dev*
- Tested on localhost
- Same issue with lack on information in the app
- Contact page - main heading needs to be more distinct as it isn't clear that it is the point of the page
- Mentor cards alignment gets thrown out by a longer description

## 21. Discuss and analyse requirements related to information system security.

Simon

## 22. Discuss methods you will use to protect information and data.

- Utilise Stripe as our payment management system for bookings to ensure that our user's payment data is encrypted and secured. 
- Require account authentication in order for users to be granted access to view Mentor's profiles.
- Only collect the minimum data required from users to create an account and use our service.
- Provide users with full ability to edit and delete their data stored within the app (with the exception of past bookings which are stored in-case of legal implications)
- Never release any user data to external third parties

## 23. Research what your legal obligations are in relation to handling user data.

Simon

**Accessibility**
 <!-- <span class="sr-only">(current)</span> -->

## Design Planning

---

**Brand Attributes**

inspiration, collaboration, networking
aspirational tone

edgy

ask-anyone

**Brand references**

Airbnb, TaskRabbit

**Target Demographic**

mid-20s to mid-30s is average mentee user - students and career changers

intelligent
connected
tech-savvy (they care about auto-complete on forms, and will probably try putting bad data in just to see what it does)

**Colour and Imagery**
1 primary colour, maybe a few secondary colours

urban influence with a focus on people - connecting people - all imagery needs to focus on

## Inspiration

Once we were clear on our brand attributes and on wanting to use Bootstrap to make the detailed styling easier, we looked for websites that had the feel that we were after. We all ended up really liked websites with a salmon accenting, so found it pretty straightforward to head in that direction with the design.

**Websites**

[Mentor Loop](https://mentorloop.com/mentorloop-software-demo/)

[Open Listings](https://www.openlistings.com/)

**Images**

[Link to Gurafiku](http://gurafiku.tumblr.com/post/92043420892/japanese-exhibition-poster-hokusai-x-sumida)

[Link to General Provision Icon Set](https://dribbble.com/shots/5467660-General-Provision-Icon-Set)

**Figma Wireframes**

[Link to Figma Wireframes](https://www.figma.com/file/dtqQpWpmlBnaKRn9v5MH5xvh/MentorMe?node-id=0%3A1)


## Team Communication
---

We elected to work in person for the majority of the time, confining our required hours to the standard 9-5. This meant that in addition to the morning standup we talked regularly throughout the day, ensuring our local repos were up to date and that we were making good use of branches and of our time. We also used pair and mob programming on particularly tricky parts of the project.

## Trello

We found the Trello board helpful for keeping track of where we were in the project, and for keeping track of who was working on what. As people elected to work on tasks Vanessa assigned them to the Trello cards, and cards were moved across to 'Doing' and 'Done' by either the team member working on them or by Vanessa.

*Day 1 Trello Board*
![Day 1 Trello Board](readme-assets/day-1-trello.png)

*Day 2 Trello Board*
![Day 2 Trello Board](readme-assets/day-2-trello.png)

*Day 3 Trello Board*
![Day 3 Trello Board](readme-assets/day-3-trello.png)

*Day 4 Trello Board*
![Day 4 Trello Board](readme-assets/day-4-trello.png)

*Day 5 Trello Board*
![Day 5 Trello Board](readme-assets/day-5-trello.png)

*Day 6 Trello Board*
![Day 6 Trello Board](readme-assets/day-6-trello.png)

## Slack

*Day 1 Slack Channel*
![Day 1 Slack Channel](readme-assets/day-1-slack.png)

*Day 2 Slack Channel*
![Day 2 Slack Channel](readme-assets/day-2-slack.png)

*Day 3 Slack Channel*
![Day 3 Slack Channel](readme-assets/day-3-slack.png)

*Day 4 Slack Channel*
![Day 4 Slack Channel](readme-assets/day-4-slack.png)

*Day 5 Slack Channel*
![Day 5 Slack Channel](readme-assets/day-5-slack.png)

*Day 6 Slack Channel*
![Day 6 Slack Channel](readme-assets/day-6-slack.png)

*Day 7 Slack Channel*
![Day 7 Slack Channel](readme-assets/day-7-slack.png)

<!-- Our database consists of 4 tables. A User table that stores the user's 'Username', 'Purpose' and 'About me' on top of rails' conventional parameters. Additional information is stored in a Mentor table which includes 'Skills', 'Availability' and 'Price' when a user decides to be a mentor. These parameters are important because they will determine whether a mentor is suitable for the user's objective. -->

# Authentication Testing

Question: do we need pundit?
Answer: doesn't look like we do at the moment, as there are so few pages that need authorisation.

User/:id page - no matter what id you put into the address bar, it still just shows you yours because it gets the info by current_user.id.

User/edit - requires the current password of the user who is trying to be changed in order to save any changes.

Stripe connect: someone would need our secret API key to get a stripe_user_id and connect it to our payment account, so this is pretty well-authorised.

Mentors edit page: you can currently access any mentor edit page by using mentor/:id/edit - need to include some user checks on this one. 
Update: there is now a check that the logged in user is the one who is the mentor that they are trying to edit. If they are not, they get redirected to their own user profile with a notice saying they are not allowed to edit this profile.

If you aren't logged in the navbar just looks like a bunch of empty divs in html - Rails has effectively hidden the links.