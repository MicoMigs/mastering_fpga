# Clean Vivado project directory, keep only essentials
$keep = @(
    "src",
    "top.v", 
    "tb", 
    "top_tb.v", 
    "top_timing.xdc", 
    "top_physical.xdc", 
    "go.tcl", 
    "clean.ps1", 
    "go.ps1", 
    "top_rtl_list.tcl",
    "readme.md"
)

Get-ChildItem -Force | ForEach-Object {
    if ($keep -contains $_.Name -or ($_.PSIsContainer -and $_.Name -eq "src")) {
        Write-Host "Keeping $($_.FullName)"
    }
    else {
        if ($_.PSIsContainer) {
            Remove-Item $_.FullName -Recurse -Force
            Write-Host "Deleted folder $($_.FullName)"
        } else {
            Remove-Item $_.FullName -Force
            Write-Host "Deleted file $($_.FullName)"
        }
    }
}
