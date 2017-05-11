# Migrating an old app

> Veja a versão em [português][portuguese_version].

**Note**: For this guideline, is assumed:
- you have access to WebFaction servers;
- the app is already created and running;
- you are already logged into the server through SSH;
- the project has defined requirements (`requirements.txt` or `setup.py`).

Lets get it started... :slightly_smiling_face:

1. In the app directory, copy everything there to a directory called `backups`,
then remove everything but the Apache directory;

> An empty `.env` file will be created here, but you can touch and fill it
already.

> TL;DR the next 2 steps: `mkdir -p <project directory>.git/.git/ && cd $_`
(then, jump to step 4)

2. Make a directory called `<project directory>.git`;

3. In the `<project directory>.git` directory, make a directory called `.git`;

4. In the `.git` directory, clone this repo with
`git clone https://github.com/dewayinc/bare-django-repo.git .`;

> **Do not forget the final dot**

5. Create a [bare repo][bare_repo_link] with `git init --bare`;

6. Run the command `./deploy.sh -a` to update the app structure.

> The "-a" parameter is to make checks over "pip" too.

> Note: if you use a Python version different than 2.7, you have to set an
[`app.json`][app_json_link] in the project and [deploy][deploy_with_git].

Finished with the server setup! :tada:

> [Go to the beginning][readme]

[readme]: https://github.com/dewayinc/bare-django-repo/blob/master/README.md
[app_json_link]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/APP_JSON.md
[deploy_with_git]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/DEPLOY_WITH_GIT.md
[bare_repo_link]: https://git-scm.com/book/it/v2/Git-on-the-Server-Getting-Git-on-a-Server
[portuguese_version]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/languages/pt_BR/OLD_JSON.md
