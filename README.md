# Loco-Rails-Core

**Loco-Rails-Core** is a Rails plugin that has been extracted from [Loco-Rails](https://github.com/locoframework/loco-rails).
The reason for this extraction was to pull out the functionality the can be used as a stand-alone lib.
This functionality was the origin of the [Loco-Rails](https://github.com/locoframework/loco-rails) project.  

I wanted to provide a logical structure for JavaScript code that would be corresponding with Rails` controllers and views.
The same controller's action would be called on the JavaScript level that renders a response for a given request on the [Rails](https://rubyonrails.org) side.
By _"the same"_ - I mean an action with the same name and defined in a (optionally namespaced) controller with the corresponding name on the server side as well.

The **Loco-Rails-Core** by itself does not provide a lot of value. It has to be used with its JavaScript complementary library - [Loco-JS](https://github.com/locoframework/loco-js).
**Loco-Rails-Core**'s single generator adds `Loco::Core::Helpers` module to `ApplicationHelper`.
It also updates the `application.html.erb` layout by adding `data-*` attributes to HTML `<body>` element.  
**Loco-Rails-Core** does this via methods defined in the aforementioned `Loco::Core::Helpers` module.

These attributes store the information about namespace, controller and action names involved in handing a given request.
[Loco-JS](https://github.com/locoframework/loco-js) looks at those attributes to call out method from the corresponding location but inside the JavaScript code.
In other words - [Loco-JS](https://github.com/locoframework/loco-js) will call a JavaScript controller's action with the same name and located inside the same namespace.

_Example:_

Given that the `index` action from `Main::PagesControllers` handles a given request.
`<body>`'s data attributes are gonna look like this:

```html
<body data-namespace="Main" data-controller="Pages" data-action="index">
</body>
```

**Loco-JS** will act in the similar fashion (simplified version):

```javascript
import { Controllers } from "loco-js";

namespaceController = new Controllers.Main;
namespaceController.initialize();

controller = new Controllers.Main.Pages;
controller.initialize();
controller.index();
```

If you don't define a namespace controlller - it will be skipped.  
If you don't define an `initialize` or `index` actions - **Loco-JS** won't call them.  
You can define a JavaScript counterparts only for those actions that you want to augment with JavaScript features.

**Loco-Rails-Core** is a good choice if you don't need all the features that [Loco-Rails](https://github.com/locoframework/loco-rails) provides.


## 📥 Installation

Add this line to your application's Gemfile:

```ruby
gem 'loco-rails-core'
```
And then execute:

```bash
$ bundle
```


## 🎮 Usage

```bash
$ bin/rails generate loco:core:file_injector
```


## 📜 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## 👨‍🏭 Author

Zbigniew Humeniuk from [Art of Code](https://artofcode.co)
