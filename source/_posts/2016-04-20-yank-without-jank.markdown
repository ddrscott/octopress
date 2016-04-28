---
layout: post
title: "Yank Without Jank"
date: 2016-04-25 04:51:11 -0500
comments: true
categories: vim
published: true
---

{% img featured /images/yank-default.gif  234 130 'Yank default jump' %}

For all the great things Vim has to offer, it still has some inconsistencies with
basic editors that I simply can't unlearn. One of these nasties is moving the cursor
after a visual yank. Go ahead, try it: `vipy`. Where's your cursor? Where did
you expect it to be located? When you're in a boring editor and do
`shift-down-down-down <Cmd-c>`, where's your cursor?  Where did you expect it
to be located? This janky behaviour always throws me off for a moment, then I
compose myself, do a `<backtick><greaterthan>` to jump to the end of my selection, and `p`.

There must be a better way!
<!-- more -->

## Solution A
Rebind `y` to do exactly what we did above:

```vim
vnoremap y y`>
```

This work and I lived with it for a few minutes, but it still wasn't perfect. I
noticed when I do line select using capital `V` the cursor would still move. The
vertical motion was perfect, but horizontal motion was still jarring.

{% img featured /images/yank-solution-a.gif  234 130 'Yank tick greater than' %}

## Solution B
Let's try using marks to keep things in place:

```vim
vnoremap y myy`y
vnoremap Y myY`y
```
{% img featured /images/2016-04-15-yank-without-jank_markdown.png  600 379 'Yank Without Jank Annotation' %}
The capital `Y` mapping is just in case we want to do a line wise yank from a
character wise selection.

{% img featured /images/yank-solution-b.gif  234 130 'Yank mark y' %}

Like a well trained dog, the cursor stays even though you yank it.

**BONUS** This snippet also takes over the `y` marker, so you can manually
`<backtick>y` at a later time to continue yanking where you left off. This is great when
you're moving a lot of stuff around and want pick up where you last were. You
can also change the mark to capitals in the binding so it spans buffers, too.


## Closing

I've been using this setting for a while and noticed my blood pressure is way
down. No more yank anxiety means I'm a step closer to editing utopia!

Let me know how this goes for you in the comments below.

## Updates from Comments
Commenter @Krzysztof noticed Solution B wasn't allowing the user to specify
the target register. He was awesome enough to update the solution. Here's his
solution:

```vim
vnoremap <expr>y "my\"" . v:register . "y`y"
```

I've updated `$MYVIMRC` and it works great.
Thanks @Krzysztof for being awesome!
