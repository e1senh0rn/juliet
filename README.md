Juliet
===============

Host-tracker.com inspired me to make simple monitor for my websites.

Yeah, it's much more simple, feature-less. But let's hope not for a long.

Getting Started
---------------

It is basic rails3 app to manage websites, view responses, etc.

As a backend it uses [loops](http://github.com/kovyrin/loops).
Inside loop it runs async checks with [em-http-request](http://github.com/igrigorik/em-http-request).

Notes
---------------

Loops wasn't fully compatible with rails3, so I used fork of [Yokujin](http://github.com/yokujin/loops) that fixes generators.
It wasn't enough - I commented out <tt>ActiveRecord::Base.allow_concurrency = true</tt> in lib/loops/engine.rb to make it work.

