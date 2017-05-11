# `app.json`

> Go to the [english][english_version] version.

O `app.json` é um arquivo colocado na raiz do projeto que descreve seu
aplicativo e define algumas configurações em infraestruturas baseadas em
_herokuish_.

Para informações mais detalhadas sobre o `app.json`, visite [este _link_][app_json_link].

O processo de _deploy_ pode ser personalizado definindo as configurações a
seguir:

## Versão do Python

```json
{
  "environments": {
    "webfaction": {
      "python": "3.6"
    }
  }
}
```

A versão padrão do Python a ser usada é "2.7".

**Nota:** Verifique no servidor pelas versões do Python disponíveis.

## Comandos _post deploy_

```json
{
  "scripts": {
    "webfaction": {
      "postdeploy": [
        "python manage.py compilemessages",
        "python manage.py migrate --no-input"
      ]
    }
  }
}
```

Os comandos que você especificar na lista `postdeploy` vão ser executados na
ordem especificada.

Em caso de um [_deploy_ com Git][deploy_with_git], a falha dele(s) pode causar a
rejeição do _push_, **mas ainda não há a função de retornar ao estado inicial**.

[Ir para o início][readme]

[readme]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/README.md
[deploy_with_git]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/languages/pt_BR/DEPLOY_WITH_GIT.md
[app_json_link]: https://devcenter.heroku.com/articles/app-json-schema
[english_version]: https://github.com/jourdanrodrigues/bare-django-repo/blob/master/docs/APP_JSON.md
