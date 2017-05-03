# Creating a new app

**Note**: For this guideline, is assumed:
- you have access to WebFaction servers;
- the app is already created through the WebFaction interface;
- is already logged into the server through SSH.

Lets get it started... :slightly_smiling_face:

## Setup the server

1. In the app directory, remove everything that is not the Apache directory;

> An empty `.env` file will be created here, but you can touch and fill it already

> TL;DR the next 2 steps: `mkdir -p backend.git/.git/ && cd $_` (then, jump to step 4)

2. Make a directory called `backend.git`;

> Actually could be `something_else.git`, but lets make `backend.git` a pattern...

3. In the `backend.git` directory, make a directory called `.git`;

4. In the `.git` directory, clone this repo with `git clone https://github.com/dewayinc/bare-django-repo.git .`;

> Do **not** forget the final dot

5. Make it a [bare repo][bare_repo_link] with `git init --bare`;

6. Run the command `./deploy.sh` to generate the basics for the project.

> Note: if you use a Python version different than 2.7, you have to set an [`app.json`][app_json_link] and [push a deploy](#pushing-to-production).

Finished with the server setup. :tada:

## Pushing to production

On your local git repo, add the server as a git remote for deployment:

`git remote add webfaction <user>@web<server number>.webfaction.com:webapps/<app directory>/backend.git`

Now you are able to `git push webfaction` to update the production server. :heart_eyes:

[bare_repo_link]: https://git-scm.com/book/it/v2/Git-on-the-Server-Getting-Git-on-a-Server
