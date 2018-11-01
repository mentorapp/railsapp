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

## Short Answer Questions

---

## 1. What is the need (i.e. challenge) that you will be addressing in your project?



## 2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?

## 3. Describe the project will you be conducting and how. your App will address the needs.

## 4. Describe the network infrastructure the App may be based on.

## 5. Identify and describe the software to be used in your App.

## 6. Identify the database to be used in your App and provide a justification for your choice.

Our database consists of 4 tables. A User table that stores the user's 'Username', 'Purpose' and 'About me' on top of rails' conventional parameters. Additional information is stored in a Mentor table which includes 'Skills', 'Availability' and 'Price' when a user decides to be a mentor. These parameters are important because they will determine whether a mentor is appropriate for the user's objective.

## 7. Identify and describe the production database setup (i.e. postgres instance).

## 8. Describe the architecture of your App.

## 9. Explain the different high-level components (abstractions) in your App.

## 10. Detail any third party services that your App will use.

## 11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

## 12. Discuss the database relations to be implemented.

The Mentor table has a foreign key of user_id that references the User table. The Booking table is a self join on the id of the user table, with one side of the join labelled mentor_id and the other mentee_id, i.e. a user can be a mentor or a mentee at different times in their use of the app, but they will always be a user.

## 13. Describe your project’s models in terms of the relationships (active record associations) they have with each other.

The Mentor table is associated with the User table with user_id reference as it serves to hold additional information about the user

## 14. Provide your database schema design.

*Database Schema - Initial*
Green tables are our MVP, red tables are the beginnings of a plan for some additional features we hope to get to.
![Database Schema - Initial](readme-assets/MentorMe_Database.png)

## 15. Provide User stories for your App.

**User Stories:**

*MVP*

As a user I should be able to:
• Log-in
• Create a profile with a profile image, username, description, purpose for using the app
• View other user's profiles, message other users
• Have the option to pay for a booking/receive payment

*Extras*

• Book a time with a mentor/provide my availability as a mentor

## 16. Provide Wireframes for your App.

## 17. Describe the way tasks are allocated and tracked in your project.

During Sprint Planning at the start of the project we created tasks on our team trello board. Each morning during the stand-up, team members choose what they would like to work on and the task is allocated to them on Trello and moved to the 'Doing' list. At the end of the day we come together and assess the progress of the items as a team, deciding which ones are ready to go in the 'Done' list and which should remain for the following day.

Sometimes we choose to pair or mob program, especially for crucial components of the app design. We prefer to work together in person, so sometimes once someone chooses a task, either or both remaining team members choose to join them on the task because they are also interested and would like to use the opportinity to work on it together to learn.

## 18. Discuss how Agile methodology is being implemented in your project.

## 19. Provide an overview and description of your Source control process.



## 20. Provide an overview and description of your Testing process.

## 21. Discuss and analyse requirements related to information system security.

## 22. Discuss methods you will use to protect information and data.

## 23. Research what your legal obligations are in relation to handling user data.

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

## Slack

*Day 1 Slack Channel*
![Day 1 Slack Channel](readme-assets/day-1-slack.png)

*Day 2 Slack Channel*
![Day 2 Slack Channel](readme-assets/day-2-slack.png)

*Day 3 Slack Channel*
![Day 3 Slack Channel](readme-assets/day-3-slack.png)

*Day 4 Slack Channel*
![Day 4 Slack Channel](readme-assets/day-4-slack.png)
