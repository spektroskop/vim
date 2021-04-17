nnoremap <Space> :GuideMenu '<Space>' <CR>
vnoremap <Space> :GuideMenuVisual '<Space>' <CR>
nnoremap , :GuideMenu '<Space>' <CR>
vnoremap , :GuideMenuVisual '<Space>' <CR>

command! -nargs=1 GuideMenu call GuideMenu('n', <args>)
command! -nargs=1 -range GuideMenuVisual call GuideMenu('v', <args>)

let g:guideMenu#labels = {
      \'f': '+find',
      \'b': '+buffer',
      \'p': '+plugin',
      \'t': '+toggle',
      \'g': '+git',
      \'w': '+window',
      \}

func! GuideMenu(mode, prefix) abort
  let prefix = a:prefix ==# ' ' ? '<Space>' : a:prefix
  let guide = s:newGuide(a:mode, prefix)

  if empty(guide)
    echo 'No mappings found for "'.prefix.'"'
    return
  end

  let window = s:openWindow()
  let keys = []

  while v:true
    let current = s:lookupGuide(guide, keys)

    if s:isMapping(current)
      call s:closeWindow(window)
      let cmd = EscapeKeys(prefix.join(current.keys, ''))
      execute 'call feedkeys("'.cmd.'")'
      return
    end

    call s:renderContent(prefix, keys,
          \map(items(current), {_, v -> s:renderItem(keys + [v[0]], v[1])})
          \)

    try
      let char = getchar()
    catch /^Vim:Interrupt$/
      call s:closeWindow(window)
      return
    endtry

    if char == 27
      call s:closeWindow(window)
      return
    end

    if char ==# "\<BS>"
      if len(keys)
        call remove(keys, -1)
      end
    else
      call add(keys, nr2char(char))
    end
  endwhile
endf

func! s:parseMap(line)
  let mode = a:line[0]
  let name = split(a:line[3:])[0]
  return maparg(name, mode, 0, 1)
endf

func! s:parseMaps(mode, prefix) abort
  let maps = ""
  redir => maps | silent execute (a:mode.'map'.a:prefix) | redir END
  let parsed = map(split(maps, '\n'), {_, line -> s:parseMap(line)})
  return filter(parsed, {_, map -> map != {} && map.lhs != a:prefix})
endf

func! s:isMapping(v)
  return type(a:v) == type({}) && has_key(a:v, 'noremap')
endf

func s:lookupGuide(guide, keys)
  let guide = a:guide
  for arg in a:keys
    if type(guide) != type({}) | return guide | end
    if !has_key(guide, arg) | return guide | end
    let guide = guide[arg]
  endfor
  return guide
endf

func s:newGuide(mode, prefix)
  let guide = {}
  for map in s:parseMaps(a:mode, a:prefix)
      let map.lhs = substitute(map.lhs, a:prefix, '', '')
      let map.keys = split(map.lhs, '\zs')
      let guide = MergeDicts(guide,
            \SequenceToDict(reverse(copy(map.keys)), map))
  endfor
  return guide
endf

func! s:renderItem(keys, v)
  let k = a:keys[-1]
  let keys = join(a:keys, '')

  if exists('g:guideMenu#labels') && has_key(g:guideMenu#labels, keys)
    let label = g:guideMenu#labels[keys]
  elseif s:isMapping(a:v)
    let label = a:v.rhs
  else
    let label = '+group'
  end

  return printf('%s %s', k, label)
endf

func! s:sortItems(a, b)
  let a = split(a:a, ' ') | let b = split(a:b, ' ')
  if a[1][0] == '+' && b[1][0] == '+' | return a[1] > b[1] ? 1 : -1
  elseif a[1][0] == '+' | return -1
  elseif b[1][0] == '+' | return 1
  else | return a[0] > b[0] ? 1 : -1
  end
endf

func! s:renderContent(prefix, keys, content)
  let pad = has('nvim') ? 1 : 0 " FIXME
  let content = sort(a:content, 's:sortItems')
  let content = map(content, {_, v -> repeat(' ', pad).v.repeat(' ', pad) })
  execute 'vertical resize' MaxLength(content)
  execute 'resize' len(content)

  setlocal modifiable
  silent 1,$delete _
  call setline(1, content)
  setlocal nomodifiable

  redraw
  if has('nvim')
    echohl FloatBorder
    let prompt = '│'.repeat(' ', pad).'> '.join(a:keys, '').'█'
    let prompt = prompt.repeat(' ', MaxLength(a:content)-len(prompt)).'     │'
    echo prompt
  else
    echohl Number
    echo '> '.join(a:keys, '')
  end
  echohl None
endf

func s:openWindow()
  let window = {'previous': winnr(), 'saved': winsaveview(), 'restore': winrestcmd()}

  if has('nvim')
    let ui = nvim_list_uis()[0]
    let opts = {
          \ 'relative': 'editor', 'anchor': 'SW', 'style': 'minimal',
          \ 'border': ['╭','─','╮','│','╯','─','╰','│'],
          \ 'width': ui.width, 'height': 1,
          \ 'col': 0, 'row': ui.height-2,
          \ }
    let buf = nvim_create_buf(0, 1)
    let win = nvim_open_win(buf, 1, opts)
  else
    execute 'keepjumps' 'botright' '1new'
  end

  let window.nr = winnr()
  setlocal filetype=guide_menu
  setlocal buftype=nofile bufhidden=wipe
  setlocal nobuflisted noswapfile
  setlocal guicursor+=a:Cursor/lCursor

  " FIXME
  if has('nvim')
    highlight Cursor blend=100
  else
    setlocal laststatus=0 noshowmode noruler
  end

  return window
endf

func s:closeWindow(window)
  execute a:window.nr.'wincmd w'
  if winnr() == a:window.nr | close! | end
  execute a:window.previous.'wincmd w'
  execute a:window.restore
  call winrestview(a:window.saved)

  " FIXME
  if has('nvim')
    highlight Cursor blend=0
  else
    setlocal laststatus=2 showmode ruler
  end

  echon
endf
