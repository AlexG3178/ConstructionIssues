# Task 

Extend this app to display a list of issues for the foreman to review at a construction site. Create pull request at the end if work.

# Data 

Load list of issues JSON info UI. Retrieve JSON string using predefined [FileHelper.getIssuesJsonString()](../ConstructionIssues/ConstructionIssues/Utils/FileHelper.swift), that cannot be modified. It retrieves data from [sample file](../ConstructionIssues/ConstructionIssues/issues.json).

Issue properties:
```
ID
Subject
State
Status
CreatedBy
AssignedTo
DueDate
Priority
Description
Type
```

# Dashboard page 

This page is a starting page in the app and consists of: 

* Title - "My work"
* List of issues - row for each.
* Loading indicator – animated spinner which is shown while data is loading. 

List row consists of: 

* First line (from left to right)
    * **Critical icon**
        * Shown when issue "Priority" value is "1 - Critical".
        * Graphic - [critical.svg](critical.svg).
    * **Issue subject**
        * Horizontal spacing from critical icon should be 10.
    * **Expand button**
        * Aligned to the right.
        * Graphic - [chevron_down.svg](chevron_down.svg).
            * Expand - pointing down
            * Collapse - pointing up
        * Icon size 24x24.
* Second line.
    * **Description**
        * Only one line is visible. Trim with "..." if it does not fit.

Row content spacing from the edges:

* Top/bottom: 15
* Left/right: 30

When the user taps on **Expand button**, the row expands vertically with several changes: 

* **Description** is fully visible.
* **Due date** is now visible below the description.
* **Expand button** changes into **Collapse button**. Collapses the row when tapped. 
* Multiple rows can be expanded at the same time. 

Tapping on a list item - navigates to the details page for the selected issue. 

# Issue details page 

This page is supposed to display detailed issue information. 

There are no specific requirements - design the page in free form and keep it simple.

# Additional notes

Feel free to make decisions on UI design (if not described here) and architecture (use additional libraries, etc.)