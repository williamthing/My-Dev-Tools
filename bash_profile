#!/bin/bash
# wills.bash_profile

# Alias
alias b="vim ~/.bash_profile"
alias d="cd ~/Documents"
alias code="cd ~/Desktop/Codes/"
alias cb="cd ~/Desktop/CloudBolt"
alias sb="source ~/.bash_profile"
alias sv="source ~/.vimrc"
alias ..="cd .."
alias ...="cd ../.."
alias u="cd .. && ls"
alias h="history"
alias v="vim ~/.vimrc"
alias c="cd ~/.vim/colors"
alias ls="ls -f"

# goes back to directory you were in
alias back="cd $OLDPWD"

# safe file management
alias rm="rm -i"

# django development related alias
alias upip="pip install --upgrade pip"
alias cddj="cd ~/Desktop/Codes/My-Python-Code/'Django Projects'"
alias djver="python -c 'import django; print(django.get_version())'"
alias rundev="python manage.py runserver"

## alias pip install -U Django==1.6.1 (which should install a version of django)

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

function srchpy {
    grep -InrE --exclude-dir="static" --exclude-dir="migrations" \
    --exclude-dir="static_src" --exclude-dir=".git" --include="*.py" --color=always "$1" . | less -FRS
}

function srch() {
    grep -InrE --exclude-dir="static" --exclude-dir="migrations" \
    --exclude-dir="static_src" --exclude-dir=".git" --color=always "$1" . | less -FRS
}

function srchi {
    grep -IinrE --exclude-dir="static" --exclude-dir="migrations" \
    --exclude-dir="static_src" --exclude-dir=".git" --color=always "$1" . | less -FRS
}

# search and pipe to vim
function srchv {
    vim -p $(grep -rIlE --color=none "$1" --exclude-dir=migrations \
    --exclude-dir="static_src" --exclude-dir=".git" *)
}

function s() {
    source "$1"
}

function l() {
    ls "$1"
}

trash () { command mv "$@" ~/.Trash ; }

# good git
function gg() {
    git add .
    git commit -m "$1"
    git push
}

# update my resume
function updateResume() {
    cp "$1" ~/Desktop/Codes/williamthing.github.io/files/
    cp "$1" ~/Desktop/Codes/Personal\ Site/William\'s\ Personal\ Website/files/
}

# updates my website repos
function updateSite() {
    code
    pushd williamthing.github.io
    gg "$1"
    popd
    pushd Personal\ Site/William\'s\ Personal\ Website
    gg "$1"
    popd
}
