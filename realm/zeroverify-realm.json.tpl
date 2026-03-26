{
  "id": "zeroverify",
  "realm": "zeroverify",
  "displayName": "ZeroVerify",
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
        "id": "f47ac10b-58cc-4372-a567-0e02b2c3d479",
        "name": "rsa",
        "providerId": "rsa",
        "subComponents": {},
        "config": {
          "privateKey": [
            "__REALM_RSA_PRIVATE_KEY__"
          ],
          "certificate": [
            "__REALM_RSA_CERT__"
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
      "id": "a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11",
      "clientId": "zeroverify-wallet",
      "name": "ZeroVerify Wallet",
      "description": "Wallet application OIDC client",
      "enabled": true,
      "publicClient": true,
      "protocol": "openid-connect",
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "redirectUris": [
        "https://wallet.zeroverify.net/callback"
      ],
      "webOrigins": [
        "https://wallet.zeroverify.net"
      ],
      "attributes": {
        "pkce.code.challenge.method": "S256",
        "post.logout.redirect.uris": "https://wallet.zeroverify.net/"
      },
      "defaultClientScopes": [
        "web-origins",
        "acr",
        "profile",
        "roles",
        "email",
        "openid"
      ],
      "optionalClientScopes": [
        "address",
        "phone",
        "offline_access",
        "microprofile-jwt"
      ],
      "protocolMappers": [
        {
          "id": "b1c2d3e4-f5a6-7890-abcd-ef1234567890",
          "name": "enrollment-status",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "enrollment_status",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "custom_claims.enrollment_status",
            "jsonType.label": "String"
          }
        }
      ]
    }
  ],
  "identityProviders": [
    {
      "alias": "oakland-shibboleth",
      "displayName": "Oakland University",
      "internalId": "c3d4e5f6-a7b8-9012-cdef-123456789abc",
      "providerId": "saml",
      "enabled": true,
      "trustEmail": true,
      "storeToken": false,
      "addReadTokenRoleOnCreate": false,
      "authenticateByDefault": false,
      "linkOnly": false,
      "firstBrokerLoginFlowAlias": "first broker login",
      "config": {
        "entityId": "https://keycloak.zeroverify.net/realms/zeroverify",
        "idpEntityId": "https://sso.oakland.edu/idp/shibboleth",
        "singleSignOnServiceUrl": "https://sso.oakland.edu/idp/profile/SAML2/POST/SSO",
        "singleLogoutServiceUrl": "",
        "signingCertificate": "MIIDJzCCAg+gAwIBAgIUXb6NcYemE+AX4f9lInUEDvkQt0kwDQYJKoZIhvcNAQEFBQAwGjEYMBYGA1UEAwwPc3NvLm9ha2xhbmQuZWR1MB4XDTE2MDEyODE1MjUxMloXDTM2MDEyODE1MjUxMlowGjEYMBYGA1UEAwwPc3NvLm9ha2xhbmQuZWR1MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApLBefKdvSkLJNhx3T/oyqk+UAIU+AypJsA0qwL3sTxNlMY0ZJCujU9WfHStEA7a/cljiBJNY4fxUH25hV6yVCbH1eEZQDOKMC9HRta3u+SHO8/GIIerJ/X2uzWM4km5xwZb/BT7ZXOUPxCMSNdA+HtkyKKKy62pLCbbn6wFM2P25W2COFOwIw0jPCelESMKm5pwFzuEt6Ly3BINbYN8uk8TIz19d37nUUn9vmkSOG1b6OOaYnSRzJe4TT8qjKc3fD7T99csIRu13W8LBvJxbmrb/9dHGZL2QpKk9XS69JkDorqXYgq+GbxI2+2QhqD6gYHeLvUUoXv3h+sBbM1TaMwIDAQABo2UwYzAdBgNVHQ4EFgQUADt9AP2enqsyUqeAFC9oyhtykqEwQgYDVR0RBDswOYIPc3NvLm9ha2xhbmQuZWR1hiZodHRwczovL3Nzby5vYWtsYW5kLmVkdS9pZHAvc2hpYmJvbGV0aDANBgkqhkiG9w0BAQUFAAOCAQEADtaZmivyn/b0TaITg8kf2WpcYIVA19q42hXJ3yACx74ZPB85Orqbu8Zttg4oG+MLeq15P/nDGHutjst53uOAFA1GZ5jAO9Lt8he458rmk5CSoVn06Se78n+aYJLNMXGE1gDFjTIxra6uiQy/fUyfwnJhIZKl6jNOzNt70fFDwpyT+4OW+S4RsLezqJKo6a9iabiXOa7VeWa4377VPKQn+b0eIrkPqg4UyGNWHMPlS8vhr2sx95ahL7yGaQV4cqjpwC8ySKtjkiLDEjJIyscYLfiqr+A4dxGMouPdJJpVwgPwwifeApvHETDC0JZkdUtXoSI0SjqM+jgw9hFljv7b4g==",
        "nameIDPolicyFormat": "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress",
        "principalType": "SUBJECT",
        "postBindingResponse": "true",
        "postBindingAuthnRequest": "true",
        "postBindingLogout": "true",
        "allowCreate": "true",
        "validateSignature": "true",
        "wantAssertionsSigned": "true",
        "wantAuthnRequestsSigned": "false",
        "addExtensionsElementWithKeyInfo": "false",
        "syncMode": "FORCE",
        "xmlSigKeyInfoKeyNameTransformer": "KEY_ID"
      }
    }
  ],
  "identityProviderMappers": [
    {
      "id": "d4e5f6a7-b8c9-0123-def0-234567890abc",
      "name": "username-from-eppn",
      "identityProviderAlias": "oakland-shibboleth",
      "identityProviderMapper": "saml-username-idp-mapper",
      "config": {
        "syncMode": "FORCE",
        "attribute": "eduPersonPrincipalName",
        "attribute.nameformat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
        "template": "${ATTRIBUTE.eduPersonPrincipalName}"
      }
    },
    {
      "id": "e5f6a7b8-c9d0-1234-ef01-345678901abc",
      "name": "enrollment-status-mapper",
      "identityProviderAlias": "oakland-shibboleth",
      "identityProviderMapper": "saml-user-attribute-idp-mapper",
      "config": {
        "syncMode": "FORCE",
        "attribute": "eduPersonAffiliation",
        "attribute.nameformat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
        "user.attribute": "enrollment_status"
      }
    },
    {
      "id": "f6a7b8c9-d0e1-2345-f012-456789012abc",
      "name": "given-name-mapper",
      "identityProviderAlias": "oakland-shibboleth",
      "identityProviderMapper": "saml-user-attribute-idp-mapper",
      "config": {
        "syncMode": "FORCE",
        "attribute": "givenName",
        "attribute.nameformat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
        "user.attribute": "firstName"
      }
    },
    {
      "id": "a7b8c9d0-e1f2-3456-0123-567890123abc",
      "name": "family-name-mapper",
      "identityProviderAlias": "oakland-shibboleth",
      "identityProviderMapper": "saml-user-attribute-idp-mapper",
      "config": {
        "syncMode": "FORCE",
        "attribute": "sn",
        "attribute.nameformat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
        "user.attribute": "lastName"
      }
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-678901234abc",
      "name": "email-mapper",
      "identityProviderAlias": "oakland-shibboleth",
      "identityProviderMapper": "saml-user-attribute-idp-mapper",
      "config": {
        "syncMode": "FORCE",
        "attribute": "mail",
        "attribute.nameformat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
        "user.attribute": "email"
      }
    }
  ]
}
