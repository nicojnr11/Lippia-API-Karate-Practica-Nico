Feature: Clockify - Academy - Lippia Karate

  Background: Url y Headers
    Given url 'https://api.clockify.me/api/v1'
    And header X-Api-Key = 'ZWFhNDM1NzgtOTAxYy00NWE2LThjZDgtMmEzZjBiNmUxYzk4'
    And header Content-Type = 'application/json'

  @Practica @ConsultaId
  Scenario Outline: Consultar proyecto por id.
    Given path 'workspaces','<workspaceId>','projects','<projectId>'
    When method GET
    Then status 200
    And match response.name == '<nameProject>'

    Examples:
      | workspaceId              | projectId                | nameProject  |
      | 628ceff638bc332cb91e6582 | 629fa4bb242893650e014b3c | KarateLippia |
