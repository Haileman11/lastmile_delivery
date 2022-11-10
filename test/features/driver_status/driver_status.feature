Feature: Driver becomes online
    As a delivery driver
    I want to update my availability to online
    So that I can start recieving delivery orders

    Background: Setup injection
        Given injection is setup
    After: 
        Then clean up after the test

    @success
    Scenario: Switch is visible in homepage
        Given the app is on {'/'}
        Then I see {"AVAILABILITY_SWITCH"}
    
    @success
    Scenario: Switch is toggled to the availability status when app is opened
        Given driver availability is {true}        
        And the app is on {'/'}
        Then I see {"AVAILABILITY_SWITCH"}
        And Switch {"AVAILABILITY_SWITCH"} value is {true}    
    @success
    Scenario: Switch is toggled off when the availability is turned off    
        Given driver availability is {true}        
        And the app is on {'/'}
        And Switch {"AVAILABILITY_SWITCH"} value is {true}    
        When I tap {'AVAILABILITY_SWITCH'}
        And Switch {"AVAILABILITY_SWITCH"} value is {false}    
    @success
    Scenario: Switch is toggled on when the availability is turned on
        Given driver availability is {false}        
        And the app is on {'/'}
        And Switch {"AVAILABILITY_SWITCH"} value is {false}    
        When I tap {'AVAILABILITY_SWITCH'}
        And Switch {"AVAILABILITY_SWITCH"} value is {true}    
            
        
