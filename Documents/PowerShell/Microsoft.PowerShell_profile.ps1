# init
Invoke-Expression (&starship init powershell) # starship

# micromamba
#region mamba initialize
# !! Contents within this block are managed by 'mamba shell init' !!
$Env:MAMBA_ROOT_PREFIX = "C:\Users\remon\.micromamba"
$Env:MAMBA_EXE = "C:\Users\remon\AppData\Local\micromamba\micromamba.exe"
(& $Env:MAMBA_EXE 'shell' 'hook' -s 'powershell' -p $Env:MAMBA_ROOT_PREFIX) | Out-String | Invoke-Expression
#endregion

# Alias
Set-Alias -Name ls -Value eza
Set-Alias -Name mm -Value micromamba
Set-Alias -Name dotfiles -Value chezmoi

function ya {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -Path $cwd
    }
    Remove-Item -Path $tmp
}
