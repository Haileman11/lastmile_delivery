Feature: Google maps integration
  Scenario: Google maps is rendered successfully
    Given injection is setup
    And the app is on page {'/home-page'}
    Then I see {'GOOGLE_MAPS_WIDGET'}