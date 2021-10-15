[![Gem Version](https://badge.fury.io/rb/jass-vue-sfc.svg)](http://badge.fury.io/rb/jass-vue-sfc)
[![build](https://github.com/mtgrosser/jass-vue-sfc/actions/workflows/build.yml/badge.svg)](https://github.com/mtgrosser/jass-vue-sfc/actions/workflows/build.yml)

# Jass::Vue::SFC – Vue SFC support for the Rails asset pipeline

`Jass::Vue::SFC` provides Vue Single File Component support for Sprockets and the Rails asset pipeline. 
Vue SFCs will be compiled to ES modules, which can be `import`ed using the new `importmap-rails` gem or regular `<script module>` tags.

## Installation

In your Gemfile:

```ruby
gem 'jass-vue-sfc'
```

Add `@vue/compiler-sfc` to your JS dependencies:

```sh
$ yarn add @vue/compiler-sfc
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
