Feature: Driver does preliminary registration

  Background: Setup injection
    Given injection is setup
  After:
    Then clean up

  Scenario Outline: Driver fails to register
    Given the app is on page {'/registration-page'}
    And I see {'first_name_field'}
    And I see {'last_name_field'}
    And I see {'phone_number_field'}
    And I see {'email_field'}
    And I see {'password_field'}
    When I enter <first_name> into {'first_name_field'} input field
    And I enter <last_name> into {'last_name_field'} input field
    And I enter <phone_number> into {'phone_number_field'} input field
    And I enter <email> into {'email_field'} input field
    And I enter <password> into {'password_field'} input field
    And I tap {'REGISTER_BUTTON'}
    Then I see <error_message> text
    Examples:
      | first_name | last_name | phone_number | email                  | password         | error_message                   |
      | ''         | 'Tuha'    | '909525760'  | 'anwartuha2@gmail.com' | 'helloWorld@101' | 'Can\'t be empty'     |
      | 'Anwar'    | ''        | '909525760'  | 'anwartuha2@gmail.com' | 'helloWorld@101' | 'Can\'t be empty' |
      | 'Anwar'    | 'Tuha'    | ''           | 'anwartuha2@gmail.com' | 'helloWorld@101' | 'Can\'t be empty'     |
      | 'Anwar'    | 'Tuha'    | '909525760'  | ''                     | 'helloWorld@101' | 'Can\'t be empty'     |
      | 'Anwar'    | 'Tuha'    | '909'        | 'anwartuha2@gmail.com' | ''               | 'Can\'t be empty'       |

  Scenario Outline: Driver registers successfully
    Given the app is on page {'/registration-page'}
    And I see {'first_name_field'}
    And I see {'last_name_field'}
    And I see {'phone_number_field'}
    And I see {'email_field'}
    And I see {'password_field'}
    When I enter <first_name> into {'first_name_field'} input field
    And I enter <last_name> into {'last_name_field'} input field
    And I enter <phone_number> into {'phone_number_field'} input field
    And I enter <email> into {'email_field'} input field
    And I enter <password> into {'password_field'} input field
    And I tap {'REGISTER_BUTTON'}
    Then I see {'POD_PAGE_KEY'}
    Examples:
      | first_name      | last_name | phone_number | email                  | password          |
      | 'Anwar'         | 'Tuha'    | '909525760'  | 'anwartuha2@gmail.com' |  'helloWorld@101' |