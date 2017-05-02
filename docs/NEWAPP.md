# Creating a new app

**Note**: For this guideline, is assumed:
- you have access to WebFaction servers;
- the app is already created through the WebFaction interface;
- is already logged into the server through SSH.

Lets get it started... :slightly_smiling_face:

## Setup the server

1. In the app directory, remove everything that is not the Apache directory;

2. Touch a file `.env` file with the environment variables you use;

> TL;DR the next 2 steps: `mkdir -p backend.git/.git/ && cd $_` (then, jump to step 5)

3. Make a directory called `backend.git`[<sup>1</sup>][tutorial_notes_link];

4. In the `backend.git` directory, make a directory called `.git`;

5. In the `.git` directory, clone this repo with `git clone https://github.com/dewayinc/bare-django-repo.git .`[<sup>2</sup>][tutorial_notes_link];

6. Make it a [bare repo][bare_repo_link] with `git init --bare`;

7. Back to the app path (`cd ../../`), create a virtual environment folder with `virtualenv -p /usr/local/bin/pythonX.Y --prompt="(<your project name>)"`[<sup>3</sup>][tutorial_notes_link].

Finished with the server setup. :tada:

## Pushing to production

On your local git repo, add the server as a git remote for deployment:

`git remote add webfaction <user>@web<server number>.webfaction.com:webapps/<app directory>/backend.git`

Now you are able to `git push webfaction` to update the production server. :heart_eyes:

## Tutorial notes

1 - Actually, `something_else.git`, but lets make `backend.git` a pattern...

2 - Do **not** forget the final dot

3 - The "X.Y" is the Python version (of course)

[bare_repo_link]: https://git-scm.com/book/it/v2/Git-on-the-Server-Getting-Git-on-a-Server
[tutorial_notes_link]: #tutorial-notes
