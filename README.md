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
- **Category:** educational, productivity, entertainment
- **Mobile:** iOS
- **Story:** compare professors teaching the same course, departmental/school-wide ranking of professors., comment on a professor or on one of the courses they teach
- **Market:** UCSB Student
- **Habit:** Students would use this app most frequently during the times when they are selecting classes for a new quarter
- **Scope:** The app initially only has professors in UCSB, but perhaps later we can add other universities

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* users can look up the ratings and comments of the professors 
* users can rate professors by course
* users can sort rating by date, course
* users can view key words of a rated professor

**Optional Nice-to-have Stories**

* users can compare professors's rating by courses
* Users can compare a professors's within department 
* users can visualize the comparison statistics
* users only acccess through UCSB Authetication 
* users has their own profile page
* comments include commentor's info (year, major, etc..)
* users has option to post comments anonumously


### 2. Screen Archetypes

* Login 
   * users login by UCSB NetID
* Seach 
   * search professors by name, department(optional)
* Department list
   * navigate to professor list in each department
* Professor list
   * list of professors under a department
* Professor Comments 
   * name, department, profile photo, key words
   * course selector (default overall) -> overall rating: quality, difficulty, would take again
   * comment lists: quality, difficulty, would take again, quarter taken, grade received, comments
* Add Comments 
   * select department, professors (if not add new)
   * select courses (if not add new)
   * quarter taken
   * grade received
   * ratings: quality, difficulty, would take again
   * 3 key workds
   * comments


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Search -> Professor profile
* Add Comments -> Add Comments -> Professor Comments
* Department list -> Department list -> Professor list -> Professor Comments

**Flow Navigation** (Screen to Screen)

* Log in -> sign up or log in or log in as guest -> Search 
* Search -> Professor Comments/Add Comments(no reviews)
* Department list -> Professor list -> Professor Comments -> Add Comments
* Add Comments -> Professor Comments



## Wireframes
[Add picture of your hand sketched wireframes in this section]
![WechatIMG78](https://user-images.githubusercontent.com/49249770/141714902-1891f212-6e5d-4743-bbf7-7643c80c542a.jpeg)


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models
#### Users
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| username      | String   | username                                   |
| password      | String   | password                                   |
#### Departments
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| deptID        | Number   | unique id for departments                  |
| deptName      | String   | departments' names                         |
| professorList | Array    | an array of Professors' ID in each dept    |
#### Professors
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| profID        | Number   | unique id for professors                   |
| profName      | String   | professors' name                           |
| deptName      | Relation | refer to the professors' department        |


#### Rates
| Property      | Type     | Description                                |
| ------------- |:--------:| ------------------------------------------:|
| rater         | Retation | refer to username                          |
| profName      | Relation | refer to profName                          |
| deptName      | Relation | refer to deptName                          |
| rates         | array    | [quality, difficulty, take_Again]          |
| keyword       | array    | list of 3 keyword given by rater           |
| comment       | String   | text content of the comment                |
| createdAt     | DateTime | date when post is created                  |
| updatedAt     | DateTime | date when post is updated                  |
| courseID      | Number   | unique id for courses                      |
| courseName    | String   | UCSB course code                           |
| grade         | String   | grade got for the course                   |
| difficulty    | Number   | scale from 0 to 5, 5 being the hardest     |
| quality       | Number   | scale from 0 to 5, 5 being the best        | 
| takeAgain     | Bool     | 1 being would take again, 0 conversely     | 
| upvoteCount   | Number   | number of upvotes the rating receives      |
| downvoteCount | Number   | number of downvotes the rating receives    | 



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
