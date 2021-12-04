# RateMyProf@UCSB

## Table of Contents
1. [Overview](#Overview)
3. [Product Spec](#Product-Spec)
4. [Wireframes](#Wireframes)
5. [Schema](#Schema)
6. [Video](#Video-Walkthrough)


## Overview
### Description
RateMyProf@UCSB is an app where users can flexibly search for the reviews of professors and the courses they teach. Students can use it as a guide for selecting classes and avoiding terrible professors.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** educational, productivity, entertainment
- **Mobile:** iOS
- **Story:** compare professors teaching the same course, departmental/school-wide ranking of professors., comment on a professor or on one of the courses they teach
- **Market:** UCSB Student
- **Habit:** Students would use this app most frequently during the times when they are selecting classes for a new quarter
- **Scope:** The app initially only has professors in UCSB, but perhaps later we can add other universities

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

 - [x] users can login 
 - [x] users can look up the ratings and comments of the professors 
 - [x] users can rate professors 
 - [x] users can add professors to departments

 **Optional Nice-to-have Stories**

 - [ ] users can sort rating by date, course
 - [ ] users can compare professors's rating by courses
 - [ ] Users can compare a professors's within department 
 - [ ] users can visualize the comparison statistics
 - [ ] users only acccess through UCSB NetID
 - [ ] comments include rater's info (year, major, etc..)
 - [ ] users has option to post comments anonumously

### 2. Screen Archetypes

* Login
   * user can either login as guest or sign up for a new account
* seach screen
   * provides a search bar for direct searching using keywords
* category screen
   * sort professors by department.
* Professor profile screen
   * overall rating
   * ranking in department/in major
   * courses taught
   * comment section

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* search
* category view

**Flow Navigation** (Screen to Screen)

* log in -> sign up or log in or log in as guest -> jumps to search screen
* search -> enter key words -> shows a drop down menu of suggestions -> click a suggestion -> enter selected professor's profile screen
* professor profile screen -> text field to enter a comment
* category view -> shows a table of departments -> click any department and shows a list of professors ranked by their ratings


## Wireframes

![WechatIMG78](https://user-images.githubusercontent.com/49249770/141714902-1891f212-6e5d-4743-bbf7-7643c80c542a.jpeg)


### [BONUS] Digital Wireframes & Mockups

<img width="694" alt="Screen Shot 2021-11-20 at 11 07 01 AM" src="https://user-images.githubusercontent.com/49249770/142738250-5e6626b1-8331-49db-b626-e5a50bd6391c.png">

### [BONUS] Interactive Prototype
![ezgif-7-42a1f9cb951c](https://user-images.githubusercontent.com/49249770/143567211-2fd044eb-df88-4341-b1a4-e2063b627b23.gif)


## Schema 
### Models
#### User
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| username      | String   | username                                   |
| password      | String   | password                                   |
#### Department
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| username      | String   | username                                   |
| password      | String   | password                                   |
| professorArray| Array    | an array of Professors' objectIds
#### Professor
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| name          | String   | professor's name                           |
| overallRating | Number   | professor's overall rating                 |
| department    | Relation | points to the professor's department       |
| ratingArray   | Array    | an array of Ratings' objectIds             |
#### Rating
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| author        | Retation | points to the user that gives the rating   |
| professor     | Relation | points to the professor                    |
| comment       | String   | text content of the comment                |
| date          | DateTime | date when the comment is posted            |
| course        | String   | Name of the course                         |
| difficulty    | Number   | scale from 0 to 5, 0 being the easiest     |
| score         | Number   | scale from 0 to 5, 5 being the best        | 
| upvoteCount   | Number   | number of upvotes the rating receives      |
| downvoteCount | Number   | number of downvotes the rating receives    | 

### Networking
* Search Screen
     * (Read/GET) Query ratings where professor name is profName, department name is deptNmae (optional)
     ```swift
     let query = PFQuery(className:"ratings")
     query.whereKey("profName", equalTo:"...")
     query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
       if let error = error {
           // Log details of the failure
           print(error.localizedDescription)
       } else if let ratings = ratings {
           // The find succeeded.
           print("Successfully retrieved \(objects.count) scores.")
           // Do something with the ratings
           }
       }
     }
     ```
 * Department List Screen
     * (Read/GET) Query list of departments in the selected department
 * Professor List Screen
 @@ -145,5 +160,34 @@ RateMyProf@UCSB is an app where users can flexibly search for the reviews of pro
     * (Read/GET)Query comments page of the selected professor
     * (Update/PUT) Update ratings and comments by course filter
     * (Update/PUT) Upvote or downvote for a comment
     ```swift
     let query = PFQuery(className:"upvoteCount")
     query.getObjectInBackground(withId: "...") { (vote: PFObject?, error: Error?) in
         if let error = error {
             print(error.localizedDescription)
         } else if let vote = vote {
             vote["upvoteCount"] = ...
             vote["downvoteCount"] = ...
             vote.saveInBackground()
         }
     }
     ```
 * Add Comments Screen
     * (Creat/POST) Create a new comments for the professor
     ```swift
     let newRating = PFObject(className:"ratings")
     newRating["profName"] = ...
     newRating["deptName"] = ...
     newRating["courseName"] = ...
     newRating["ratings"] = ...
     ...
     newRating.saveInBackground { (succeeded, error)  in
         if (succeeded) {
             // The object has been saved.
         } else {
             // There was a problem, check error.description
         }
     }
     ```


## Video-Walkthrough
Here's a walkthrough of our latest progress:

<img src="https://i.imgur.com/CV9rP9F.gif" title='Video Walkthrough' width='' alt='Video Walkthrough' />



