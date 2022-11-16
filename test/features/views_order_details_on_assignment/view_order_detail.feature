
Feature: View order request details
    As a delivery driver
    I want to view details of an order when it comes
    So that I can decide whether to accept it or reject it

    Background: Setup injection
        Given injection is setup
    After: 
        Then clean up after the test    
    
    Scenario: Driver can see the order request modal when assigned an order
        Given driver availability is {true}        
        And the app is on {'/'}
        Then driver is assigned an order
        And I see {"ORDER_ASSIGNMENT_PAGE"}