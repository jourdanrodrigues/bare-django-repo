# `app.json`

The `app.json` is a common file that describes your app and sets some configuration in herokuish based infrastructures.

For more detailed info about the `app.json`, go [here][app_json_link].

This deployment process can be customized by setting the following configurations:

## Python version

```json
{
  "environments": {
    "webfaction": {
      "python": "3.6"
    }
  }
}
```

The default Python version set is "2.7".

**Note:** Check in the server for Python versions available.

## Post deploy scripts

```json
{
  "scripts": {
    "webfaction": {
      "postdeploy": [
        "python manage.py compilemessages",
        "python manage.py migrate --no-input"
      ]
    }
  }
}
```

The commands you specify on the `postdeploy` list will be executed in the specified order and their failure may
reject the push, **but there is not a rollback yet**.


[app_json_link]: https://devcenter.heroku.com/articles/app-json-schema
