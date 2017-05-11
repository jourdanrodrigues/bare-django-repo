# Criando um novo aplicativo

> Go to the [english][english_version] version.

**Nota**: Para este guia, consideramos que:
- você tem acesso aos servidores da WebFaction;
- o aplicativo já foi criado através da interface da WebFaction;
- você já está conectado através de SSH ao servidor.

Vamos começar... :slightly_smiling_face:

1. No diretório do aplicativo, remova tudo, menos o diretório do Apache;

> Um arquivo vazio `.env` vai ser criado aqui, mas você já pode criá-lo e
preenchê-lo.

> TL;DR os próximos 2 passos: `mkdir -p backend.git/.git/ && cd $_` (então, pule
para o passo 4).

2. Crie um diretório chamado `backend.git`;

> Na verdade poderia ser `outra_coisa.git`, mas vamos fazer de `backend.git` um
padrão...

3. Dentro do diretório `backend.git`, crie um diretório chamado `.git`;

4. Dentro do diretório `.git`, clone este repositório com
`git clone https://github.com/jourdanrodrigues/bare-django-repo.git .`;

> **Não esqueça o ponto no final**

5. Crie um [repositório _bare_][bare_repo_link] com `git init --bare`;

6. Execute o comando `./deploy.sh -a` para gerar a estrutura básica.

> O parâmetro "-a" faz com que o "pip" seja verificado também.

> Nota: se você usa uma versão do Python diferente de 2.7, você precisa definir
um arquivo [`app.json`][app_json] no projeto.

É preciso [fazer _deploy_][deploy_with_git] para que o servidor fique totalmente
definido.

Finalizamos a configuração do servidor! :tada:

[Ir para o início][readme]

[readme]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/README.md
[bare_repo_link]: https://git-scm.com/book/it/v2/Git-on-the-Server-Getting-Git-on-a-Server
[app_json]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/APP_JSON.md
[deploy_with_git]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/DEPLOY_WITH_GIT.md
[english_version]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/NEW_JSON.md
