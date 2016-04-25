---
layout: post
title: "Making a Window Submode"
date: 2016-04-23 09:00:00 -0500
comments: true
categories: vim
published: false
---

{% img featured /images/template.png  600 375 'Some Image' %}

I found a plugin that is changing my Vim life. This plugin
is so awesome it really should just be built in. What does the plugin do? It
enable the creation of new submodes. Why would a person want *more* modes?!?
Isn't dealing with modes the main complaint of new Vim users? Let's try out
a submode new submode and see if we can change you _Vim-tire_ life!

<!-- more -->

## Problem
Window commands are prefixed with `<C-w>`. What to create a horizontal split?
Try `<C-w>s`, didn't mean to do that and want to do vertical split? `<C-w>q<C-w>v`.
Want to resize the vertical split `50<C-w>>`? Too big? `5<C-w><`. Move back to
the other window? `<C-w>p` or `<C-w>w`.

Here's a short list of common commands:
```vim
" Change window focus
{n}<C-w>h   move cursor left  {n} window
{n}<C-w>l   move cursor right {n} window
{n}<C-w>j   move cursor down  {n} window
{n}<C-w>k   move cursor up    {n} window

" Move window
<C-w>H   move window far left
<C-w>L   move window far right
<C-w>J   move window far bottom
<C-w>K   move window far top

" Change size
{n}<C-w>+  increase height by {n} rows
{n}<C-w>-  decrease height by {n} rows
{n}<C-w><  decrease width by {n} columns
{n}<C-w>>  increase width by {n} columns
   <C-w>=  equalize sizes
   <C-w>|  maximize width
   <C-w>_  maximize height
```



For a comprehensive list of window commands
try `:help windows.txt`.

Are your fingers getting tired? I know after I get the windows just right my
left pinky and right finger is crying for mercy.

## Solution A
The most common solution is to make these actions to some other keys so there's
no need to prefix them with `<C-w>` first.

```vim
" Move the cursor by hold shift and the motion key.
nnoremap <S-h> <C-w>h
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-l> <C-w>l

" Resize holding Ctrl-Shift
nnoremap <C-S-h> <C-w><
nnoremap <C-S-l> <C-w>>
nnoremap <C-S-k> <C-w>+
nnoremap <C-_> <C-w>-
```

This has been the accepted solution for most, but it takes away so many convient
keys. In some cases, it even overrides default behaviour. (`<S-j>`, I miss you).
