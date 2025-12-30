# Design System - Via dei Sette Santi

Documentazione del sistema di design scalabile e riutilizzabile del progetto.

## Principi

1. **Coerenza**: Utilizzare le utility classes predefinite per mantenere uno stile uniforme
2. **Scalabilità**: Le classi sono progettate per essere riutilizzate in tutto il progetto
3. **Manutenibilità**: Modifiche centralizzate in `global.css` si propagano a tutto il sito
4. **Performance**: Riduzione della duplicazione del CSS

## Utility Classes Disponibili

### Layout & Container

#### `.container-custom`
Container principale del sito con larghezza massima e padding responsive.
- **Max-width**: 1280px
- **Padding mobile**: 1rem (con safe-area)
- **Padding tablet (≥768px)**: 1.5rem
- **Padding desktop (≥1024px)**: 2rem

```astro
<div class="container-custom">
  <!-- Contenuto -->
</div>
```

#### `.content-wrapper`
Wrapper per contenuto testuale, ottimizzato per leggibilità.
- **Max-width**: 800px
- **Uso**: Paragrafi, testo lungo, overview

```astro
<div class="content-wrapper">
  <p>Testo lungo e leggibile</p>
</div>
```

#### `.content-wrapper-lg`
Wrapper per contenuto più ampio.
- **Max-width**: 1200px
- **Uso**: Griglie di card, gallerie

```astro
<div class="content-wrapper-lg">
  <div class="grid-auto-fit">
    <!-- Cards -->
  </div>
</div>
```

### Sezioni

#### `.section`
Sezione principale con padding verticale responsive.
- **Padding desktop**: 5rem verticale
- **Padding tablet (≤1024px)**: 4rem verticale
- **Padding mobile (≤768px)**: 3rem verticale

```astro
<section class="section">
  <div class="container-custom">
    <!-- Contenuto sezione -->
  </div>
</section>
```

#### `.section-alt`
Sezione con sfondo alternativo (usa `--color-surface`).

```astro
<section class="section section-alt">
  <!-- Contenuto -->
</section>
```

#### `.section-header`
Header standard per le sezioni (centrato, con max-width).

```astro
<div class="section-header">
  <h2 class="section-title">Titolo</h2>
  <p class="section-subtitle">Sottotitolo descrittivo</p>
</div>
```

### Tipografia

#### `.section-title`
Titolo principale di sezione.
- **Desktop**: 2.5rem (40px)
- **Mobile**: 2rem (32px)
- **Font-weight**: 700

#### `.section-subtitle`
Sottotitolo di sezione.
- **Font-size**: 1.125rem (18px)
- **Color**: `--color-text-muted`

#### `.page-title`
Titolo principale di pagina.
- **Desktop**: 3rem (48px)
- **Mobile**: 2.25rem (36px)
- **Font-weight**: 700

#### `.card-title`
Titolo per card e componenti.
- **Font-size**: 1.5rem (24px)
- **Font-weight**: 600

#### `.text-muted`
Testo secondario/muted.
- **Color**: `--color-text-muted`

### Griglie

#### `.grid-auto-fit`
Griglia responsive con `auto-fit` (le colonne si espandono per riempire lo spazio).

**Personalizzazione tramite CSS variables**:
- `--grid-min-width`: Larghezza minima colonne (default: 300px)
- `--grid-gap`: Spaziatura tra elementi (default: 2rem)

```astro
<!-- Griglia con colonne minime di 350px -->
<div class="grid-auto-fit" style="--grid-min-width: 350px;">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>
```

#### `.grid-auto-fill`
Griglia responsive con `auto-fill` (crea tutte le colonne possibili, anche vuote).

```astro
<!-- Griglia per trail cards -->
<div class="grid-auto-fill" style="--grid-min-width: 350px;">
  {trails.map(trail => <TrailCard {...trail} />)}
</div>
```

**Responsive**: Su mobile (≤640px) entrambe le griglie diventano single-column con gap ridotto a 1.5rem.

### Componenti

#### `.info-box`
Box informativo con bordo e sfondo.
- **Padding desktop**: 2rem
- **Padding mobile**: 1.5rem
- **Bordo**: 1px solid
- **Shadow**: Leggera

```astro
<div class="info-box">
  <div class="info-item">
    <span class="info-item-label">Località:</span>
    <span class="info-item-value">Sibillini, Marche</span>
  </div>
</div>
```

#### `.info-item`
Elemento informativo (label + valore).

```astro
<div class="info-item">
  <span class="info-item-label">Durata:</span>
  <span class="info-item-value">4-5 ore</span>
</div>
```

