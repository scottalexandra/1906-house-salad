# README
### This project implements the user story below using behavior driven development and declarative programming.

```
As a user
When I visit "/"
And I select "Colorado" from the dropdown
And I click on "Locate Members of the House"
Then my path should be "/search" with "state=CO" in the parameters
And I should see a message "7 Results"
And I should see a list of 7 the members of the house for Colorado
And they should be ordered by seniority from most to least
And I should see a name, role, party, and district for each member

```

### Setup
```
bundle
$ rails db:create
$ rails db:migrate
```

### Branches
- `feature-test` - Code for implementing the feature test and view
- `controller` - Code for implementing all of the functionality in the controller
- `service` - Code for refactoring the API call into a service
- `facade` - Code for implementing the facade pattern
