What's ?
===============
chef で使用する Jenkins の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "jenkins", git: "https://github.com/bageljp/cookbook-jenkins.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "jenkins" => {
    "user" => "user_name",
    "port" => {
      "http" => "8090",
      "ajp" => "-1"
    }
  }
)
```

Recipes
----------

#### jenkins::default
Jenkins のインストールと設定。

#### jenkins::cli
jenkins-cli のセットアップ。

