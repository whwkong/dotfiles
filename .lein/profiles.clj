{:user {:dependencies [[org.clojure/tools.namespace "0.3.0"]
                       [spyscope "0.1.6"]
                       [org.clojure/tools.trace "0.7.10"]
                       ]
        :injections [(require '(clojure.tools.namespace repl find))
                     ; try/catch to workaround an issue where `lein repl` outside a project dir
                     ; will not load reader literal definitions correctly
                     ; see: https://gist.github.com/arnaudsj/9731521
                     (try (require 'spyscope.core)
                       (catch RuntimeException e))
                     (use 'clojure.tools.trace)
                     (require '[clojure.tools.namespace.repl :refer [refresh]])
                     ]

        :plugins [[lein-try "0.4.3"]]
        }
 }
