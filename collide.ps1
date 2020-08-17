#!/usr/bin/env pwsh

Push-Location $PSScriptRoot

if(-not (Test-Path .git)){
    git init
}

# EmptyRepo = Get-ChildItem -Path .git -Recurse

Write-Output collide.ps1 > .gitignore
Write-Output 0 > file

git add .
git commit -am '0'

1..100000 | ForEach-Object {
    Write-Output $_ > foo
    git stage . 
    git commit -am "$_"
}

Pop-Location 
