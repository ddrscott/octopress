---
layout: post
title: "BS to the black hole"
date: 2016-04-13 00:48:47 -0500
comments: true
categories: vim
publish: true
---

{% img featured /images/blackhole_bs.png  800 469 'BS to Blackhole' %}

## We meet again

First post in 4 years. Sorry to keep you waiting.

I've been playing with Vim again, more specifically NeoVim
https://neovim.io/, and this time I think it's going to stick.

Here's the latest addition to $MYVIMRC which can be found at
https://github.com/ddrscott/config-nvim.

## Problem
Sometimes I want to delete text without worrying about blowing away the unnamed
register. This can be done by prefixing a normal or visual delete with `"_`,
but thats way too pinky/ring finger contortions for me.

<!-- more -->

## Solution
Setup a single key to do that `"_` thing for me. So my naive approach was to add
the following:

```vim
nnoremap <BS> "_
vnoremap <BS> "_
```

This was fine for 32.1 seconds of usability testing. It did the job, but what
comes after a `"_` is a always a `delete` operator. I said the "o" word. That
means I have to make a `opfunc`. (Who makes these rules?!?)

So what is this operator going to let us do? How about `<BS>iw` or `<BS>ap` or
`v{motion around something you hate}<BS>`? If any of those seem awesome, heres
how to get in on the hot action!


```vim
" Add to your .vimrc or init.vim or vim.after or :e $MYVIMRC
func! BlackHoleDeleteOperator(type)
  if a:type ==# 'char'
    execute 'normal! `[v`]"_d'
  elseif a:type ==# 'line'
    execute 'normal! `[V`]"_d'
  else
    execute 'normal! `<' . a:type . '`>"_d'
  endif
endf

" Map to something else if <BS> is used for something else. (Really?!?)
nnoremap <silent> <BS> <Esc>:set opfunc=BlackHoleDeleteOperator<CR>g@
vnoremap <silent> <BS> :<C-u>call BlackHoleDeleteOperator(visualmode())<CR>
```

## But how does it work?
Honestly, I don't really know. It's only my second Vim function every. EVER!
`opfunc` is best explained in Vim help (`:help opfunc` and follow the `<C-]>`
until clarity is achieved).

Points of interest:

* `:help normal` - evaluates the following characters as if they were typed.
* `:help marks` - page down a bit to get the list of automatic marks based on
   last positions of various changes, jumps, and actions.
* http://learnvimscriptthehardway.stevelosh.com/chapters/33.html - seriously,
   this guy does a lot better explaining than me. Learn it the hard way, first,
   ask questions later.


