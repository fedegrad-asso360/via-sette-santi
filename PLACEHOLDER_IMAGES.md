# Immagini Placeholder - Via dei Sette Santi

Questa guida elenca tutte le immagini placeholder necessarie per il sito. Puoi scaricare le immagini da servizi come [Unsplash](https://unsplash.com) o [Pexels](https://pexels.com) cercando foto di montagne, sentieri, chiese e paesaggi dei Monti Sibillini.

> **📘 Documentazione Tecnica**: Per dettagli sull'architettura e le decisioni tecniche, consulta [IMAGES_TECHNICAL_GUIDE.md](IMAGES_TECHNICAL_GUIDE.md)

## 🏗️ Strategia Architetturale

**Posizione**: Tutte le immagini sono in `public/images/` (NON in `src/assets/`)

**Perché `public/` invece di `src/assets/`?**
1. **Content Collections**: Il frontmatter markdown usa riferimenti stringa, non import ES modules
2. **BASE_URL flessibile**: Funziona con qualsiasi configurazione di deployment
3. **Build veloci**: Nessuna elaborazione a tempo di build
4. **URL prevedibili**: Controllo diretto per SEO e social sharing
5. **Semplicità**: Facile aggiornamento senza rebuild

**Conforme a**: Astro best practices per siti content-driven con Content Collections

## 📋 Indice delle Immagini

### 1. Hero Carousel (Homepage)
**Posizione**: `public/images/hero-*.jpg`  
**Dimensioni consigliate**: 1920x800px  
**Formato**: JPG (ottimizzato)  
**Descrizione**: Immagini panoramiche dei Monti Sibillini, sentieri, paesaggi spirituali

- ✅ `hero-1.jpg` - Esistente
- ✅ `hero-2.jpg` - Esistente  
- ✅ `hero-3.jpg` - Esistente

**Suggerimenti per la ricerca**:
- Unsplash: "sibillini mountains", "mountain trail italy", "hiking path panorama"
- Pexels: "montagna italia", "sentiero trekking", "panorama montano"

---

### 2. Card Percorsi (Trail Cards)
**Posizione**: `public/images/trails/trail-*.jpg`  
**Dimensioni consigliate**: 800x600px  
**Formato**: JPG (ottimizzato)  
**Descrizione**: Immagini rappresentative di ogni tappa del percorso

**Immagini necessarie**:
- ⏳ `trail-1.jpg` - Tappa 1: Da San Ruffino a Rubbiano (dolci colline, Chiesa di San Ruffino)
- ⏳ `trail-2.jpg` - Tappa 2: Paesaggio di montagna, sentiero nel bosco
- ⏳ `trail-3.jpg` - Tappa 3: Sentiero panoramico, vista vallata
- ⏳ `trail-4.jpg` - Tappa 4: Cresta montana, panorama mozzafiato
- ⏳ `trail-5.jpg` - Tappa 5: Ritorno, paesaggio conclusivo

**Link placeholder temporanei** (sostituire con foto reali):
```
https://images.unsplash.com/photo-1551632811-561732d1e306?w=800&h=600&fit=crop
https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&h=600&fit=crop
https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=600&fit=crop
https://images.unsplash.com/photo-1519904981063-b0cf448d479e?w=800&h=600&fit=crop
https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=800&h=600&fit=crop
```

---

### 3. Copertina Percorsi (Trail Hero Images)
**Posizione**: `public/images/trails/trail-*.jpg` (stesse immagini delle card)  
**Dimensioni**: Le stesse immagini vengono usate sia per le card che per le copertine  
**Uso**: Hero section nella pagina dettaglio di ogni tappa

---

### 4. Card Santi e Chiese (Saint Cards)
**Posizione**: `public/images/saints/saint-*.jpg`  
**Dimensioni consigliate**: 600x800px (verticale)  
**Formato**: JPG (ottimizzato)  
**Descrizione**: Foto delle chiese dedicate ai sette santi

**Immagini necessarie**:
- ⏳ `saint-leonardo.jpg` - Chiesa di San Leonardo (nel bosco)
- ⏳ `saint-chiodo.jpg` - Chiesa di San Chiodo
- ⏳ `saint-giacomo.jpg` - Chiesa di San Giacomo
- ⏳ `saint-giovanni-ponti.jpg` - Chiesa di San Giovanni ai Ponti
- ⏳ `saint-ruffino.jpg` - Chiesa di San Ruffino
- ⏳ `santa-maria-marte.jpg` - Chiesa di Santa Maria in Muralto/Marte
- ⏳ `santo-marco.jpg` - Chiesa di Santo Marco

**Link placeholder temporanei** (sostituire con foto reali):
```
https://images.unsplash.com/photo-1519491050282-cf00c82424b4?w=600&h=800&fit=crop
https://images.unsplash.com/photo-1509002618996-d5aec2ebbb51?w=600&h=800&fit=crop
https://images.unsplash.com/photo-1548438294-1ad5d5f4f063?w=600&h=800&fit=crop
https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?w=600&h=800&fit=crop
https://images.unsplash.com/photo-1560062748-ec8d665e5363?w=600&h=800&fit=crop
https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=600&h=800&fit=crop
https://images.unsplash.com/photo-1516775453748-4701dd98cf71?w=600&h=800&fit=crop
```

**Suggerimenti per la ricerca**:
- "italian church countryside", "romanesque church italy", "church in mountains"
- "chiesa romanica", "chiesa campagna italiana", "santuario montagna"

---

### 5. Copertina Santi (Saint Hero Images)
**Posizione**: `public/images/saints/saint-*.jpg` (stesse immagini delle card)  
**Dimensioni**: Le stesse immagini vengono usate sia per le card che per le copertine  
**Uso**: Hero section nella pagina dettaglio di ogni santo/chiesa

---

### 6. Galleria Fotografica Percorsi
**Posizione**: `public/images/trails/gallery/trail-*-*.jpg`  
**Dimensioni consigliate**: 1200x800px  
**Formato**: JPG (ottimizzato)  
**Descrizione**: 4-6 immagini per ogni percorso che mostrano diversi momenti del cammino

**Struttura directory suggerita**:
```
public/images/trails/gallery/
  ├── trail-1-1.jpg
  ├── trail-1-2.jpg
  ├── trail-1-3.jpg
  ├── trail-1-4.jpg
  ├── trail-2-1.jpg
  ├── trail-2-2.jpg
  └── ...
```

**TODO**: Al momento la galleria mostra solo placeholder SVG. Implementare caricamento dinamico.

---

### 7. Strutture Ricettive (Accommodation/Hosts)
**Posizione**: `public/images/hosts/*.jpg`  
**Dimensioni consigliate**: 1200x800px  
**Formato**: JPG (ottimizzato)  
**Descrizione**: Foto esterne/interne delle strutture ricettive

**Immagini necessarie**:
- ⏳ `locanda-del-monte.jpg` - Locanda del Monte (Amandola)
- ⏳ `rifugio-monte-sibilla.jpg` - Rifugio Monte Sibilla

**Link placeholder temporanei**:
```
https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=1200&h=800&fit=crop
https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=1200&h=800&fit=crop
```

**Suggerimenti per la ricerca**:
- "italian mountain lodge", "mountain refuge italy", "country hotel italy"
- "rifugio montagna", "locanda italiana", "agriturismo marche"

---

## 🎨 Linee Guida per le Immagini

### Requisiti Tecnici
- **Formato**: JPG per fotografie, PNG per loghi/grafica
- **Compressione**: Ottimizzare per web (80-85% qualità)
- **Dimensione file**: Mantenere sotto 300KB per immagini card, 500KB per hero
- **Color space**: sRGB

### Stile Fotografico
- **Luminosità**: Immagini luminose, evitare foto troppo scure
- **Atmosfera**: Spirituale, contemplativa, naturale
- **Colori**: Tonalità naturali, privilegiare verdi, blu, marroni terrosi
- **Composizione**: Orizzonte non al centro, regola dei terzi
- **Soggetto**: Paesaggi, sentieri, chiese, natura incontaminata

### Licenze
- Preferire immagini con licenza **Creative Commons Zero (CC0)** o **dominio pubblico**
- Verificare sempre le condizioni d'uso
- Citare i fotografi quando richiesto

---

## 🔧 Strumenti Consigliati

### Siti per Immagini Gratuite
1. **Unsplash** - https://unsplash.com
2. **Pexels** - https://pexels.com
3. **Pixabay** - https://pixabay.com
4. **Wikimedia Commons** - https://commons.wikimedia.org

### Ottimizzazione Immagini
1. **TinyPNG** - https://tinypng.com (compressione lossy)
2. **Squoosh** - https://squoosh.app (controllo avanzato)
3. **ImageOptim** - https://imageoptim.com (Mac)
4. **RIOT** - https://riot-optimizer.com (Windows)

### Editing Base
1. **Photopea** - https://www.photopea.com (gratuito, online)
2. **GIMP** - https://www.gimp.org (gratuito, desktop)
3. **Canva** - https://www.canva.com (gratuito con limitazioni)

---

## 📥 Script di Download

Per scaricare rapidamente le immagini placeholder da Unsplash, puoi usare questo script PowerShell:

```powershell
# Scarica immagini placeholder per Trail Cards
$trailUrls = @(
    "https://images.unsplash.com/photo-1551632811-561732d1e306?w=800&h=600&fit=crop&q=85",
    "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&h=600&fit=crop&q=85",
    "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=600&fit=crop&q=85",
    "https://images.unsplash.com/photo-1519904981063-b0cf448d479e?w=800&h=600&fit=crop&q=85",
    "https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=800&h=600&fit=crop&q=85"
)

for ($i = 0; $i -lt $trailUrls.Count; $i++) {
    $num = $i + 1
    Invoke-WebRequest -Uri $trailUrls[$i] -OutFile "public\images\trails\trail-$num.jpg"
    Write-Host "Downloaded trail-$num.jpg"
}

# Scarica immagini placeholder per Saint Cards
$saintUrls = @(
    "https://images.unsplash.com/photo-1519491050282-cf00c82424b4?w=600&h=800&fit=crop&q=85",
    "https://images.unsplash.com/photo-1509002618996-d5aec2ebbb51?w=600&h=800&fit=crop&q=85",
    "https://images.unsplash.com/photo-1548438294-1ad5d5f4f063?w=600&h=800&fit=crop&q=85",
    "https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?w=600&h=800&fit=crop&q=85",
    "https://images.unsplash.com/photo-1560062748-ec8d665e5363?w=600&h=800&fit=crop&q=85",
    "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=600&h=800&fit=crop&q=85",
    "https://images.unsplash.com/photo-1516775453748-4701dd98cf71?w=600&h=800&fit=crop&q=85"
)

$saintNames = @("saint-leonardo", "saint-chiodo", "saint-giacomo", "saint-giovanni-ponti", "saint-ruffino", "santa-maria-marte", "santo-marco")

for ($i = 0; $i -lt $saintUrls.Count; $i++) {
    Invoke-WebRequest -Uri $saintUrls[$i] -OutFile "public\images\saints\$($saintNames[$i]).jpg"
    Write-Host "Downloaded $($saintNames[$i]).jpg"
}

# Scarica immagini placeholder per Hosts
$hostUrls = @(
    "https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=1200&h=800&fit=crop&q=85",
    "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=1200&h=800&fit=crop&q=85"
)

$hostNames = @("locanda-del-monte", "rifugio-monte-sibilla")

for ($i = 0; $i -lt $hostUrls.Count; $i++) {
    Invoke-WebRequest -Uri $hostUrls[$i] -OutFile "public\images\hosts\$($hostNames[$i]).jpg"
    Write-Host "Downloaded $($hostNames[$i]).jpg"
}

Write-Host "`nTutte le immagini placeholder sono state scaricate!"
```

---

## ✅ Checklist Finale

Prima di andare in produzione, assicurati di:

- [ ] Sostituire tutte le immagini placeholder con foto reali del percorso
- [ ] Ottimizzare tutte le immagini per web
- [ ] Verificare che i nomi dei file corrispondano ai riferimenti nel codice
- [ ] Aggiungere testi alt descrittivi per l'accessibilità
- [ ] Testare il caricamento delle immagini su tutti i browser
- [ ] Verificare le licenze e i crediti fotografici
- [ ] Implementare lazy loading per le gallerie
- [ ] Considerare l'uso di formati moderni (WebP/AVIF) con fallback

---

**Ultimo aggiornamento**: 2 Gennaio 2026  
**Note**: Questo documento verrà aggiornato man mano che vengono aggiunte nuove sezioni con immagini.
