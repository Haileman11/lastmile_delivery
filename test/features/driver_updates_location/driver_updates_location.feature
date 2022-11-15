Feature: Driver updates location

  As a Delivery driver
  I want to update my location regularly
  So that  I can receive orders that are in my proximity

  Scenario: Driver fails to update location
    Given injection is setup
    And driver availability is {false}
    Then user location data is not updated

  Scenario: Driver successfully updates location
    Given driver availability is {true}
    Then user location data is updated