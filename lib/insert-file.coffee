{CompositeDisposable, File} = require 'atom'

module.exports = InsertFile =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'insert-file:insert-file': => @insertFile()

  deactivate: ->
    @subscriptions.dispose()

  insertFile: ->
    if atom.workspace.getActiveTextEditor()
      remote = require('remote')
      dialog = remote.require('dialog')
      dialog.showOpenDialog atom.getCurrentWindow(), { properties: [ 'openFile' ]}, (fs) =>
        @readAndInsertFile(fs)

  readAndInsertFile: (fs) ->
    path = null
    if fs
      path = fs[0]
    if path
      new File(path).read().done (contents) =>
        if contents
          atom.workspace.getActiveTextEditor().insertText contents, { select: true }
