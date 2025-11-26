#!/bin/bash

# Backup first
cp lib/data.ts lib/data.ts.products.bak
echo "Backup created: lib/data.ts.products.bak"

# ---------------------------
# 1️⃣ BMW Products (formerly Jeans)
# ---------------------------
perl -0777 -i -pe "
s/name:.*Levi's.*?category: 'BMW'.*?brand:.*?price:.*?description:.*?,/name: 'BMW X5 XDRIVE 30D XLINE',\n    slug: toSlug('BMW X5 XDRIVE 30D XLINE'),\n    category: 'BMW',\n    price: 63463,\n    brand: 'BMW X5 XDRIVE 30D XLINE',\n    mileage: '24,411 km',\n    year: '2022',\n    engine: '2,993cc',\n    trans: 'AT',\n    fuel: 'Diesel',\n    description: '2022 BMW X5 XDRIVE 30D XLINE',/sg
" lib/data.ts

perl -0777 -i -pe "
s/name:.*Essentials.*?category: 'BMW'.*?brand:.*?price:.*?description:.*?,/name: 'BMW 3 SERIES 320I X DRIVE LUXURY',\n    slug: toSlug('BMW 3 SERIES 320I X DRIVE LUXURY'),\n    category: 'BMW',\n    price: 4814,\n    brand: 'BMW 3 SERIES 320I X DRIVE LUXURY',\n    mileage: '127,353 km',\n    year: '2013/1',\n    engine: '1,990cc',\n    trans: 'AT',\n    fuel: 'Petrol',\n    description: '2013 BMW 3 SERIES 320I X DRIVE LUXURY',/sg
" lib/data.ts

perl -0777 -i -pe "
s/name:.*Buffalo David Bitton.*?category: 'BMW'.*?brand:.*?price:.*?description:.*?,/name: 'BMW 2 SERIES 218D ACTIVE TOURER',\n    slug: toSlug('BMW 2 SERIES 218D ACTIVE TOURER'),\n    category: 'BMW',\n    price: 5783,\n    brand: 'BMW 2 SERIES 218D ACTIVE TOURER',\n    mileage: '122,200 km',\n    year: '2019/1',\n    engine: '1,990cc',\n    trans: 'AT',\n    fuel: 'Diesel',\n    description: '2019 BMW 2 SERIES 218D ACTIVE TOURER',/sg
" lib/data.ts

perl -0777 -i -pe "
s/name:.*Dickies.*?category: 'BMW'.*?brand:.*?price:.*?description:.*?,/name: 'BMW X5',\n    slug: toSlug('BMW X5'),\n    category: 'BMW',\n    price: 71083,\n    brand: 'BMW X5',\n    mileage: '79,215 km',\n    year: '2021',\n    engine: '2,993cc',\n    trans: 'AT',\n    fuel: 'Diesel',\n    description: '2021 BMW X5',/sg
" lib/data.ts

perl -0777 -i -pe "
s/name:.*Wrangler.*?category: 'BMW'.*?brand:.*?price:.*?description:.*?,/name: 'BMW X5 XDRIVE 45E XLINE',\n    slug: toSlug('BMW X5 XDRIVE 45E XLINE'),\n    category: 'BMW',\n    price: 60864,\n    brand: 'BMW X5 XDRIVE 45E XLINE',\n    mileage: '52,014 km',\n    year: '2013/1',\n    engine: '2,990cc',\n    trans: 'AT',\n    fuel: 'Petrol',\n    description: '2023 BMW X5 XDRIVE 45E XLINE',/sg
" lib/data.ts

perl -0777 -i -pe "
s/name:.*Silver Jeans Co.*?category: 'BMW'.*?brand:.*?price:.*?description:.*?,/name: 'BMW X5 XDRIVE 45E XLINE',\n    slug: toSlug('BMW X5 XDRIVE 45E XLINE'),\n    category: 'BMW',\n    price: 60864,\n    brand: 'BMW X5 XDRIVE 45E XLINE',\n    mileage: '52,014 km',\n    year: '2013/1',\n    engine: '2,990cc',\n    trans: 'AT',\n    fuel: 'Petrol',\n    description: '2023 BMW X5 XDRIVE 45E XLINE',/sg
" lib/data.ts

# ---------------------------
# 2️⃣ Honda Fit Products (formerly Shoes)
# ---------------------------
perl -0777 -i -pe "
s/brand: 'Skechers'/brand: 'HONDA FIT HYBRID'/g;
s/brand: 'DLWKIPV'/brand: 'HONDA FIT HYBRID L PACKAGE'/g;
s/brand: 'ASICS'/brand: 'HONDA FIT HYBRID NAVI PREMIUM SELECTION'/g;
s/brand: 'ziitop'/brand: 'HONDA FIT 13G F PACKAGE'/g;
s/brand: 'adidas'/brand: 'HONDA FIT HYBRID SMART SELECTION'/g;
s/brand: 'Generic'/brand: 'HONDA FIT HYBRID'/g;
" lib/data.ts

# (Add name, slug, price, mileage, year, engine, trans, fuel fields manually if needed)

# ---------------------------
# 3️⃣ Mercedes-Benz Products (formerly T-Shirts)
# ---------------------------
perl -0777 -i -pe "
s/brand: 'Jerzees'/brand: 'MERCEDES-BENZ M-CLASS ML350'/g;
s/brand: 'Muscle Cmdr'/brand: 'MERCEDES-BENZ C-CLASS C200 AVANTGARDE AMG LINE'/g;
s/brand: 'Nike'/brand: 'MERCEDES-BENZ C-CLASS HYBRID C350E AVANTGARDE'/g;
" lib/data.ts

# ---------------------------
# 4️⃣ Toyota Products (formerly Wrist Watches)
# ---------------------------
perl -0777 -i -pe "
s/brand: 'Fossil'/brand: 'TOYOTA LAND CRUISER PRADO 2019'/g;
s/brand: 'Seiko'/brand: 'TOYOTA HILUX REVO 2.4 E DOUBLE CAB'/g;
s/brand: 'Casio'/brand: 'TOYOTA HILUX 2.4 E REVO DOUBLE CAB'/g;
" lib/data.ts

echo "✅ All product replacements done!"

