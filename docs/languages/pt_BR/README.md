# Repositório _Bare_ para Django

> Go to the [english][english_version] version.

## Estrutura final do aplicativo

```
. <Seu aplicativo>
|-- apache2/
|-- backend/ <Seu projeto>
|-- backend.git/
|   `-- .git/ <Este projeto como um repositório bare>
|-- logs/
|-- env/ <Ambiente virtual>
|-- redeploy.sh
`-- .env <Variáveis de ambiente do aplicativo>
```

## Como...

- [Criar um novo aplicativo][new_app]
- [Migrar um aplicativo antigo][old_app]
- [Configurar um `app.json` para o projeto][app_json]
- [Fazer _deploy_ com Git][deploy_with_git]

## Funcionalidades

- Cria um ambiente virtual para o seu projeto na raiz do aplicativo (nomeado de
  `env`);
- Reconstrói o ambiente virtual se a versão do Python do projeto mudar;
- Aceita dependências do projeto definidas em `requirements.txt` ou `setup.py`;
- Atualiza a configuração do Apache de acordo com o projeto;
- Automaticamente instala dependências requeridas, se elas não existirem no
servidor (como `virtualenv`);
- Executa comandos personalizados depois de um _deploy_ com sucesso.

[app_json]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/APP_JSON.md
[new_app]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/NEW_APP.md
[old_app]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/OLD_APP.md
[deploy_with_git]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/DEPLOY_WITH_GIT.md
[english_version]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/README.md
