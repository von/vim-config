" Configuration for quickmenu

" clear all the items
call quickmenu#reset()

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"

" Git
call quickmenu#append("# Utilities", '')
call quickmenu#append("git blame", 'Gblame', 'Toggle git blame mode')
call quickmenu#append("git undo hunk", 'GitGutterUndoHunk', 'Undo changes in hunk')
call quickmenu#append("Clean whitespace", 'call WhitespaceClean()', 'Clean up whitespace')
call quickmenu#append("Clean Unicode", "call UnicodeClean()", "Clean Unicode")

" Options
call quickmenu#append("# Options", '')
call quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "Toggle spell check (:set spell!)")
call quickmenu#append("Toggle Neocomplete", "NeoCompleteToggle", "Toggle NeoComplete")
call quickmenu#append("Soft Word Wrap", "call WrapSoft()", "Soft (virtual) word wrapping")
call quickmenu#append("Hard Word Wrap", "call WrapHard()", "Hard word wrapping")
call quickmenu#append("Word Wrap Off", "call WrapOff()", "Hard word wrapping")
call quickmenu#append("Toggle Highlight of Non-ASCII", "call ToggleHighlightNonascii()", "Highlight Non-ASCII")

" Projects
call quickmenu#append("# Projects", '')
func! AddProject(projectname, projectconf)
  call quickmenu#append(a:projectname, "call ProjectTabNew(\"" . a:projectname . "\")", "Launch project " . a:projectname)
endfunc
" Make copy() as map() changes in place
call map(copy(g:projects), function('AddProject'))

" Debugging
call quickmenu#append("# Debugging", '')
call quickmenu#append("Debug highlight group", "call SynStack()", "Debug highlight group under cursor")
