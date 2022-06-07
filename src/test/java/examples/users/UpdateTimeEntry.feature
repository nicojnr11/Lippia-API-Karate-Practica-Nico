Feature: Clockify - Academy - Lippia Karate

  Background: Url y Headers
    Given url 'https://api.clockify.me/api/v1'
    And header X-Api-Key = 'ZWFhNDM1NzgtOTAxYy00NWE2LThjZDgtMmEzZjBiNmUxYzk4'
    And header Content-Type = 'application/json'

  @Practica @UpdateTimeEntry
  Scenario Outline: Editar un campo de algún registro de hora.
    * def responseAddTimeEntry = call read('classpath:examples/users/AddTimeEntry.feature')
    * def idTimeEntry = responseAddTimeEntry.id
    * def body = read('classpath:examples/users/Requests/Update_Time_Entry_rq.json')
    Given path 'workspaces','<workspaceId>','time-entries',idTimeEntry
    And request body
    When method PUT
    Then status 200

    Examples:
      | workspaceId              |
      | 628ceff638bc332cb91e6582 |













