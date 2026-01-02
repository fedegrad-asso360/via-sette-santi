# 📐 Technical Guide: Image Management Strategy

## Overview

This document explains the technical decisions behind the image management strategy for the Via dei Sette Santi website, ensuring compliance with Astro best practices and optimal performance for SEO.

---

## 🏗️ Architecture Decision: `public/` vs `src/assets/`

### Current Implementation: `public/images/` ✅

**Decision**: All images are stored in `public/images/` and referenced via `${import.meta.env.BASE_URL}images/...`

### Why This Approach?

#### 1. Content Collections Compatibility
```typescript
// Content frontmatter (trails/en/trail-1.md)
---
image: trail-1.jpg  // String reference, not import
---
```

Content Collections use markdown files with frontmatter that references images as **strings**, not ES module imports. The `public/` directory allows direct string-based URLs.

#### 2. Dynamic BASE_URL Support
```typescript
// Works with any deployment configuration
const imagePath = `${import.meta.env.BASE_URL}images/trails/${page.data.image}`;
```

Supports deployment to:
- Root domain: `https://example.com/` (`BASE_URL = '/'`)
- Subdirectory: `https://example.com/app/` (`BASE_URL = '/app/'`)
- GitHub Pages: `https://username.github.io/repo/` (`BASE_URL = '/repo/'`)

#### 3. No Build-Time Processing
- **Faster builds**: Images aren't processed by Vite/Astro build pipeline
- **Predictable output**: Image URLs match exactly as written
- **Simple debugging**: No webpack magic or module resolution

#### 4. SEO & Social Media
```html
<!-- Open Graph tags with direct URLs -->
<meta property="og:image" content="https://example.com/images/trails/trail-1.jpg">
```

Search engines and social media crawlers prefer direct, predictable URLs.

---

## 📊 Performance Strategy

### Current Optimizations

| Optimization | Implementation | Status |
|--------------|----------------|--------|
| Progressive JPG | Manual pre-optimization | ✅ |
| Lazy Loading | `loading="lazy"` attribute | ✅ |
| Async Decoding | `decoding="async"` attribute | ✅ |
| Dimensions Set | `width` & `height` attributes | ✅ |
| CLS Prevention | Explicit dimensions | ✅ |
| Preload Critical | BaseLayout `preloadImage` prop | ✅ |
| File Size Limits | <500KB hero, <200KB cards | ✅ |

### Performance Metrics

**Target Lighthouse Scores:**
- Performance: 95+
- SEO: 100
- Accessibility: 95+
- Best Practices: 100

**Core Web Vitals:**
- **LCP** (Largest Contentful Paint): <2.5s
  - Hero images preloaded
  - Optimized file sizes
- **CLS** (Cumulative Layout Shift): <0.1
  - All images have explicit width/height
- **FID** (First Input Delay): <100ms
  - Minimal JavaScript, no image processing client-side

---

## 🎯 Image Specifications

### Size Guidelines

| Category | Dimensions | Aspect Ratio | Max File Size | Format |
|----------|-----------|--------------|---------------|--------|
| Hero Carousel | 1920×800px | 2.4:1 | 500KB | JPG |
| Trail Card/Hero | 800×600px | 4:3 | 200KB | JPG |
| Saint Card/Hero | 600×800px | 3:4 | 200KB | JPG |
| Host Card/Hero | 1200×800px | 3:2 | 300KB | JPG |
| Trail Gallery | 1200×800px | 3:2 | 300KB | JPG |
| Logo | 150×150px | 1:1 | N/A | SVG |

### Naming Conventions

```
public/images/
├── hero-{n}.jpg              # n = 1-3 (carousel)
├── trails/
│   ├── trail-{n}.jpg        # n = 1-5 (stage number)
│   └── gallery/
│       └── trail-{n}-{m}.jpg # n = stage, m = sequence
├── saints/
│   └── saint-{name}.jpg      # kebab-case saint name
└── hosts/
    └── {host-name}.jpg       # kebab-case facility name
```

### Compression Settings

**JPEG Quality**: 80-85%
- Below 80%: Visible artifacts
- Above 85%: Diminishing returns on file size

**Progressive JPEG**: Enabled
- Better perceived loading
- Displays low-res version while downloading

**Color Space**: sRGB
- Web standard
- Consistent across devices

**Metadata**: Stripped
- Remove EXIF data (GPS, camera info)
- Reduces file size by 10-30KB

---

## 🔧 Implementation Details

### Image Component Pattern

```astro
---
// pages/[lang]/trails/[...slug].astro
const imagePath = page.data.image 
  ? `${import.meta.env.BASE_URL}images/trails/${page.data.image}` 
  : undefined;
---

<BaseLayout
  title={pageTitle}
  ogImage={imagePath}
  preloadImage={imagePath}
>
  {imagePath && (
    <img
      src={imagePath}
      alt={page.data.title}
      width={800}
      height={600}
      loading="eager"
      decoding="async"
      class="w-full h-full object-cover"
    />
  )}
</BaseLayout>
```

