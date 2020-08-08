# Проект [Роскачества](https://rskrf.ru/)
Проект с открытым исходным кодом для просмотра результатов проверки качества товаров

## Стек технологий
* iOS 13
* SwiftUI
* Combine

## Design

* [Figma](https://www.figma.com/file/fxfo3rDhoq7Gn9zmKluF4L2J/Roskachestvo?node-id=0%3A1)

## Task manager

* [Trello](https://trello.com/b/32FdkhHQ/roskachestvo)

## API

* [rskrf.ru](https://rskrf.ru/about/dev/)

## Requirements
* [homebrew](https://brew.sh/index_ru) - optional

* [cocoapods](https://cocoapods.org/)

* [swiftlint](https://github.com/realm/SwiftLint)

* [fastlane](https://github.com/fastlane/fastlane)

* [xcodegen](https://github.com/yonaskolb/XcodeGen)

* ruby

## 🔧 Что нужно, чтобы начать писать код

Все зависимости устанавливаются через Gemfile и brew (Не требуется SUDO)

* Добавить в .bash_profile `export GEM_HOME=~/.gem`

* Если нет Ruby, то установить `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

* instructions to install ruby https://gorails.com/setup/osx/10.13-high-sierra

* `gem install bundler` - установка менеджера зависимостей bundler

* `bundle install` - установка зависимостей

* `bundle exec fastlane install_plugins` - установка плагинов fastlane(включая xcodegen)

* `bundle exec fastlane prepare` - генерация проекта и установка зависимостей
 
## 🚀 Что нужно знать перед работой над проектом?

**Основные положения**

* Мы разрабатываем на **Swift**
* Мы не используем сложные архитектурные паттерны, но следуем принципам [SOLID](https://www.youtube.com/watch?v=y7nxFXnEyrU)
* Разрабатываем мы по модели [gitflow](http://danielkummer.github.io/git-flow-cheatsheet/)
  
### [Git flow](https://danielkummer.github.io/git-flow-cheatsheet/index.ru_RU.html)

* `git flow init`

>Branch name for production releases: [master]
>Branch name for "next release" development: [develop]
>
>How to name your supporting branch prefixes?
>Feature branches? [feature/]
>Release branches? [release/]
>Hotfix branches? [hotfix/]
>Support branches? [support/]
>Version tag prefix? [v]