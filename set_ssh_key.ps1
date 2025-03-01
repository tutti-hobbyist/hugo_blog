Get-Service ssh-agent
Start-Service ssh-agent
ssh-add "$env:USERPROFILE\.ssh\id_ed25519"
ssh-add -l
