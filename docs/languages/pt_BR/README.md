# Repositório _Bare_ para Django

> Go to the [english][english_version] version.

## Estrutura final do aplicativo

```
. <Seu aplicativo>
+---- apache2/
+---- backend/ <Seu projeto>
+---- backend.git/
|   +---- .git/ <Este projeto como um repositório bare>
+---- logs/
+---- redeploy.sh/
+---- env/ <Ambiente virtual>
+---- .env <Variáveis de ambiente do aplicativo>
```

## Como...

- [Criar um novo aplicativo][new_app]
- [Migrar um aplicativo antigo][old_app]
- [Configurar um `app.json` para o projeto][app_json]
- [Fazer _deploy_ com Git][push_to_production]

## Funcionalidades

- Cria um ambiente virtual par o seu projeto na raiz do aplicativo (nomeado de `env`);
- Reconstrói o ambiente virtual se a versão do Python do projeto mudar;
- Atualiza a configuração do Apache de acordo com o projeto;
- Instala dependências requeridas automaticamente se elas não existirem no servidor;
- Executa comandos personalizados depois de um _deploy_ com sucesso;

[app_json]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/languages/pt_BR/APP_JSON.md
[new_app]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/languages/pt_BR/NEW_APP.md
[old_app]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/languages/pt_BR/OLD_APP.md
[push_to_production]: https://github.com/dewayinc/bare-django-repo/blob/master/docs/languages/pt_BR/PUSH_TO_PRODUCTION.md
[english_version]: https://github.com/dewayinc/bare-django-repo/blob/master/README.md
