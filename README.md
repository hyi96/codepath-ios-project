Reference: [unit 5 slides](https://docs.google.com/presentation/d/1xnxamZ29ASoK027LJd0Cc15Ve-gHo1UJkkZkZHmtDvo/edit#slide=id.gf82d3a484c_0_98)

# RateMyProf@UCSB

## Table of Contents
1. [Overview](#Overview)
3. [Product Spec](#Product-Spec)
4. [Wireframes](#Wireframes)
5. [Schema](#Schema)


## Overview
### Description
RateMyProf@UCSB is an app where users can flexibly search for the reviews of professors and the courses they teach. Students can use it as a guide for selecting classes and avoiding terrible professors.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** educational, productivity, entertainment
- **Mobile:** iOS
<<<<<<< HEAD
- **Story:** compare professors teaching the same course, departmental/school-wide ranking of professors., comment on a professor or on one of the courses they teach
- **Market:** UCSB Student
- **Habit:** Students would use this app most frequently during the times when they are selecting classes for a new quarter
- **Scope:** The app initially only has professors in UCSB, but perhaps later we can add other universities

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* users can look up the ratings and comments of the professors 
* users can sort rating by date, course
* users can rate professors by course
* users can view key words of a rated professor

**Optional Nice-to-have Stories**

* users can compare a professors's rating with the average teaching rating of the same class
* Users can compare a professors's rating with the average rating of the department
* users can visualize the comparison statistics
* users can view professors with top ratings in a department or a class


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
[Add picture of your hand sketched wireframes in this section]
![WechatIMG78](https://user-images.githubusercontent.com/49249770/141714902-1891f212-6e5d-4743-bbf7-7643c80c542a.jpeg)


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models
#### Professor
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| name          | String   | professor's name                           |
| overallrating | Number   | professor's overall rating                 |
| ranking       | Number   | professor's ranking in their department    |
| department    | String   | department the professor belongs to        |
| ratingData    | Array    | an array containing all the comments       |
#### Comment/Rating
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| author        | String   | username of user who posts the comment     |
| text          | Number   | text content of the comment                |
| date          | DateTime | date when the comment is posted            |
| course        | String   | Name of the course                         |
| difficulty    | Number   | scale from 0 to 5, 0 being the easiest     |
| courseRating  | Number   | scale from 0 to 5, 5 being the best        | 
| upvoteCount   | Number   | number of upvotes the comment receives     |
| downvoteCount | Number   | number of downvotes the comment receives   | 

### Networking
* Search Screen
    * search by name bar
    * optional department field
* Department list screen
    * open professor list
* Professor list screen
    * open professor profile screen
* Professor profile screen
    * get the professor's info
    * give rating
    * open comment section
* Comment screen
    * get all past comments on this professor
    * add a comment
