[Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null

function Rotate-Image {
    param (
        [string]$Path,
        [string]$RotateType
    )
    $image = [System.Drawing.Image]::FromFile($Path)
    # Rotate90FlipNone = Rotate 90 degrees clockwise
    # Rotate270FlipNone = Rotate 270 degrees clockwise (90 counter-clockwise)
    if ($RotateType -eq "90") {
        $image.RotateFlip([System.Drawing.RotateFlipType]::Rotate90FlipNone)
    } elseif ($RotateType -eq "270") {
        $image.RotateFlip([System.Drawing.RotateFlipType]::Rotate270FlipNone)
    }
    # To overwrite, we must save to a temp file, dispose the original, then replace it
    $tempPath = $Path + ".tmp.jpeg"
    $image.Save($tempPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $image.Dispose()
    Remove-Item $Path -Force
    Rename-Item $tempPath (Split-Path $Path -Leaf) -Force
    Write-Host "Rotated $Path successfully"
}

Rotate-Image -Path "c:\Users\acer\.gemini\antigravity-ide\scratch\sathish-portfolio-v2\assets\certificates\cert_cirf.jpeg" -RotateType "90"
Rotate-Image -Path "c:\Users\acer\.gemini\antigravity-ide\scratch\sathish-portfolio-v2\assets\certificates\cert_change.jpeg" -RotateType "90"
