Feature: Crypto Currency
    In order to a list of crypto currency balance
    As a user
    I want to know the price variation of each crypto currency

    Scenario: Search Crypto Currency
        Given a list of crypto currency
        When search the name of a crypto
        Then show this crypto currency on the screen
        And search the crypto icon on internet
        And save this path on a cache
    
    Scenario: No connection
        Given the user was no connection
        When try to loading the list of crypto currency
        Then show a error message to the user
    
    

    