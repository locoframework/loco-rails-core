![logo](https://raw.githubusercontent.com/artofcodelabs/artofcodelabs.github.io/master/assets/ext/loco_logo_trans_sqr-300px.png)

# 🧐 What is Loco-Rails-Core?

**Loco-Rails-Core** is a Rails plugin that has been extracted from [Loco-Rails](https://github.com/locoframework/loco-rails).
The reason for this extraction was to pull out functionality that can be used as a stand-alone lib.
This functionality was the origin of the [Loco-Rails](https://github.com/locoframework/loco-rails) project.  

I wanted to provide a logical structure for a JavaScript code that corresponds to Rails` controllers and views.
The same controller's action that renders a response for a given request on the [Rails](https://rubyonrails.org) side would be called on the JavaScript level.
By _"the same"_ - I mean action with the same name and defined in an (optionally namespaced) controller with the corresponding name as the one on the server-side.

The **Loco-Rails-Core**, by itself, does not provide a lot of value. It should be used with its JavaScript complementary library - [Loco-JS-Core](https://github.com/locoframework/loco-js-core).
**Loco-Rails-Core**'s single generator adds `Loco::Core::Helpers` module to `ApplicationHelper`.
It also updates the `application.html.erb` layout by adding `data-*` attributes to HTML `<body>` element.  
**Loco-Rails-Core** does this via methods defined in the mentioned above `Loco::Core::Helpers` module.

These attributes store the information about the namespace, controller, and action names involved in handing a given request.
[Loco-JS-Core](https://github.com/locoframework/loco-js-core) looks at these attributes to call out a method from the corresponding location but inside the JavaScript code.
In other words - [Loco-JS-Core](https://github.com/locoframework/loco-js-core) calls a JavaScript controller's action with the same name and located inside the same namespace.

_Example:_

Given that the `index` action from `Main::PagesControllers` handles a given request.
`<body>`'s data attributes are gonna look like this:

```html
<body data-namespace="Main" data-controller="Pages" data-action="index">
</body>
```

**Loco-JS-Core** will act similarly (simplified version):

```javascript
// all JavaScript controllers are assigned to the Controllers object

namespaceController = new Controllers.Main;
namespaceController.initialize();

controller = new Controllers.Main.Pages;
controller.initialize();
controller.index();
```

If you don't define a namespace controller - it will be skipped.  
If you don't define an `initialize` or `index` actions - **Loco-JS-Core** won't call them.  
You can define JavaScript counterparts only for those actions that you want to augment with JavaScript features.

**Loco-Rails-Core** is the right choice if you don't need all features that [Loco-Rails](https://github.com/locoframework/loco-rails) provides.


# 📥 Installation

Add this line to your application's Gemfile:

```ruby
gem 'loco-rails-core'
```
And then execute:

```bash
$ bundle
```


# 🎮 Usage

```bash
$ bin/rails generate loco:core:file_injector
```


# 👩🏽‍🔬 Tests

```bash
$ bin/test
```


# 📜 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


# 👨‍🏭 Author

Zbigniew Humeniuk from [Art of Code](https://artofcode.co)
