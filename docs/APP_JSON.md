# `app.json`

> Veja a versão em [português][portuguese_version].

The `app.json` is a file placed in the root of the project that describes your
app and sets some configurations in herokuish based infrastructures.

For more detailed info about the `app.json`, go [here][app_json_link].

This deployment process can be customized by setting the following
configurations:

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

The commands you specify on the `postdeploy` list will be executed in the
specified order.

In case of a [Git deployment][deploy_with_git], their failure may reject the
push, **but there is not a rollback yet**.

> [Go to the beginning][readme]

[readme]: https://github.com/dewayinc/bare-django-repo/blob/master/README.md
[deploy_with_git]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/DEPLOY_WITH_GIT.md
[app_json_link]: https://devcenter.heroku.com/articles/app-json-schema
[portuguese_version]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/languages/pt_BR/APP_JSON.md