### Card Component Pattern

```astro
---
// components/TrailCard.astro
interface Props {
  image?: string;
  title: string;
}
const { image, title } = Astro.props;
---

{image && (
  <div class="card-image">
    <img 
      src={`${import.meta.env.BASE_URL}images/trails/${image}`}
      alt={title}
      width={800}
      height={600}
      loading="lazy"
      decoding="async"
    />
  </div>
)}
```

### Preloading Critical Images

```astro
---
// layouts/Base.astro
interface Props {
  preloadImage?: string;
}
const { preloadImage } = Astro.props;
---

<head>
  {preloadImage && (
    <link
      rel="preload"
      as="image"
      href={preloadImage}
    />
  )}
</head>
```

---

## 🚀 Future Enhancements

### Phase 1: Modern Format Support (Q2 2026)

Add WebP/AVIF with JPG fallback:

```astro
<picture>
  <source type="image/avif" srcset="image.avif" />
  <source type="image/webp" srcset="image.webp" />
  <img src="image.jpg" alt="..." />
</picture>
```

**Benefits**:
- 25-35% smaller files (WebP)
- 50% smaller files (AVIF)
- Backwards compatibility maintained

### Phase 2: Responsive Images (Q3 2026)

Implement `srcset` for different screen sizes:

```astro
<img
  src="trail-1-800.jpg"
  srcset="
    trail-1-400.jpg 400w,
    trail-1-800.jpg 800w,
    trail-1-1200.jpg 1200w
  "
  sizes="(max-width: 768px) 100vw, 50vw"
  alt="Trail"
/>
```

### Phase 3: Astro Image Component (Q4 2026)

For **non-content** images (logos, icons, UI elements):

```astro
---
import { Image } from 'astro:assets';
import logo from '../assets/logo.png';
---

<Image src={logo} alt="Logo" />
```

**Note**: Keep `public/` for content-driven images from Collections.

### Phase 4: CDN Integration (2027)

- Cloudinary or Imgix for on-the-fly transformations
- Global edge caching
- Automatic format detection

---

## 📋 Developer Checklist

When adding new images:

- [ ] Correct directory: `public/images/{category}/`
- [ ] Correct dimensions (see specifications table)
- [ ] Optimized (<200-500KB depending on type)
- [ ] Progressive JPEG enabled
- [ ] EXIF metadata removed
- [ ] Descriptive filename (kebab-case)
- [ ] Alt text defined in code
- [ ] Width/height attributes set
- [ ] `loading="lazy"` for below-fold images
- [ ] Referenced correctly with `BASE_URL`

---

## 🧪 Testing

### Manual Testing

```bash
# Build the site
npm run build

# Check image paths
grep -r "images/" dist/

# Verify BASE_URL handling
BASE=/subdir npm run build
```

### Automated Testing

```powershell
# Verify all images exist
.\manage-images.ps1 -Action check

# Check file sizes
Get-ChildItem public\images -Recurse | Where-Object {$_.Length -gt 500KB}
```

### Performance Testing

1. **Lighthouse**: Run in Chrome DevTools
2. **WebPageTest**: https://www.webpagetest.org
3. **GTmetrix**: https://gtmetrix.com

---

## 📚 References

### Astro Documentation
- [Assets (Images)](https://docs.astro.build/en/guides/images/)
- [Static Assets](https://docs.astro.build/en/guides/imports/)
- [Content Collections](https://docs.astro.build/en/guides/content-collections/)

### Web Performance
- [Web.dev Image Performance](https://web.dev/fast/#optimize-your-images)
- [Core Web Vitals](https://web.dev/vitals/)
- [Cumulative Layout Shift](https://web.dev/cls/)

### Image Optimization
- [TinyPNG](https://tinypng.com) - Compression
- [Squoosh](https://squoosh.app) - Advanced control
- [ImageOptim](https://imageoptim.com) - Batch processing

---

## 🤔 FAQ

### Q: Why not use Astro's Image component?

**A**: Astro's `<Image>` component requires static imports, which don't work with Content Collections' markdown frontmatter. Our dynamic, string-based approach is more flexible for content-driven sites.

### Q: Can I use images from `src/assets/`?

**A**: Yes, but only for **static, non-content** images (logos, icons). Content images should remain in `public/`.

### Q: What about responsive images?

**A**: Currently using fixed sizes. Phase 2 (Q3 2026) will add `srcset` support.

### Q: Do images slow down the build?

**A**: No. Images in `public/` are copied as-is, not processed. This keeps builds fast.

### Q: How do I convert to WebP?

**A**: Use Squoosh or ImageOptim. Create `.webp` versions alongside `.jpg`, then update HTML to use `<picture>` elements.

---

**Last Updated**: January 2, 2026  
**Maintained By**: Development Team  
**Review Cycle**: Quarterly
