{
  "id": "mock-idp",
  "realm": "mock-idp",
  "displayName": "Mock Oakland IdP",
  "enabled": true,
  "sslRequired": "external",
  "registrationAllowed": false,
  "loginWithEmailAllowed": true,
  "duplicateEmailsAllowed": false,
  "resetPasswordAllowed": false,
  "editUsernameAllowed": false,
  "accessTokenLifespan": 300,
  "ssoSessionIdleTimeout": 1800,
  "ssoSessionMaxLifespan": 36000,
  "defaultSignatureAlgorithm": "RS256",
  "browserSecurityHeaders": {
    "xFrameOptions": "SAMEORIGIN",
    "xContentTypeOptions": "nosniff"
  },
  "components": {
    "org.keycloak.keys.KeyProvider": [
      {
        "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567800",
        "name": "rsa",
        "providerId": "rsa",
        "subComponents": {},
        "config": {
          "privateKey": [
            "__MOCK_IDP_RSA_PRIVATE_KEY__"
          ],
          "certificate": [
            "__MOCK_IDP_CERT__"
          ],
          "keyUse": [
            "SIG"
          ],
          "priority": [
            "100"
          ],
          "algorithm": [
            "RS256"
          ]
        }
      }
    ]
  },
  "clients": [
    {
      "id": "b2c3d4e5-f6a7-8901-bcde-f01234567801",
      "clientId": "https://keycloak.zeroverify.net/realms/zeroverify",
      "name": "ZeroVerify SP",
      "description": "ZeroVerify Keycloak acting as SAML service provider",
      "enabled": true,
      "protocol": "saml",
      "redirectUris": [
        "https://keycloak.zeroverify.net/realms/zeroverify/broker/mock-idp/endpoint"
      ],
      "attributes": {
        "saml.assertion.signature": "true",
        "saml.server.signature": "true",
        "saml.force.post.binding": "true",
        "saml.client.signature": "false",
        "saml.encrypt": "false",
        "saml.authnstatement": "true",
        "saml_assertion_consumer_url_post": "https://keycloak.zeroverify.net/realms/zeroverify/broker/mock-idp/endpoint",
        "saml_name_id_format": "email"
      },
      "protocolMappers": [
        {
          "id": "c3d4e5f6-a7b8-9012-cdef-012345678801",
          "name": "eppn",
          "protocol": "saml",
          "protocolMapper": "saml-user-attribute-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:1.3.6.1.4.1.5923.1.1.1.6",
            "attribute.nameformat": "URI Reference",
            "user.attribute": "eppn",
            "friendly.name": "eduPersonPrincipalName"
          }
        },
        {
          "id": "d4e5f6a7-b8c9-0123-def0-123456789801",
          "name": "enrollment-status",
          "protocol": "saml",
          "protocolMapper": "saml-user-attribute-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:1.3.6.1.4.1.5923.1.1.1.1",
            "attribute.nameformat": "URI Reference",
            "user.attribute": "enrollment_status",
            "friendly.name": "eduPersonAffiliation"
          }
        },
        {
          "id": "e5f6a7b8-c9d0-1234-ef01-234567890801",
          "name": "given-name",
          "protocol": "saml",
          "protocolMapper": "saml-user-property-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:2.5.4.42",
            "attribute.nameformat": "URI Reference",
            "property": "firstName",
            "friendly.name": "givenName"
          }
        },
        {
          "id": "f6a7b8c9-d0e1-2345-f012-345678901801",
          "name": "family-name",
          "protocol": "saml",
          "protocolMapper": "saml-user-property-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:2.5.4.4",
            "attribute.nameformat": "URI Reference",
            "property": "lastName",
            "friendly.name": "sn"
          }
        },
        {
          "id": "a7b8c9d0-e1f2-3456-0123-456789012801",
          "name": "email",
          "protocol": "saml",
          "protocolMapper": "saml-user-property-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:0.9.2342.19200300.100.1.3",
            "attribute.nameformat": "URI Reference",
            "property": "email",
            "friendly.name": "mail"
          }
        }
      ]
    }
  ],
  "users": [
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123801",
      "username": "testuser",
      "email": "testuser@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Test",
      "lastName": "User",
      "attributes": {
        "eppn": ["testuser@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "password",
          "temporary": false
        }
      ]
    }
  ]
}
