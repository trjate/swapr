# swapr

A basic file swapping service.

Sign up to:

* Post requests for files (songs, albums, movies, etc).
* Answer requests or view answers to existing requests.
* Vote answers up or down.

## API

### Sign Up

* Path: `POST '/users/register'`
* Params:
  * email: a string
  * password: a string

* Response:
  * Status Code: 201 if successful, 422 if unsuccessful
  * Example success:
    ```
{
  "user": {
    "id": 2,
    "email": "brit@tiy.com",
    "access_token": "c25ddd49a8b0bc1cb8ba84727538e376"
  }
}
    ```
  * Example failure:
  ```
{
  "errors": [
    "Email has already been taken"
  ]
}
  ```
