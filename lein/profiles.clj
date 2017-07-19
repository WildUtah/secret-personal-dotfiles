{:user {:plugins [[mvxcvi/whidbey "1.3.1"]
                  [cider/cider-nrepl "0.14.0"]]
        :repl-options
        {:init (require '[clojure.stacktrace :refer [e]])
         :prompt
         (do
           (in-ns 'reply.eval-modes.shared)
           (require '[clojure.string :as str])
           (def colored-output
             {:print-err
              #(binding [*out* *err*]
                 (cond (or (str/starts-with? % "Reflection warning")
                           (str/starts-with? % "Boxed math warning"))
                       (do
                         (print "\033[38;5;213m")
                         (print %)
                         (print "\033[m"))
                       (and (str/index-of % " ") (str/index-of % "Exception")
                            (< (str/index-of % "Exception")
                               (str/index-of % " ")))
                       (do
                         (print "\033[31m")
                         (print (subs % 0 (str/index-of % " ")))
                         (print "\033[38;5;213m")
                         (print (subs % (str/index-of % " ")))
                         (print "\033[m"))
                       true (print "\033[31m" % "\033[m"))
                 (flush))})
           (fn [ns]
             (if (string? ns)
               (str (char 27) "[0;36m"
                    ns "=> " (char 27) "[0;m"))))
         :subsequent-prompt (fn [ns] "")
         :print-value
         (let [C (fn [color & glyph]
                   (map #(vector % (str "\033[38;5;" color "m" %
                                        "\033[m")) glyph))
               C-map (into {} (concat (C 46 \{ \}) (C 165 \( \))
                                      (C 219 \0 \1 \2 \3 \4
                                         \5 \6 \7 \8 \9)
                                      (C 130 \[ \])))]
           (fn [x] (print (apply str (map #(C-map % %)
                                          (print-str x))))
             (flush)))
         :syntax-color :syntax-color
         :color :color}}}

        ;:global-vars {*warn-on-reflection* true
        ;              *unchecked-math* :warn-on-boxed }


