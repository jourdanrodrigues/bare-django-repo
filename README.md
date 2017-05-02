# Bare Django Repository

## Expected app structure

```
. <Your app path>
+---- apache2/
+---- backend/ <Your project path>
+---- backend.git/
|   +---- .git/ <This project as a bare repo>
+---- env/
+---- .env <App environment variables>
```

## How to...

- [Create a new app][new_app]
- [Migrate from an old app][old_app]
- [Setup an `app.json` for the project][app_json]

[app_json]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/APPJSON.md
[new_app]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/NEWAPP.md
[old_app]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/OLDAPP.md
