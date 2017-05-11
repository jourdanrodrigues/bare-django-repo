# Bare Django Repository

> Veja a versão em [português][portuguese_version].

## Final app structure

```
. <Your app path>
+---- apache2/
+---- backend/ <Your project path>
+---- backend.git/
|   +---- .git/ <This project as a bare repo>
+---- logs/
+---- redeploy.sh/
+---- env/ <Virtual environment>
+---- .env <App environment variables>
```

## How to...

- [Create a new app][new_app]
- [Migrate an old app][old_app]
- [Setup an `app.json` for the project][app_json]
- [Deploy with Git][deploy_with_git]

## Features

- Creates a virtual environment for your project on the app root (named `env`);
- Rebuils the virtual environment if the project's Python version changes;
- Updates the Apache configuration according to the project;
- Installs required dependencies automatically if they don't exist in the server;
- Runs custom commands after a successful deployment;

[app_json]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/APP_JSON.md
[new_app]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/NEW_APP.md
[old_app]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/OLD_APP.md
[deploy_with_git]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/DEPLOY_WITH_GIT.md
[portuguese_version]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/languages/pt_BR/README.md
