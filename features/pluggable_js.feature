Feature: PluggableJs
  In order to use some page specific javascript and pass some data
  I want to visit different pages and see appropriate content

  @javascript
  Scenario Outline: Posts List
    When I go to posts '<action>'
    Then I should see content with '<data_type>'
    And I should not see 'You wanna piece of me, boy?'

  Examples:
    | action | data_type |
    | index  | string    |
    | search | integer   |
    | index  | boolean   |
    | search | array     |
    | index  | hash      |

  @javascript
  Scenario: New Post
    When I go to new post
    Then I should see 'You wanna piece of me, boy?'
    And I should not see 'My life for aiur.'
