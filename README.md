[![Gem Version](https://badge.fury.io/rb/jass-vue-sfc.svg)](http://badge.fury.io/rb/jass-vue-sfc)
[![build](https://github.com/mtgrosser/jass-vue-sfc/actions/workflows/build.yml/badge.svg)](https://github.com/mtgrosser/jass-vue-sfc/actions/workflows/build.yml)

# Jass::Vue::SFC – Vue SFC support for the Rails asset pipeline

`Jass::Vue::SFC` provides [Vue Single File Component](https://v3.vuejs.org/guide/single-file-component.html) support for Sprockets and the Rails asset pipeline.

Vue SFCs will be compiled to ES modules, which can be imported using the new Rails [Import Maps](https://github.com/rails/importmap-rails) or regular `<script module>` tags.

## Why?

Modern browsers support native loading of ES modules using the `import` statement.
By leveraging the new Rails Import Maps, modular JS applications can be built
without having to integrate a complex and tedious JS build pipeline. 

However, framework-specific component formats like the Vue SFC format could not be used this
way till now.

`Jass::Vue::SFC` enables the asset pipeline to compile `.vue` files to ES modules,
allowing to build modular Vue applications in a clear and straightforward way,
without the necessity of external build tools.

## Installation

### Gemfile
```ruby
gem 'jass-vue-sfc'
```

### JS dependencies
Add `@vue/compiler-sfc` to your JS dependencies:
```sh
$ yarn add @vue/compiler-sfc
```

### Node.js

`Jass::Vue::SFC` depends on [Nodo](https://github.com/mtgrosser/nodo), which requires a working Node.js installation.

For Rails applications, the default `NODE_PATH` will be set to `vendor/node_modules` by the Nodo Railtie.
If you prefer to stick with the Rails 6 default, use an initializer:

```ruby
# config/initializers/nodo.rb
Nodo.modules_root = Rails.root.join('node_modules')
```

## Usage

Place your `.vue` components inside your regular asset path, e.g. under `app/assets/javascripts` or `app/javascript`.

In `app/javascript/components/HelloWorld.vue`:

```vue
<script>
export default {
  data() {
    return {
      greeting: 'Hello World!'
    }
  }
}
</script>

<template>
  <p class="greeting">{{ greeting }}</p>
</template>
```

Then add the component to `app/assets/config/manifest.js`:

```js
//= link app/javascript/components/HelloWorld.js
```

Make sure to link the file as `.js` instead of `.vue`. Sprockets will take care of
converting it into an ES module.

In your HTML code, load the component as a module:

```erb
<%= javascript_include_tag 'HelloWorld.js', module: true %>
```

### Components with imports

If you want to use module `import`s within your components, pin them in your Rails importmap:

```
# config/importmap.rb
pin 'vue'
pin 'HelloWorld.vue', to: 'HelloWorld.js'
```

Then just use them in your component:

```vue
<script>
import Vue from 'vue';
...
</script>
```

## Limitations

Currently, the following things are not (yet) supported:

- extracting the `<style>` section of the SFC
- source maps