#### `.feature-list` & `.feature-item`
Lista di caratteristiche/features.

```astro
<ul class="feature-list">
  <li class="feature-item">
    <svg class="feature-item-icon" width="20" height="20">
      <!-- Icon SVG -->
    </svg>
    Descrizione caratteristica
  </li>
</ul>
```

#### `.list-reset`
Reset stile lista (rimuove bullets e padding).

```astro
<ul class="list-reset">
  <li>Item 1</li>
  <li>Item 2</li>
</ul>
```

## Variabili CSS

Tutte le variabili sono definite in `src/styles/global.css` nel blocco `@theme`.

### Colori

```css
/* Primary - Arancione caldo */
--color-primary-600: #e35b04;
--color-primary-700: #bc4207;

/* Secondary - Blu scuro */
--color-secondary-600: #526078;
--color-secondary-900: #343b47;

/* Accent - Verde */
--color-accent-600: #16a34a;

/* Semantici */
--color-background: light-dark(#ffffff, #0f172a);
--color-surface: light-dark(#f8fafc, #1e293b);
--color-text: light-dark(#0f172a, #f1f5f9);
--color-text-muted: light-dark(#64748b, #94a3b8);
--color-border: light-dark(#e2e8f0, #334155);
```

### Spacing

```css
--spacing-4: 1rem;    /* 16px */
--spacing-6: 1.5rem;  /* 24px */
--spacing-8: 2rem;    /* 32px */
--spacing-12: 3rem;   /* 48px */
--spacing-16: 4rem;   /* 64px */
--spacing-20: 5rem;   /* 80px */
```

### Border Radius

```css
--radius-md: 0.375rem;
--radius-lg: 0.5rem;
--radius-xl: 0.75rem;
--radius-2xl: 1rem;
--radius-full: 9999px;
```

### Shadows

```css
--shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
--shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
--shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
--shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1);
```

## Pattern di Utilizzo Comuni

### Pagina Standard

```astro
<BaseLayout>
  <section class="section">
    <div class="container-custom">
      <div class="section-header">
        <h1 class="page-title">Titolo Pagina</h1>
        <p class="section-subtitle">Descrizione breve</p>
      </div>

      <div class="content-wrapper">
        <!-- Contenuto principale -->
      </div>
    </div>
  </section>
</BaseLayout>
```

### Lista di Card

```astro
<section class="section section-alt">
  <div class="container-custom">
    <div class="section-header">
      <h2 class="section-title">I Nostri Trail</h2>
      <p class="section-subtitle">5 tappe attraverso i Monti Sibillini</p>
    </div>

    <div class="grid-auto-fill" style="--grid-min-width: 350px;">
      {trails.map(trail => <TrailCard {...trail} />)}
    </div>
  </div>
</section>
```

### Info Box con Dettagli

```astro
<div class="content-wrapper">
  <div class="info-box">
    <div class="info-item">
      <strong class="info-item-label">Località:</strong>
      <span class="info-item-value">Monti Sibillini, Marche</span>
    </div>
    <div class="info-item">
      <strong class="info-item-label">Periodo migliore:</strong>
      <span class="info-item-value">Maggio - Ottobre</span>
    </div>
  </div>
</div>
```

## Best Practices

1. **Usa sempre le utility classes quando disponibili** invece di creare CSS custom
2. **Combina le classi** per costruire layout complessi (es: `section section-alt`)
3. **Personalizza con CSS variables** inline quando necessario (es: `--grid-min-width`)
4. **Crea CSS custom solo per stili veramente specifici** del componente
5. **Mantieni la coerenza**: usa sempre gli stessi spacing, colori, font-size
6. **Test responsive**: verifica sempre su mobile, tablet, desktop

## Estendere il Sistema

Per aggiungere nuove utility classes:

1. Aggiungi la classe nel blocco `@layer utilities` in `src/styles/global.css`
2. Usa variabili CSS per valori configurabili
3. Includi breakpoint responsive se necessario
4. Documenta la nuova classe in questo file
5. Aggiorna gli esempi di utilizzo

## Componenti Astro Standard

I componenti riutilizzabili del progetto già utilizzano questo sistema:

- `BookingSection.astro` - Usa `section-header`, `grid-auto-fit`, `content-wrapper-lg`
- `TrailCard.astro` - Usa `card-title`, custom styles per layout card
- `SaintCard.astro` - Usa `card-title`, custom styles per layout card
- `ReviewCard.astro` - Usa custom styles specifici per reviews

Quando crei nuovi componenti, riutilizza queste utility classes per mantenere coerenza.
