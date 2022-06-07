Feature: Clockify - Academy - Lippia Karate

  Background: Url y Headers
    Given url 'https://api.clockify.me/api/v1'
    And header X-Api-Key = 'ZWFhNDM1NzgtOTAxYy00NWE2LThjZDgtMmEzZjBiNmUxYzk4'
    And header Content-Type = 'application/json'

  @Practica @DeleteEntry
  Scenario Outline: Eliminar hora registrada.
    * def responseAddTimeEntry = call read('classpath:examples/users/AddTimeEntry.feature')
    * def idTimeEntry = responseAddTimeEntry.id
    Given path 'workspaces', '<workspaceId>' , 'time-entries' , idTimeEntry
    When method DELETE
    Then status 204

    Examples:
      | workspaceId              |
      | 628ceff638bc332cb91e6582 |













