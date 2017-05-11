# Creating a new app

> Veja a versão em [português][portuguese_version].

**Note**: For this guideline, is assumed:
- you have access to WebFaction servers;
- the app is already created through the WebFaction interface;
- is already logged into the server through SSH.

Lets get it started... :slightly_smiling_face:

## Setup the server

1. In the app directory, remove everything but the Apache directory;

> An empty `.env` file will be created here, but you can touch and fill it
already.

> TL;DR the next 2 steps: `mkdir -p backend.git/.git/ && cd $_` (then, jump to
step 4).

2. Make a directory called `backend.git`;

> Actually could be `something_else.git`, but lets make `backend.git` a
pattern...

3. In the `backend.git` directory, make a directory called `.git`;

4. In the `.git` directory, clone this repo with
`git clone https://github.com/jourdanrodrigues/bare-django-repo.git .`;

> **Do not forget the final dot**

5. Create a [bare repo][bare_repo_link] with `git init --bare`;

6. Run the command `./deploy.sh -a` to generate the basics for the project.

> The "-a" parameter is to make checks over "pip" too.

> Note: if you use a Python version different than 2.7, you have to set an
[`app.json`][app_json_link] in the project.

A [deploy][deploy_with_git] is needed for the server to be fully defined.

Finished with the server setup! :tada:

> [Go to the beginning][readme]

[readme]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/README.md
[bare_repo_link]: https://git-scm.com/book/it/v2/Git-on-the-Server-Getting-Git-on-a-Server
[app_json_link]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/APP_JSON.md
[deploy_with_git]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/DEPLOY_WITH_GIT.md
[portuguese_version]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/NEW_JSON.md
