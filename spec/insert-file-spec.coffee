InsertFile = require '../lib/insert-file'

describe "InsertFile", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('insert-file')

  describe "when the insert-file:insert-file event is triggered", ->
    it "FIXME", ->
      atom.commands.dispatch workspaceElement, 'insert-file:insert-file'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(true).toBe true
