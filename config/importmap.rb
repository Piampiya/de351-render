# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "https://cdn.jsdelivr.net/npm/@hotwired/turbo@7.2.0/dist/turbo.es2017-umd.min.js", preload: true
pin "@hotwired/stimulus", to: "https://cdn.jsdelivr.net/npm/@hotwired/stimulus@3.2.2/dist/stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix", to: "https://cdn.jsdelivr.net/npm/trix@2.1.8/dist/trix.umd.min.js"
pin "@rails/actiontext", to: "https://cdn.jsdelivr.net/npm/@rails/actiontext@7.1.0/app/assets/javascripts/actiontext.min.js"
