Feature: PluggableJs
  In order to use some page specific javascript
  I want to visit different pages and see different working scripts

  @javascript
  Scenario: Posts List
    When I go to list of posts
    Then I should see "My life for aiur!"
