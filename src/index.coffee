'use strict'

initSkeleton = require 'init-skeleton'
sysPath = require 'path'
watch = require './watch'
logger = require 'loggy'

create = (skeleton, path = '.') ->
  unless skeleton
    logger.error '''
  You must specify skeleton (boilerplate) from which brunch will initialize new app.

  You can specify directory on disk, Git URL or GitHub uri (gh:user/repo):

  brunch new --skeleton <path-or-URI>

  Some suggestions:

  * gh:paulmillr/brunch-with-chaplin — Brunch with Chaplin (Backbone, Chaplin, CoffeeScript). The most popular skeleton
  * gh:brunch/dead-simple — if you want no opinions. Just initializes configs and empty directories.
  * gh:gcollazo/brunch-with-ember-reloaded — official Ember.js starter kit + Handlebars + CoffeeScript + Stylus
  * gh:scotch/angular-brunch-seed — Angular.js + CoffeeScript + Jade + stylus + Karma + Bootstrap.js

  All other skeletons (40+) are available at
  http://git.io/skeletons
    '''
    return
  initSkeleton skeleton, path

module.exports = {
  new: create
  build: watch.bind(null, false)
  watch: watch.bind(null, true)
}
