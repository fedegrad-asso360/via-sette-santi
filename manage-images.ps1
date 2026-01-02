# Script per la gestione delle immagini del sito Via dei Sette Santi
# PowerShell 5.1+

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('download', 'optimize', 'check', 'gallery')]
    [string]$Action = 'check'
)

# Configurazione
$ProjectRoot = $PSScriptRoot
$ImagesRoot = Join-Path $ProjectRoot "public\images"

# Funzione: Verifica immagini esistenti
function Test-Images {
    Write-Host "`n=== Verifica Immagini ===" -ForegroundColor Cyan
    
    $categories = @{
        "Hero Carousel" = @("hero-1.jpg", "hero-2.jpg", "hero-3.jpg")
        "Trail Cards" = @("trails\trail-1.jpg", "trails\trail-2.jpg", "trails\trail-3.jpg", "trails\trail-4.jpg", "trails\trail-5.jpg")
        "Saint Cards" = @("saints\saint-leonardo.jpg", "saints\saint-chiodo.jpg", "saints\saint-giacomo.jpg", "saints\saint-giovanni-ponti.jpg", "saints\saint-ruffino.jpg", "saints\santa-maria-marte.jpg", "saints\santo-marco.jpg")
        "Hosts" = @("hosts\locanda-del-monte.jpg", "hosts\rifugio-monte-sibilla.jpg")
    }
    
    $totalImages = 0
    $missingImages = 0
    
    foreach ($category in $categories.Keys) {
        Write-Host "`n$category`:" -ForegroundColor Cyan
        foreach ($image in $categories[$category]) {
            $totalImages++
            $imagePath = Join-Path $ImagesRoot $image
            if (Test-Path $imagePath) {
                $fileInfo = Get-Item $imagePath
                $sizeKB = [math]::Round($fileInfo.Length / 1KB, 2)
                Write-Host "  [OK] $image ($sizeKB KB)" -ForegroundColor Green
            } else {
                Write-Host "  [MISSING] $image" -ForegroundColor Red
                $missingImages++
            }
        }
    }
    
    Write-Host "`n=== Riepilogo ===" -ForegroundColor Cyan
    Write-Host "Totale immagini: $totalImages" -ForegroundColor Cyan
    if ($missingImages -eq 0) {
        Write-Host "Tutte le immagini sono presenti!" -ForegroundColor Green
    } else {
        Write-Host "Immagini mancanti: $missingImages" -ForegroundColor Yellow
    }
}

# Main script execution
Write-Host "`n================================================" -ForegroundColor Cyan
Write-Host "  Via dei Sette Santi - Image Manager" -ForegroundColor Cyan
Write-Host "================================================`n" -ForegroundColor Cyan

switch ($Action) {
    'check' {
        Test-Images
    }
    'download' {
        Write-Host "Download feature: Use PLACEHOLDER_IMAGES.md for instructions" -ForegroundColor Yellow
    }
    'optimize' {
        Write-Host "`n=== Ottimizzazione Immagini ===" -ForegroundColor Yellow
        Write-Host "Per ottimizzare le immagini, usa uno di questi strumenti:`n" -ForegroundColor Cyan
        Write-Host "  - TinyPNG: https://tinypng.com" -ForegroundColor Cyan
        Write-Host "  - Squoosh: https://squoosh.app" -ForegroundColor Cyan
        Write-Host "  - ImageOptim (Mac): https://imageoptim.com" -ForegroundColor Cyan
        Write-Host "  - RIOT (Windows): https://riot-optimizer.com" -ForegroundColor Cyan
        Write-Host "`nObiettivi di compressione:" -ForegroundColor Cyan
        Write-Host "  - Hero images: <500KB" -ForegroundColor Cyan
        Write-Host "  - Card images: <200KB" -ForegroundColor Cyan
        Write-Host "  - Gallery images: <300KB" -ForegroundColor Cyan
    }
    'gallery' {
        Write-Host "Gallery creation: See PLACEHOLDER_IMAGES.md" -ForegroundColor Yellow
    }
}

Write-Host "`nAltri comandi disponibili:" -ForegroundColor Cyan
Write-Host "  .\manage-images.ps1 -Action check     # Verifica immagini" -ForegroundColor Cyan
Write-Host "  .\manage-images.ps1 -Action optimize  # Info ottimizzazione" -ForegroundColor Cyan
Write-Host ""
