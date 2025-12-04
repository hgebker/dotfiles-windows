function Prompt {
  $currentTime = Get-Date -Format "HH:mm:ss"
  $cleanUserProfile = ($env:USERPROFILE).Replace('\', '\\')
  $currentDirectory = $($(Get-Location) -replace $cleanUserProfile, "~")
  $currentBranch = git rev-parse --abbrev-ref HEAD

  Write-Host ""
  Write-Host "[" -NoNewline -ForegroundColor DarkGray
  Write-Host "$currentTime" -NoNewline -ForegroundColor Yellow
  Write-Host "]~[" -NoNewline -ForegroundColor DarkGray
  Write-Host $currentDirectory -NoNewline -ForegroundColor Cyan

  if ($null -ne $currentBranch) {
    Write-Host "]~[" -NoNewline -ForegroundColor DarkGray
    Write-Host $currentBranch -NoNewline -ForegroundColor Magenta
  }

  Write-Host "]" -ForegroundColor DarkGray

  return "> "
}
Clear-Host

function Invoke-EZA { eza --icons=always }
Set-Alias -Name ls -Value Invoke-EZA

# Keep this at the end of your profile, otherwise it won't work
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })