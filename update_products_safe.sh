#!/bin/bash

cp lib/data.ts lib/data.ts.products.bak
echo "Backup created: lib/data.ts.products.bak"

# BMW X5 XDRIVE 30D XLINE
perl -i -pe "s/name:.*Levi's.*?,/name: \"BMW X5 XDRIVE 30D XLINE\",/" lib/data.ts
perl -i -pe "s/category: 'Jeans'/category: 'BMW'/g" lib/data.ts
perl -i -pe "s/brand: 'Levi's'/brand: 'BMW X5 XDRIVE 30D XLINE'/g" lib/data.ts
perl -i -pe "s/price: .*,/price: 63463,/g" lib/data.ts
perl -i -pe "s/description: .*,/description: '2022 BMW X5 XDRIVE 30D XLINE',/g" lib/data.ts

# Essentials → BMW 3 SERIES 320I X DRIVE LUXURY
perl -i -pe "s/name:.*Essentials.*?,/name: \"BMW 3 SERIES 320I X DRIVE LUXURY\",/" lib/data.ts
perl -i -pe "s/brand: 'Essentials'/brand: 'BMW 3 SERIES 320I X DRIVE LUXURY'/g" lib/data.ts
perl -i -pe "s/price: .*,/price: 4814,/g" lib/data.ts
perl -i -pe "s/description: .*,/description: '2013 BMW 3 SERIES 320I X DRIVE LUXURY',/g" lib/data.ts

echo "✅ BMW replacements done!"

