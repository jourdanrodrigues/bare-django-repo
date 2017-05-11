# Migrando um aplicativo antigo

> Go to the [english][english_version] version.

**Nota**: Para este guia, consideramos que:
- você tem acesso aos servidores da WebFaction;
- o aplicativo já foi criado e está funcionando;
- você já está conectado através de SSH ao servidor;
- o projeto tem dependências definidas (`requirements.txt` ou `setup.py`).

Vamos começar... :slightly_smiling_face:

1. No diretório do aplicativo, copie tudo para um diretório chamado `backups`,
então remova tudo, menos o diretório do Apache;

> Um arquivo vazio `.env` vai ser criado aqui, mas você já pode criá-lo e
preenchê-lo.

> TL;DR os próximos 2 passos: `mkdir -p backend.git/.git/ && cd $_` (então, pule
para o passo 4).

2. Crie um diretório chamado `<diretório do projeto>.git`;

3. Dentro do diretório `<diretório do projeto>.git`, crie um diretório chamado
`.git`;

4. Dentro do diretório `.git`, clone este repositório com
`git clone https://github.com/jourdanrodrigues/bare-django-repo.git .`;

> **Não esqueça o ponto no final**

5. Crie um [repositório _bare_][bare_repo_link] com `git init --bare`;

6. Execute o comando `./deploy.sh -a` para atualizar a estrutura do aplicativo.

> O parâmetro "-a" faz com que o "pip" seja verificado também.

> Nota: se você usa uma versão do Python diferente de 2.7, você precisa definir
um arquivo [`app.json`][app_json] no projeto e [fazer deploy][deploy_with_git].

Finalizamos a configuração do servidor! :tada:

[Ir para o início][readme]

[readme]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/README.md
[app_json]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/APP_JSON.md
[bare_repo_link]: https://git-scm.com/book/it/v2/Git-on-the-Server-Getting-Git-on-a-Server
[deploy_with_git]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/DEPLOY_WITH_GIT.md
[readme]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/README.md
[english_version]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/OLD_JSON.md
