# Bare Django Repository

## Final app structure

```
. <Your app path>
+---- apache2/
+---- backend/ <Your project path>
+---- backend.git/
|   +---- .git/ <This project as a bare repo>
+---- redeploy.sh/
+---- env/ <Virtual environment>
+---- .env <App environment variables>
```

## How to...

- [Create a new app][new_app]
- [Migrate from an old app][old_app]
- [Setup an `app.json` for the project][app_json]

## Features

- Creates a virtual environment for your project on the app root (named `env`);
- Updates the Apache configuration according to the project;
- Installs required dependencies automatically if they don't exist in the server;
- Runs custom commands after a successful deployment;
- Rebuils the virtual environment if the project's Python version changes;

[app_json]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/APPJSON.md
[new_app]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/NEWAPP.md
[old_app]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/OLDAPP.md
