# Immagini del Sito - Via dei Sette Santi

## 📁 Struttura delle Directory

```
public/images/
├── hero-1.jpg                    (1920x800) - Homepage carousel
├── hero-2.jpg                    (1920x800) - Homepage carousel
├── hero-3.jpg                    (1920x800) - Homepage carousel
├── logo.svg                      - Logo del sito
├── trails/                       - Immagini percorsi
│   ├── trail-1.jpg              (800x600)  - Tappa 1
│   ├── trail-2.jpg              (800x600)  - Tappa 2
│   ├── trail-3.jpg              (800x600)  - Tappa 3
│   ├── trail-4.jpg              (800x600)  - Tappa 4
│   ├── trail-5.jpg              (800x600)  - Tappa 5
│   └── gallery/                 - Galleria fotografica (TODO)
├── saints/                      - Immagini chiese e santi
│   ├── saint-leonardo.jpg       (600x800)  - Chiesa di San Leonardo
│   ├── saint-chiodo.jpg         (600x800)  - Chiesa di San Chiodo
│   ├── saint-giacomo.jpg        (600x800)  - Chiesa di San Giacomo
│   ├── saint-giovanni-ponti.jpg (600x800)  - Chiesa di San Giovanni ai Ponti
│   ├── saint-ruffino.jpg        (600x800)  - Chiesa di San Ruffino
│   ├── santa-maria-marte.jpg    (600x800)  - Chiesa di Santa Maria
│   └── santo-marco.jpg          (600x800)  - Chiesa di Santo Marco
└── hosts/                       - Immagini strutture ricettive
    ├── locanda-del-monte.jpg    (1200x800) - Locanda del Monte
    └── rifugio-monte-sibilla.jpg (1200x800) - Rifugio Monte Sibilla
```

## ✅ Stato delle Immagini

### Homepage - Carousel Hero
- ✅ hero-1.jpg - Esistente (originale)
- ✅ hero-2.jpg - Esistente (originale)
- ✅ hero-3.jpg - Esistente (originale)

### Percorsi (Trails)
- ✅ trail-1.jpg - Placeholder da Unsplash (montagna, sentiero)
- ✅ trail-2.jpg - Placeholder da Unsplash (montagna, natura)
- ✅ trail-3.jpg - Placeholder da Unsplash (paesaggio montano)
- ✅ trail-4.jpg - Placeholder da Unsplash (panorama montagna)
- ✅ trail-5.jpg - Placeholder da Unsplash (sentiero montano)

### Santi e Chiese (Saints)
- ✅ saint-leonardo.jpg - Placeholder da Unsplash
- ✅ saint-chiodo.jpg - Placeholder temporaneo (duplicato)
- ✅ saint-giacomo.jpg - Placeholder da Unsplash
- ✅ saint-giovanni-ponti.jpg - Placeholder da Unsplash
- ✅ saint-ruffino.jpg - Placeholder temporaneo (duplicato)
- ✅ santa-maria-marte.jpg - Placeholder da Unsplash
- ✅ santo-marco.jpg - Placeholder temporaneo (duplicato)

**Nota**: Alcune immagini dei santi sono duplicati temporanei. Sostituire con foto reali delle chiese.

### Strutture Ricettive (Hosts)
- ✅ locanda-del-monte.jpg - Placeholder da Unsplash
- ✅ rifugio-monte-sibilla.jpg - Placeholder da Unsplash

### Galleria Fotografica (Gallery)
- ⏳ trails/gallery/ - Directory creata, immagini da aggiungere

## 🎯 Prossimi Passi

### Priorità Alta
1. **Sostituire le foto dei santi duplicati** con immagini uniche delle chiese:
   - saint-chiodo.jpg
   - saint-ruffino.jpg
   - santo-marco.jpg

2. **Sostituire tutti i placeholder** con foto reali:
   - Foto effettive dei 5 percorsi
   - Foto reali delle 7 chiese
   - Foto autentiche delle strutture ricettive

### Priorità Media
3. **Aggiungere gallerie fotografiche** per ogni percorso:
   - 4-6 immagini per tappa in `trails/gallery/trail-X-Y.jpg`
   - Dimensione consigliata: 1200x800px

4. **Ottimizzare le immagini esistenti**:
   - Comprimere con TinyPNG o Squoosh
   - Target: <300KB per card, <500KB per hero

### Priorità Bassa
5. **Considerare formati moderni**:
   - Convertire in WebP/AVIF con fallback JPG
   - Implementare srcset per responsive images

## 📝 Note Tecniche

### Convenzioni di Naming
- **Trail images**: `trail-{numero}.jpg` (1-5)
- **Saint images**: `saint-{nome}.jpg` o `santa-{nome}.jpg` o `santo-{nome}.jpg`
- **Host images**: `{nome-struttura}.jpg` (kebab-case)
- **Gallery images**: `trail-{numero}-{sequenza}.jpg`

### Formati e Dimensioni
| Categoria | Dimensioni | Formato | Compressione |
|-----------|-----------|---------|--------------|
| Hero Carousel | 1920x800px | JPG | 80-85% |
| Trail Cards | 800x600px | JPG | 80-85% |
| Saint Cards | 600x800px | JPG | 80-85% |
| Host Hero | 1200x800px | JPG | 80-85% |
| Gallery | 1200x800px | JPG | 80-85% |

### Ottimizzazione
- **Obiettivo dimensione file**:
  - Hero: <500KB
  - Cards: <200KB
  - Gallery: <300KB
- **Color space**: sRGB
- **Progressive JPG**: Abilitato

## 🔗 Risorse Utili

### Fonti per Immagini Gratuite
- [Unsplash](https://unsplash.com) - Alta qualità, licenza libera
- [Pexels](https://pexels.com) - Vasta collezione
- [Pixabay](https://pixabay.com) - Royalty-free
- [Wikimedia Commons](https://commons.wikimedia.org) - Foto storiche/culturali

### Strumenti di Ottimizzazione
- [TinyPNG](https://tinypng.com) - Compressione intelligente
- [Squoosh](https://squoosh.app) - Controllo avanzato
- [ImageOptim](https://imageoptim.com) - Mac
- [RIOT](https://riot-optimizer.com) - Windows

### Keywords di Ricerca
**Per i percorsi**:
- "sibillini mountains trail"
- "italian mountain hiking path"
- "monti sibillini trekking"
- "marche mountains italy"

**Per le chiese**:
- "italian romanesque church"
- "countryside church italy"
- "chiesa romanica marche"
- "church in forest italy"

**Per le strutture**:
- "mountain lodge italy"
- "rifugio montagna marche"
- "agriturismo italy mountains"
- "italian country hotel"

## 📄 Licenze

**Immagini Placeholder Attuali**:
- Fonte: Unsplash.com
- Licenza: Unsplash License (uso commerciale consentito)
- Crediti: Verificare autori individuali su Unsplash

**Immagini Future**:
- Preferire licenze CC0 (Creative Commons Zero)
- Verificare sempre le condizioni d'uso
- Mantenere file CREDITS.md con elenco fotografi

---

**Ultimo aggiornamento**: 2 Gennaio 2026  
**Stato**: Placeholder operativi ✅ | Necessaria sostituzione con foto reali ⏳
