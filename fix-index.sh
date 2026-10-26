#!/bin/bash

# 1. SHARED UI
for dir in src/shared/ui/*/; do
  if [ -d "$dir" ]; then
    name=$(basename "$dir")
    echo "export * from './ui/$name.jsx';" > "${dir}index.js"
  fi
done

# 2. ENTITIES, FEATURES, WIDGETS, PAGES
for dir in src/entities/*/ src/features/*/ src/widgets/*/ src/pages/*/; do
  if [ -d "$dir" ] && [ -f "${dir}ui/$(basename "$dir").jsx" ]; then
    name=$(basename "$dir")
    # Делаем имя с большой буквы (grant-card -> GrantCard)
    comp_name=$(echo "$name" | sed -r 's/(^|-)([a-z])/\U\2/g')
    echo "export { default as $comp_name } from './ui/$name.jsx';" > "${dir}index.js"
  fi
done

echo "✅ Все index.js перезаписаны корректно!"
