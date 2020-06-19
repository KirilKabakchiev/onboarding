# Learning Materials

## Intro
* intro to authentication https://medium.com/better-programming/how-do-you-authenticate-mate-f2b70904cc3a
* intro to api auth https://www.youtube.com/watch?v=XpEyRVEOFuU

## Oauth2
* intro on oauth2 https://www.youtube.com/watch?v=996OiexHze0
* book on oauth2 https://github.com/NedyUdombat/Free-Web-Development-eBooks/blob/master/book/Uncategorized/Mastering%20OAuth%202.0.pdf
* Oauth2 with OpenID Connect for Authentication https://oauth.net/articles/authentication/
* Illustrated guide on Oauth and OIDC https://developer.okta.com/blog/2019/10/21/illustrated-guide-to-oauth-and-oidc

### Dex

Dex is an OIDC Identity provider. Normally its used as a portal to other identity providers but it also has two test IDPs (connector_id=mock and connector_id=local) that can be used for local testing 
* run dex locally and run a client app https://github.com/dexidp/dex/blob/master/Documentation/getting-started.md. Observe the network tab requests
* client code (uses go-oidc and oauth2) https://github.com/dexidp/dex/blob/master/cmd/example-app/main.go

## Other
* auth in microservices https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a
