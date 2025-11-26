#!/bin/bash

# Backup
cp lib/data.ts lib/data.ts.bak
echo "Backup created: lib/data.ts.bak"

# Replace site name
grep -Rl "WeBuy&SellCarsBotswana" . --exclude-dir=node_modules --exclude-dir=.next --exclude-dir=dist | xargs sed -i 's/WeBuy&SellCarsBotswana/WeBuy\&SellCarsBotswana/g'

# Update banners
grep -Rl "Most Popular Cars For Sale" . --exclude-dir=node_modules --exclude-dir=.next | xargs sed -i 's/Most Popular Cars For Sale/Most Popular Cars For Sale/g'
grep -Rl "Best Sellers In Mercedez Benz" . --exclude-dir=node_modules --exclude-dir=.next | xargs sed -i 's/Best Sellers In Mercedez Benz/Best Sellers In Mercedez Benz/g'
grep -Rl "Best Deals on BMW" . --exclude-dir=node_modules --exclude-dir=.next | xargs sed -i 's/Best Deals on BMW/Best Deals on BMW/g'

# Update categories
sed -i "s/category: 'Jeans'/category: 'BMW'/g" lib/data.ts
sed -i "s/category: 'T-Shirts'/category: 'Mercedez Benz'/g" lib/data.ts
sed -i "s/category: 'Shoes'/category: 'Honda Fit'/g" lib/data.ts
sed -i "s/category: 'Wrist Watches'/category: 'Toyota'/g" lib/data.ts

echo "Banners and categories updated!"

