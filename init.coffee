# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
path = require 'path'
{BufferedProcess} = require 'atom'

atom.workspace.observeTextEditors (editor) ->
  editor.onDidSave ->
    atom.notifications.addSuccess("Saved #{editor.getPath()}")

atom.commands.add 'atom-text-editor', 'my: open-finder', ->
  editor = atom.workspace.getActiveTextEditor()
  cwd = path.dirname(editor.getPath())
  command = 'open'
  args = [cwd]
  process = new BufferedProcess({command, args})
