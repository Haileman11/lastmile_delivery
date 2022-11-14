Feature: Driver updates location

  As a Delivery driver
  I want to update my location regularly
  So that  I can receive orders that are in my proximity

  Scenario: Driver fails to update location
    Given injection is setup
    And socket connection is {'INACTIVE'}
    Then user location data is not updated

  Scenario: Driver successfully updates location
    Given injection is setup
    And socket connection is {'ACTIVE'}
    Then user location data is updated