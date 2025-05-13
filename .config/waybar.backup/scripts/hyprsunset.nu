#!/usr/bin/env nu

if (systemctl --user list-unit-files | detect columns | find hyprsunset | get STATE | str contains "disabled") {
    hyprsunset -t 4000
} else if (systemctl --user list-unit-files | detect columns | find hyprsunset | get STATE | str contains "disabled") {
    kill (pgerp hyprsunset | into int)
}
