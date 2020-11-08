# Качество продуктов
Проект с открытым исходным кодом для просмотра результатов проверки качества товаров на основе API [Роскачества](https://rskrf.ru/)

![Develop](https://github.com/trykovyura/roskachestvo-ios/workflows/Develop/badge.svg?branch=develop)

[![AppStore][1]][2]

[1]:  Images/App_Store_Badge_US.svg
[2]:  https://apps.apple.com/ru/app/%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE-%D0%BF%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82%D0%BE%D0%B2/id1537294159
## Стек технологий
* iOS 14
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

* [R.swift](https://github.com/mac-cain13/R.swift)
  * `brew install rswift`
* [swiftlint](https://github.com/realm/SwiftLint)
  * `brew install swiftlint`

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