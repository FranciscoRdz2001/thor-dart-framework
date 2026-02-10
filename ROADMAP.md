# Thor UI - Roadmap de Optimizacion

## Analisis del HTML actual

El HTML generado para una pagina simple produce **~40 nodos DOM** con inline styles repetitivos.
A medida que la app crezca, esto impactara rendering, memoria y mantenibilidad.

---

## 1. Estilos inline repetidos → CSS classes generadas

**Problema**: Cada elemento tiene un `style=""` completo. Si hay 100 Rows en la pagina, hay 100 atributos `style` identicos. El browser no puede optimizar ni cachear estilos inline.

```html
<!-- Actual: repetido en CADA Row -->
<div style="display: flex; flex-direction: row; justify-content: flex-start; align-items: flex-start; align-self: stretch">
<div style="display: flex; flex-direction: row; justify-content: flex-start; align-items: flex-start; align-self: stretch">
<div style="display: flex; flex-direction: row; justify-content: flex-start; align-items: flex-start; align-self: stretch">
```

**Propuesta**: Generar un `<style>` con clases CSS basadas en hash del estilo. Componentes con los mismos estilos comparten la misma clase.

```html
<style>
  .th-a3f2 { display: flex; flex-direction: row; justify-content: flex-start; align-items: flex-start; align-self: stretch; }
  .th-b1c4 { display: flex; flex-direction: column; min-width: 0; flex: 1; }
</style>
<div class="Row th-a3f2">...</div>
<div class="Row th-a3f2">...</div>
<div class="Row th-a3f2">...</div>
```

**Beneficio**:
- Reduce el tamano del DOM significativamente
- El browser cachea y reutiliza clases CSS (CSSOM optimizado)
- Menor recalculo de estilos en repaint/reflow

**Implementacion**: StyleRegistry en el renderer que acumula estilos unicos, genera hashes, e inyecta un `<style>` al iniciar.

---

## 2. Shorthand CSS en generador

**Problema**: El generador produce propiedades individuales donde existen shorthands CSS.

```html
<!-- Actual -->
border-top-left-radius: 12px; border-top-right-radius: 12px; border-bottom-right-radius: 12px; border-bottom-left-radius: 12px;

<!-- Optimo -->
border-radius: 12px;
```

**Propuesta**: En `BorderRadius.toCss()`, detectar cuando todos los valores son iguales y emitir shorthand. Aplicar la misma logica a:
- `border-radius` (4 esquinas → 1 shorthand)
- `padding` / `margin` (4 lados → shorthand con 1-4 valores)
- `gap` (ya es shorthand)

**Beneficio**: Reduce ~60% del tamano de strings de estilo para componentes decorados.

---

## 3. Divs spacer vacios → gap o margin

**Problema**: Se usan `Box(height: 40.px)` como spacers, generando divs vacios en el DOM.

```html
<div class="Box" style="height: 40px"></div>  <!-- nodo DOM innecesario -->
```

**Opciones**:
- **Opcion A - SizedBox**: Crear `SizedBox` (como Flutter) que sea un nodo ligero o que el renderer trate como spacer virtual sin crear DOM
- **Opcion B - gap en Column**: El `gap` de CSS Flexbox ya resuelve esto: `Column(gap: 40.px)` elimina la necesidad de spacers
- **Opcion C - Margin/Padding en hijos**: Usar `Padding` en el hijo directamente

**Recomendacion**: Opcion B (gap) para espaciado uniforme. Crear `SizedBox` para espaciado variable.

---

## 4. Reduccion de nesting innecesario

**Problema**: Algunos componentes crean wrappers que solo pasan propiedades sin agregar valor visual.

```html
<!-- Expanded crea un div solo para flex:1, y dentro el hijo ya es otro div -->
<div class="Expanded" style="display: flex; flex-direction: column; min-width: 0; flex: 1">
  <div class="Column" style="display: flex; flex-direction: column; ...">
    ...
  </div>
</div>
```

**Propuesta**: "Style merging" — cuando un componente wrapper (Expanded, Padding, Center) tiene un solo hijo que es un ElementNode, fusionar los estilos en un solo nodo DOM.

```html
<!-- Antes: 2 divs -->
<div class="Expanded" style="flex: 1; display: flex; flex-direction: column; min-width: 0">
  <div class="Column" style="display: flex; flex-direction: column; ...">

<!-- Despues: 1 div -->
<div class="Column" style="display: flex; flex-direction: column; ...; flex: 1; min-width: 0">
```

**Beneficio**: Reduce nodos DOM a la mitad en muchos casos. Menos nodos = menos layout/paint.

**Complejidad**: Alta. Requiere un paso de optimizacion en el reconciliador antes de aplicar al DOM.

---

## 5. Propiedades CSS por defecto omitibles

**Problema**: Se generan propiedades CSS que son el valor por defecto del browser.

```html
justify-content: flex-start;  <!-- es el default de flexbox -->
align-items: flex-start;      <!-- stretch es el default, pero flex-start no agrega nada si no hay altura -->
```

**Propuesta**: No emitir valores que coincidan con los defaults de CSS:
- `justify-content: flex-start` → omitir (es default)
- `align-items: stretch` → omitir (es default)
- `flex-direction: row` → omitir (es default)
- `flex: 0 1 auto` → omitir (es default)

**Beneficio**: Reduce ~30% del tamano de estilos. Menos propiedades = menos trabajo del CSSOM.

**Implementacion**: En `Flex._$styles`, condicionar la emision al valor no-default:
```dart
if (direction != FlexDirection.row) 'flex-direction: ${direction.toStyle()}'
if (mainAxisAlignment != MainAxisAlignment.start) 'justify-content: ...'
```

---

## 6. Reconciliacion y DOM diffing optimizado

**Problema actual** (para futuro): Si `setState` reconstruye el arbol, se regeneran todos los nodos aunque pocos cambien.

**Propuesta**: Implementar Virtual DOM diffing con keys:
- **Keyed reconciliation**: Reusar nodos DOM existentes, solo actualizar atributos que cambien
- **shouldComponentUpdate**: Permitir que componentes indiquen si necesitan rebuild
- **Dirty tracking**: Solo recorrer subarboles que tienen state changes

---

## 7. Lazy rendering para listas largas

**Problema futuro**: Una lista con 1000 items crearia 1000+ nodos DOM.

**Propuesta**: `ListView.builder` (como Flutter) que solo renderiza items visibles usando Intersection Observer o scroll position.

---

## Prioridad sugerida

| Prioridad | Optimizacion | Impacto | Esfuerzo |
|-----------|-------------|---------|----------|
| 1 | Shorthand CSS (#2) | Medio | Bajo |
| 2 | Omitir defaults CSS (#5) | Medio | Bajo |
| 3 | SizedBox / gap (#3) | Bajo | Bajo |
| 4 | CSS classes generadas (#1) | Alto | Medio |
| 5 | Style merging (#4) | Alto | Alto |
| 6 | Reconciliacion optimizada (#6) | Alto | Alto |
| 7 | Lazy rendering (#7) | Alto | Alto |

Los items 1-3 son quick wins que se pueden hacer ya. Los items 4-7 son arquitecturales y se benefician de planificacion.
