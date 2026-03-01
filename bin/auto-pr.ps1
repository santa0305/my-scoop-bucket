param(
    # overwrite upstream param
    [String]$upstream = "santa0305/my-scoop-bucket.git:main"
)

if (!$env:SCOOP_HOME) { $env:SCOOP_HOME = Convert-Path (scoop prefix scoop) }
$autopr = "$env:SCOOP_HOME/bin/auto-pr.ps1"
$dir = "$PSScriptRoot/../bucket" # checks the parent dir
& $autopr -Dir $dir -Upstream $Upstream @Args
