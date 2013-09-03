Feature: PluggableJs
  In order to use some page specific javascript
  I want to visit different pages and see different working scripts

  @javascript
  Scenario: Posts List
    When I go to list of posts
    Then I should see 'My life for aiur!'
    And I should not see 'You wanna piece of me, boy?'

  @javascript
  Scenario: New Post
    When I go to new post
    Then I should see 'You wanna piece of me, boy?'
    And I should not see 'My life for aiur!'
